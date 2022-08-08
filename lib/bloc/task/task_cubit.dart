import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:final_project/models/get_all_tasks.dart';
import 'package:final_project/models/get_task_by_id.dart';
import 'package:final_project/models/send_task_model.dart';
import 'package:final_project/models/update_task.dart';
import 'package:final_project/services/dio/dio_services.dart';
import 'package:final_project/services/shearead_preference/shearedprefrence_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:final_project/models/registrar.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
part 'task_state.dart';


class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  static TaskCubit get(context)=>BlocProvider.of(context);
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var startDateController = TextEditingController();
  var endDateController = TextEditingController();
  var voiceController = TextEditingController();
  var imageController = TextEditingController();

  File?image;
  Future pickImage(ImageSource source) async
  {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return null;
    } on PlatformException catch (e) {
      print('filed to pick image$e');
    }
  }

  SendTaskModel ?sendTaskModel;
  saveTask(String title,String description,File?image,String voice,String startDate,String endDate)
  {
    emit(TaskStoreLoadingState());
    DioHelper.postData(
      token: SharedPreferencesHelper.getData(key: 'token'),
        url: 'tasks',
        data:
        {
         'title':titleController.text,
         'description':descriptionController.text,
          'image':image,
         'start_date':'2022/01/10',
         'end_date':'2022/02/11',
        }
    ).then((value)
    {
      var json=jsonDecode(value.data);
      sendTaskModel=SendTaskModel.fromJson(json);
      print(image);
      print(sendTaskModel!.message);
      emit(TaskStoreSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(TaskStoreErrorState());
    });
  }
  RegisterHub?registerHub;
  GetAllTaskModel? getAllTaskModel;
  getAllTasks()
  {
    emit(GetAllTasksLoadingState());
    DioHelper.getData(
      url: 'tasks',
      token: SharedPreferencesHelper.getData(key: 'token')
    ).then((value) {
      print(value.data);
      var jsonData = jsonDecode(value.data);
      getAllTaskModel=GetAllTaskModel.fromJson(jsonData);
      print(getAllTaskModel!.status);
      emit(GetAllTasksSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllTasksErrorState());
      print(error);


    });
  }
  GetTaskById? getTaskByIdd;
  getTaskById(int id)
  {
    emit(GetTaskByIdLoadingState());
    DioHelper.getData(
      url: 'tasks/$id',
      token:SharedPreferencesHelper.getData(key:'token'),
    ).then((value) {
      var jsonData = jsonDecode(value.data);
      getTaskByIdd=GetTaskById.fromJson(jsonData);
      print(getTaskByIdd!.response!.title);
      emit(GetTaskByIdSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetTaskByIdErrorState());
    });
  }

  UpdateTaskModel?updateTaskModel;
  editTask(var id,String title,String description,String startDate)
  {
    emit(EditTaskByIdLoadingState());
   DioHelper.postData(
       url: 'tasks/$id',
       data:
       {
         'title':title,
         'description':description,
         'start_date':'2022/01/10',
         'end_date':'2022/01/11',
         '_method':'PUT',
         'status':'in_progress'
       },
     token: SharedPreferencesHelper.getData(key: 'token'),
   ).then((value) {
     var jsonData=jsonDecode(value.data);
     print(jsonData);
     updateTaskModel=UpdateTaskModel.fromJson(jsonData);
     print(updateTaskModel!.message);
     emit(EditTaskByIdSuccessState());
   }).catchError((error)
   {
     print(error.toString());
     emit(EditTaskByIdErrorState());
   });
  }

  deleteTaskById(var id)
  {
    emit(DeleteTaskByIdLoadingState());
    DioHelper.deleteData(
        url:'tasks/$id',
        token: SharedPreferencesHelper.getData(key: 'token'),
    ).then((value) {
      var jsonData=jsonDecode(value.data);
      getTaskByIdd=GetTaskById.fromJson(jsonData);
      emit(DeleteTaskByIdSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(DeleteTaskByIdErrorState());
    });
   }

}
