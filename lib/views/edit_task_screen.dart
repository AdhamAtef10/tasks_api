import 'package:final_project/bloc/task/task_cubit.dart';
import 'package:final_project/models/get_task_by_id.dart';
import 'package:final_project/utlis/utlis.dart';
import 'package:final_project/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class EditTaskScreen extends StatefulWidget {
  var id;
  final title;
  final description;
  final startdate;
  final enddate;
  final voice;
  final image;

  EditTaskScreen(
      {super.key,this.id, required this.title, required this.description, required this.startdate, required this.enddate, this.voice, this.image});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();

}

class _EditTaskScreenState extends State<EditTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController voiceController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController endDateController=TextEditingController();
  @override
  void initState() {

    titleController.text = widget.title;
    descriptionController.text = widget.description;
    startDateController.text = widget.startdate;
    // endDateController.text = widget.enddate;
    // voiceController.text=widget.voice;
    // imageController.text=widget.image;
    super.initState();
  }

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("492F24"),
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(
            color: HexColor("#FFE3C5"),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: BlocConsumer<TaskCubit,TaskState>(
              listener: (context, state) {},
              builder: (context, state) {
                var editTask=TaskCubit.get(context);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/image.jpg',
                        width: 260,
                        height: 200,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Title:',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: titleController,
                            keyboardType: TextInputType.text,
                            onChanged: (value)
                            {
                              editTask.titleController.text=value;
                            },
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Title must not be empty!';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Description:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: descriptionController,
                            keyboardType: TextInputType.text,
                            onChanged: (value)
                            {
                              editTask.descriptionController.text=value;

                            },
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Description must not be empty!';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [

                        const Text(
                          'Start Date:',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: startDateController,
                            keyboardType: TextInputType.datetime,
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.parse('2023-07-23'),
                              ).then((value) {
                                startDateController.text =
                                    DateFormat.yMMMd().format(value!);
                              });
                            },
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Start Date must not be empty!';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // Row(
                    //   children: [
                    //     const Text(
                    //       'End Date:',
                    //       style: TextStyle(
                    //         fontSize: 15,
                    //         color: Colors.grey,
                    //       ),
                    //     ),
                    //     const SizedBox(
                    //       width: 10,
                    //     ),
                    //     Expanded(
                    //       child: TextFormField(
                    //         controller:endDateController,
                    //         keyboardType: TextInputType.datetime,
                    //         onTap: () {
                    //           showDatePicker(
                    //             context: context,
                    //             initialDate: DateTime.now(),
                    //             firstDate: DateTime.now(),
                    //             lastDate: DateTime.parse('2023-07-23'),
                    //           ).then((value) {
                    //             endDateController.text =
                    //                 DateFormat.yMMMd().format(value!);
                    //           });
                    //         },
                    //         validator: (String? value) {
                    //           if (value!.isEmpty) {
                    //             return 'End Date must not be empty!';
                    //           }
                    //           return null;
                    //         },
                    //         decoration: const InputDecoration(
                    //           border: OutlineInputBorder(),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: HexColor("#FFE3C5"),
                        ),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await editTask.editTask(
                              editTask.getTaskByIdd!.response!.id,
                                titleController.text,
                                descriptionController.text,
                                startDateController.text,
                            );
                            AppNavigator.customNavigator(
                                context: context,
                                screen: HomeScreen(),
                                finish: false,
                            );
                            editTask.getAllTasks();
                          }
                          print(editTask.getTaskByIdd!.response!.id);
                          print(titleController.text);
                          print(descriptionController.text);
                          print(startDateController.text);
                        },
                        child: Text('Update',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: HexColor("492F24"),
                            fontSize: 25,
                          ),),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
