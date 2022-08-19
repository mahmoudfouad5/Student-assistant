import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hti/modules/drawer/favorites.dart';
import 'package:hti/modules/drawer/myFile.dart';
import 'package:hti/modules/drawer/myProfile.dart';
import 'package:hti/modules/drawer/settings.dart';
import 'package:hti/shared/componant/components.dart';
import 'package:hti/shared/componant/constant.dart';
import 'package:hti/shared/cubit/cubit.dart';
import 'package:hti/shared/cubit/states.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = Appcubit.get(context);

    return BlocConsumer<Appcubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            drawer: Padding(
              padding: const EdgeInsets.only(
                top: 32.0,
              ),
              child: Container(
                width: 250,
                child: Drawer(
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          CircleAvatar(
                            radius: 30,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "mahmoudf fouad ahmed adad",
                            style: Theme
                                .of(context)
                                .textTheme
                                .headline6,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Email or Phone"),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: double.infinity,
                            color: Colors.green,
                            height: 1,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          builtDrawerItem(context, icon: Icons.person,
                              pageName: "My Profile",
                              onTap: () {
                                navigatorTo(context, MyProFileScreen());

                              }),
                          SizedBox(height: 30,),
                          builtDrawerItem(
                              context, icon: Icons.attach_file_sharp,
                              pageName: "My File",
                              onTap: () {
                                navigatorTo(context, MyFileScreen());

                              }),
                          SizedBox(height: 30,),
                          builtDrawerItem(context, icon: Icons.favorite,
                              pageName: "Favorites",
                              onTap: () {
                                navigatorTo(context, FavoritesScreen());

                              }),
                          SizedBox(height: 30,),
                          builtDrawerItem(context, icon: Icons.delete,
                              pageName: "Trash",
                              onTap: () {
                                navigatorTo(context, SettingScreen());

                              }),
                          SizedBox(height: 30,),

                          Container(
                            width: double.infinity,
                            color: Colors.green,
                            height: 1,
                          ),
                          SizedBox(height: 20,),
                          builtDrawerItem(context, icon: Icons.settings,
                              pageName: "Settings",
                              onTap: () {
                                navigatorTo(context, SettingScreen());
                              }),

                          SizedBox(height: 30,),
                          Center(

                            child: defualtButton(text:"LogOut" ,onPressed:(){
                              AwesomeDialog(

                                context: context,
                                dialogType: DialogType.WARNING,
                                headerAnimationLoop: false,
                                animType: AnimType.TOPSLIDE,
                                showCloseIcon: true,
                                closeIcon: const Icon(Icons.close),
                                title: 'Warning',
                                desc:
                                'Are You Sure , Do You Want To Logout?',
                                btnCancelOnPress: () {},
                                onDissmissCallback: (type) {
                                  debugPrint('Dialog Dissmiss from callback $type');
                                },
                                btnOkOnPress: () {
                                  Appcubit.get(context).singOut(context);

                                },
                              ).show();

                            } ,
                            width:200 ,
                            background:Colors.red ,isUpperCase: false,
                            radius:15 ,textColor:Colors.white ,),
                          )

                        ],
                      ),
                    )),
              ),
            ),
            appBar: AppBar(
              title: Text(
                cubit.titles[cubit.currentIndex],
              ),
            ),
            body:Container(

              child: cubit.screens[cubit.currentIndex],
            ),

            bottomNavigationBar:SalomonBottomBar(
        currentIndex: cubit.currentIndex,
        onTap: (index) {cubit.ChangeBottomItem(index);},
        items:  cubit.bottomItem,
            // BottomNavigationBar(
            //   currentIndex: cubit.currentIndex,
            //   onTap: (index) {
            //     cubit.ChangeBottomItem(index);
            //   },
            //   items: cubit.bottomItem,
            //
            //
            // )
            )
        );
      },
    );
  }
}
