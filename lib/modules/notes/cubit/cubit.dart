 import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti/models/notes_model.dart';
 import 'package:hti/modules/notes/cubit/states.dart';
import 'package:hti/shared/componant/constant.dart';
import 'package:image_picker/image_picker.dart';

class NotesCubit extends Cubit<NotesStates>{

  NotesCubit() : super(NotesInitialState());

  static NotesCubit get(context)=>BlocProvider.of(context);


  bool isFinished = false;
  File? noteImage;
  var picker =ImagePicker();




  void TextNotesCreate({
     @required String? uId,
     @required String? title,
    @required bool? isFinished,
  }) {
    NotesData  notesModel = NotesData(
       title: title,
       uId: uId,
      isFinished: isFinished,
    );

    emit(CreateUserTextNotesLoadingState());

    FirebaseFirestore.instance
        .collection('usersTextNotes/${uId}/TextNotes')
        .add(notesModel.toMap())
        .then((value) {
      String? Successmassege = "Note is Added";

      emit(CreateUserTextNotesSuccessState(Successmassege));
    }).catchError((error) {
      print(error.toString());
      emit(CreateUserTextNotesErrorState(error.toString()));
    });
  }


  List<NotesData> textNotes = [];

  void getTextNotes() {
    emit(GetNotesLoadingState());

    FirebaseFirestore.instance
        .collection("usersTextNotes/${uId}/TextNotes")
        .get()
        .then((value) {
      textNotes = [];
      value.docs.forEach((element) {
        textNotes.add(NotesData.fromJson(element.data()));
      });
      emit(GetNotesSuccessState());
    }).catchError((error) {
      emit(GetNotesErrorState(error.toString()));
    });
  }


  Future<void> getNoteImage() async{
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile !=null){
      noteImage =File(pickedFile.path);
      emit(NotesImagePickedSuccessState());
      print('pass us ${noteImage!.path}');
    }else {
      print('No Image Selected ');
      emit(NotesImagePickedErrorState('No Image Selected ' ));

    }

  }

  // void uploadNoteImage ()
  // {
  //   firebase_storage.FirebaseStorage.instance.ref().child('users/NoteImage')
  // }









}