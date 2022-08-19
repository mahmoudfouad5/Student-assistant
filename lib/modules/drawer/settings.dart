
import 'package:flutter/material.dart';
import 'package:hti/shared/componant/components.dart';
 import 'package:hti/shared/cubit/cubit.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            IconButton(onPressed: (){
              Appcubit.get(context).changeAppMode();
            }  ,   icon:Appcubit.get(context).isDark? Icon(Icons.brightness_high):Icon(Icons.brightness_low)),
            SizedBox(height:20 ,),
            defualtButton(
                onPressed: () {
                  Appcubit.get(context).singOut(context);

                 },
                text: "LogOut"),
          ],
        ),
      ),
    );
  }
}
