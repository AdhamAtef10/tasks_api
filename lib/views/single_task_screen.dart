import 'package:final_project/bloc/task/task_cubit.dart';
import 'package:final_project/utlis/utlis.dart';
import 'package:final_project/views/edit_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SingleTaskScreen extends StatefulWidget {
  int? id;
  final title;
  final description;
  final startdate;
  final enddate;

  SingleTaskScreen({
    required this.id,
    this.title,
    this.description,
    this.startdate,
    this.enddate});

  @override
  _SingleTaskScreenState createState() => _SingleTaskScreenState();
}

class _SingleTaskScreenState extends State<SingleTaskScreen> {
  @override
  void initState() {
    TaskCubit.get(context).getTaskById(widget.id!);
    super.initState();
  }

  //backgroundColor: HexColor("492F24"),
  // textColor:HexColor("#FFE3C5"),
  //late bool isClicked;
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
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/image.jpg',
                    width: 260,
                    height: 200,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    AppNavigator.customNavigator(context: context,
                        screen: EditTaskScreen(
                            title: widget.title,
                            description: widget.description,
                            startdate: widget.startdate,
                            enddate: widget.enddate,
                        ),
                        finish: false,
                    );
                  },
                  icon: const Icon(
                    Icons.edit,
                    size: 30,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Title: ${widget.title}',
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Description: ${widget.description}',
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Start Date: ${widget.startdate}',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'End Date: ${widget.enddate}',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
