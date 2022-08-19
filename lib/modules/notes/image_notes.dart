import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hti/modules/notes/cubit/cubit.dart';
import 'package:image_picker/image_picker.dart';


class ImageNotes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var cubit =NotesCubit.get(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Image Notes"),

      ),
      body: Center(child: Text("Notes"),),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          cubit.getNoteImage();

        },

      ),

    );
  }



}
