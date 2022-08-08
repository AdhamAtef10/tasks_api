import 'package:final_project/bloc/login/login_cubit.dart';
import 'package:final_project/bloc/register/register_cubit.dart';
import 'package:final_project/bloc/task/task_cubit.dart';
import 'package:final_project/services/shearead_preference/shearedprefrence_services.dart';
import 'package:final_project/views/home_screen.dart';
import 'package:final_project/views/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (BuildContext context) =>LoginCubit()),
        BlocProvider(create: (BuildContext context) =>RegisterCubit()),
        BlocProvider(create: (BuildContext context) =>TaskCubit()..getAllTasks()),
      ],
      child:MaterialApp(
        debugShowCheckedModeBanner: false,
        home:SharedPreferencesHelper.getData(key: 'token')==null?WelcomeScreen():HomeScreen()),
    );
  }
}
//SharedPreferencesHelper.getData(key:'token')==null?
//       WelcomeScreen():WelcomeScreen(),),