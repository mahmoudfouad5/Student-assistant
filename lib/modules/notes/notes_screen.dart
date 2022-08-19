

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti/modules/hobbies_screen.dart';
import 'package:hti/modules/notes/image_notes.dart';
import 'package:hti/modules/notes/text_notes.dart';
import 'package:hti/shared/componant/components.dart';
import 'package:hti/shared/cubit/cubit.dart';
import 'package:hti/shared/cubit/states.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Appcubit,AppStates>(
      listener:(context, state) {},
      builder:((context, state) {
       return Container(
         height: double.infinity,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             biuldNotesTypesItem(title: "Text Notes", iconData: Icons.text_fields,Screen: TextNotes(),context: context),
             SizedBox(height: 30,),
             biuldNotesTypesItem(title: "Image Notes", iconData: Icons.image_outlined,context:context ,Screen:ImageNotes()  )
           ],
         ),
       );
      } ) ,

    );
  }

}
Widget biuldNotesTypesItem({@required String? title,@required IconData ? iconData,@required Widget? Screen, context}){
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: InkWell(
      onTap: (){
        navigatorTo(context,Screen);
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.blueGrey
        ),
        child: Row(
          children: [
            SizedBox(width: 5,),
            Expanded(child: Text("${title}",style: TextStyle(fontSize: 18),)),
            Icon(iconData),
            SizedBox(width: 5,),
            Icon(Icons.arrow_forward),
            SizedBox(width: 5,),


          ],

        ),
      ),
    ),
  );
}


