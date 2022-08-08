import 'package:final_project/bloc/observer/bloc_observer.dart';
import 'package:final_project/src/app_root.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'services/dio/dio_services.dart';
import 'services/shearead_preference/shearedprefrence_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  DioHelper.init();
  BlocOverrides.runZoned(()
   {
  runApp( AppRoot());
  },
      blocObserver: MyBlocObserver());
}


