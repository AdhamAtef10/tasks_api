import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:final_project/models/registrar.dart';
import 'package:final_project/services/dio/dio_services.dart';
import 'package:final_project/services/shearead_preference/shearedprefrence_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context)=>BlocProvider.of(context);
  RegisterHub?registerHub;
  userLogin(String email,String password)
  {
    emit(LoginLoadingState());
    DioHelper.postData(
        url: 'login',
        data:
        {
          'email':email,
          'password':password,
        }).then((value) {
          var jsonData=jsonDecode(value.data);
          registerHub=RegisterHub.fromJson(jsonData);
          SharedPreferencesHelper.saveData(key:'token', value:registerHub!.authorisation!.token);
          print(registerHub!.authorisation!.token);
          print(value.data);
          emit(LoginSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(LoginErrorState());
    });
  }

}
