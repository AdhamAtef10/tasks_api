import 'package:final_project/bloc/login/login_cubit.dart';
import 'package:final_project/bloc/register/register_cubit.dart';
import 'package:final_project/utlis/utlis.dart';
import 'package:final_project/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
//color: HexColor("#FFE3C5"),
//HexColor("492F24"),

class WelcomeScreen extends StatelessWidget {

  WelcomeScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor("492F24"),
        title:Text('Magento',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: HexColor("#FFE3C5"),
          ),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Welcome To Magento Tasks\n Login and make some tasks! ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: HexColor("492F24"),
              ),),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: HexColor("#FFE3C5"),
                  ),
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
                                        controller: nameController,
                                        keyboardType: TextInputType.text,
                                        validator: (String? value) {
                                          if (value!.isEmpty) {
                                            return 'Name must not be empty!';
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          labelText: 'Name',
                                          prefixIcon: Icon(
                                              Icons.drive_file_rename_outline),
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        controller: emailController,
                                        keyboardType: TextInputType.text,
                                        validator: (String? value) {
                                          if (value!.isEmpty) {
                                            return 'Email must not be empty!';
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          labelText: 'Email',
                                          prefixIcon: Icon(Icons.mail),
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        controller: passwordController,
                                        keyboardType: TextInputType.text,
                                        validator: (String? value) {
                                          if (value!.isEmpty) {
                                            return 'Password must not be empty!';
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          labelText: 'Password',
                                          prefixIcon: Icon(Icons.lock),
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 70,
                                      ),
                                      BlocConsumer<RegisterCubit, RegisterState>(
                                        listener: (context, state) {
                                          if(state is RegisterSuccessState)
                                            {
                                              AppNavigator.customNavigator(
                                                context: context,
                                                screen: HomeScreen(),
                                                finish: false,
                                              );
                                            }
                                        },
                                        builder: (context, state) {
                                          var registerCubit=RegisterCubit.get(context);
                                          return ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: HexColor("#FFE3C5"),
                                            ),
                                            onPressed: () {
                                              if (formKey.currentState!.validate())
                                              {
                                                registerCubit.userRegister(
                                                    nameController.text,
                                                    emailController.text,
                                                    passwordController.text,
                                                );
                                              }
                                            },
                                            child: Text('Register',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: HexColor("492F24"),
                                              fontSize: 25,
                                            ),),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                    );
                  },
                  child:Text('Register',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: HexColor("492F24"),
                      fontSize: 25,
                    ),),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: HexColor("#FFE3C5"),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
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
                                      const Text('WelCome!',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        controller: emailController,
                                        keyboardType: TextInputType.text,
                                        validator: (String? value) {
                                          if (value!.isEmpty) {
                                            return 'Email must not be empty!';
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          labelText: 'Email',
                                          prefixIcon: Icon(Icons.mail),
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        controller: passwordController,
                                        keyboardType: TextInputType.text,
                                        validator: (String? value) {
                                          if (value!.isEmpty) {
                                            return 'Password must not be empty!';
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          labelText: 'Password',
                                          prefixIcon: Icon(Icons.lock),
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 70,
                                      ),
                                      BlocConsumer<LoginCubit, LoginState>(
                                        listener: (context, state) {
                                          if (state is LoginSuccessState) {
                                            AppNavigator.customNavigator(
                                              context: context,
                                              screen: HomeScreen(),
                                              finish: false,
                                            );
                                          }
                                        },
                                        builder: (context, state) {
                                          var loginCubit = LoginCubit.get(
                                              context);
                                          return ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: HexColor("#FFE3C5"),
                                            ),
                                            onPressed: () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                loginCubit.userLogin(
                                                  emailController.text,
                                                  passwordController.text,
                                                );
                                              }
                                            },
                                            child:Text('Login',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: HexColor("492F24"),
                                                fontSize: 25,
                                              ),),
                                          );
                                        },
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                    );
                  },
                  child: Text('Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: HexColor("492F24"),
                      fontSize: 25,
                    ),),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
