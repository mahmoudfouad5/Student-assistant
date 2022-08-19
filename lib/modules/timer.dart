
 import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
 import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:hti/shared/cubit/cubit.dart';
 import 'package:hti/shared/cubit/states.dart';



class TimarScreen extends StatelessWidget {
     var controller = CustomTimerController();

  @override
  // void dispose() {
  //   controller.dispose();
  //    dispose();
  // }

     Widget build(BuildContext context) {
    return  BlocConsumer<Appcubit,AppStates>(
      listener:(context, state) {},
      builder:((context, state) =>  Scaffold(
        appBar: AppBar(
          title: Text("CustomTimer example"),
        ),
        body: Center(
          child: Padding(

            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(25)
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomTimer(
                      controller: controller,
                      begin: Duration(minutes: 30),
                      end: Duration(),
                      builder: (remaining) {
                        return Text(
                            "${remaining.hours}:${remaining.minutes}:${remaining.seconds}",
                            style: TextStyle(fontSize: 24.0));
                      }),
                  SizedBox(height: 5.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RoundedButton(
                        text: "Start",
                        color: Colors.green,
                        onPressed: () => controller.start(),
                      ),
                      RoundedButton(
                        text: "Pause",
                        color: Colors.blue,
                        onPressed: () => controller.pause(),
                      ),
                      RoundedButton(
                        text: "Reset",
                        color: Colors.red,
                        onPressed: () => controller.reset(),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      )) ,

    );
   }
}

 class RoundedButton extends StatelessWidget {
   final String text;
   final Color color;
   final void Function()? onPressed;

   RoundedButton({required this.text, required this.color, this.onPressed});

   @override
   Widget build(BuildContext context) {
     return TextButton(
       child: Text(text, style: TextStyle(color: Colors.white)),
       style: TextButton.styleFrom(
         backgroundColor: color,
         padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
         shape:
         RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
       ),
       onPressed: onPressed,
     );
   }
 }