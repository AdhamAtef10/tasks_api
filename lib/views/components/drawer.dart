import 'package:final_project/services/shearead_preference/shearedprefrence_services.dart';
import 'package:final_project/utlis/utlis.dart';
import 'package:final_project/views/welcome_screen.dart';
import 'package:flutter/material.dart';

class Drawerr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children:
        <Widget>[
          DrawerHeader(
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 35,
                ),
                SizedBox(
                  width:25,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text('Adham Atef',
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),),
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text('Edit',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),),
                        ),
                        SizedBox(
                          width:25 ,
                        ),
                        Icon(Icons.edit,
                          color: Colors.white,
                          size: 20,),
                      ],
                    )
                  ],
                ),
              ],
            ),
            decoration: BoxDecoration(
              color:Colors.brown,
            ),
          ),
          ListTile(
            title: Text('Log Out'),
            leading: Icon(Icons.arrow_forward_ios_outlined),
            onTap: ()
            {
              SharedPreferencesHelper.removeData(key: 'token');
              AppNavigator.customNavigator(context: context, screen: WelcomeScreen(), finish: false);
            },
          ),
        ],
      ),
    );
  }
}
