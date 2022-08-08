import 'dart:io';
import 'package:final_project/bloc/task/task_cubit.dart';
import 'package:final_project/bloc/task/task_cubit.dart';
import 'package:final_project/utlis/utlis.dart';
import 'package:final_project/views/components/drawer.dart';
import 'package:final_project/views/single_task_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final recorder=FlutterSoundRecorder();
  // bool isRecorderReady=false;
  //
  // @override
  // void initState()
  // {
  //   super.initState();
  //   initRecorder();
  // }
  //
  // @override
  // void dispose() {
  //   recorder.closeRecorder();
  //   super.dispose();
  // }
  //
  // Future initRecorder()async
  // {
  //   final status=await Permission.microphone.request();
  //   if(status!=PermissionStatus.granted)
  //     {
  //       throw'Microphone permission is not granted';
  //     }
  //   await recorder.openRecorder();
  //   isRecorderReady=true;
  //   recorder.setSubscriptionDuration(Duration(microseconds: 500));
  // }
  // Future record()async
  // {
  //   await recorder.startRecorder(toFile: '');
  // }
  //
  // Future stop()async
  // {
  //   await recorder.stopRecorder();
  // }
  // File?image;
  // Future pickImage(ImageSource source) async
  // {
  //   try {
  //     final image = await ImagePicker().pickImage(source: source);
  //     if (image == null) return;
  //     final imageTemporary = File(image.path);
  //     setState(() => this.image = imageTemporary);
  //   } on PlatformException catch (e) {
  //     print('filed to pick image$e');
  //   }
  // }

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    TaskCubit.get(context).getAllTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit, TaskState>(
      listener: (context, state) {},
      builder: (context, state) {
        var taskCubit=TaskCubit.get(context);
        return Scaffold(
          drawer: Drawerr(),
          appBar: AppBar(
            backgroundColor: HexColor("492F24"),
            title: Text('HomeScreen',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: HexColor("#FFE3C5"),
              ),),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.all(20.0),
            child: taskCubit.getAllTaskModel==null?
             Center(
                child: CircularProgressIndicator(
                  color: HexColor("#FFE3C5"),
                )):
            ListView.separated(
                separatorBuilder: (context, index)=>Padding(
                  padding: const EdgeInsetsDirectional.only(start: 50,end: 50),
                  child: Container(
                    width: double.infinity,
                    height: 1,
                    color: HexColor("#FFE3C5"),
                  ),
                ),
                itemCount:taskCubit.getAllTaskModel!.response!.data!.length,
                itemBuilder: (context, index) {
                  return InkWell
                    (
                    onTap: ()
                    {
                      AppNavigator.customNavigator(
                          context: context,
                          screen: SingleTaskScreen(
                            id: taskCubit.getAllTaskModel!.response!.data![index].id,
                            title: taskCubit.getAllTaskModel!.response!.data![index].title,
                            description: taskCubit.getAllTaskModel!.response!.data![index].description,
                            startdate: taskCubit.getAllTaskModel!.response!.data![index].startDate,
                          ),
                          finish: false,
                      );
                    },
                    child: Row(
                      children:
                      [
                        CircleAvatar(
                          radius: 40,
                          child:
                          taskCubit.image!=null?Image.file(taskCubit.image!,
                          width: 40,
                            height: 30,
                          ):Container(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:
                            [
                              Row(
                                children: [
                                  Text(taskCubit.getAllTaskModel!.response!.data![index].title.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),),
                                ],
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Row(
                                children:
                                [
                                  Text(taskCubit.getAllTaskModel!.response!.data![index].startDate.toString(),
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  ),),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(taskCubit.getAllTaskModel!.response!.data![index].endDate.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),),
                                ],
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: ()
                          async {
                            await taskCubit.deleteTaskById(taskCubit.getAllTaskModel!.response!.data![index].id);
                            taskCubit.getAllTasks();
                          },
                          icon: Icon(Icons.delete_forever),
                        ),
                      ],
                    ),
                  );
                })),
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: HexColor("492F24"),
            label: Text("New Task",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: HexColor("#FFE3C5"),
              ),),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) =>
                    FractionallySizedBox(
                      heightFactor: 0.8,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text('Get Started!',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: taskCubit.titleController,
                                  keyboardType: TextInputType.text,
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Title must not be empty!';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Title',
                                    prefixIcon: Icon(
                                        Icons.drive_file_rename_outline),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: taskCubit.descriptionController,
                                  keyboardType: TextInputType.text,
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Description must not be empty!';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Description',
                                    prefixIcon: Icon(
                                        Icons.description_outlined),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: taskCubit.startDateController,
                                  keyboardType: TextInputType.datetime,
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2024-07-23'),
                                    ).then((value) {
                                      taskCubit.startDateController.text =
                                          DateFormat.yMMMd().format(value!);
                                    });
                                  },
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Start Date Must Not Be Empty';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Start Date',
                                    prefixIcon: Icon(Icons.calendar_today),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: taskCubit.endDateController,
                                  keyboardType: TextInputType.datetime,
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2024-07-23'),
                                    ).then((value) {
                                      taskCubit.endDateController.text =
                                      //TODO: fix data format
                                          DateFormat.yMMMd().format(value!);
                                      print(DateFormat.yMMMd().format(value));
                                    });
                                  },
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'End Date Must Not Be Empty';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'End Date',
                                    prefixIcon: Icon(Icons.calendar_today),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: HexColor("#FFE3C5"),
                                  ),
                                  onPressed: () {
                                    taskCubit.pickImage(ImageSource.gallery);
                                  },
                                  child: Text('Pick Image ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: HexColor("492F24"),
                                      fontSize: 25,
                                    ),),
                                ),
                                const SizedBox(
                                  height: 70,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: HexColor("#FFE3C5"),
                                  ),
                                  onPressed: ()
                                  async {
                                      if (formKey.currentState!.validate())
                                      {
                                        if(taskCubit.image!=null)
                                          {
                                            await taskCubit.saveTask(
                                              taskCubit.titleController.text,
                                              taskCubit.descriptionController.text,
                                              taskCubit.image,
                                              taskCubit.voiceController.text,
                                              taskCubit.startDateController.text,
                                              taskCubit.endDateController.text,
                                            );
                                          }
                                      }
                                      taskCubit.getAllTasks();
                                  },
                                  child: Text('Save',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: HexColor("492F24"),
                                      fontSize: 25,
                                    ),),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
              );
            },
          ),
        );
      },
    );
  }
}


