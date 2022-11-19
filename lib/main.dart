import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_responsive/pages/home/cubit/cubit.dart';
import 'package:flutter_task_responsive/pages/home/view/home_screen_imports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Cairo',
      ),
     home:  BlocProvider<HomeCubit>(
       create: (BuildContext context) => HomeCubit(),
         child:const HomeScreen()
     ),
    );
  }
}
