import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:final_project/models/registrar.dart';
import 'package:final_project/services/dio/dio_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context)=>BlocProvider.of(context);
  RegisterHub?registerHub;
  userRegister(String name,String email,String password)
  {
    emit(RegisterLoadingState());
    DioHelper.postData(
        url: 'register',
        data:
        {
          'name':name,
          'email':email,
          'password':password,
        }).then((value) {
      var jsonData=jsonDecode(value.data);
      registerHub=RegisterHub.fromJson(jsonData);
      print(value.data);
      emit(RegisterSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(RegisterErrorState());
    });
  }
}
