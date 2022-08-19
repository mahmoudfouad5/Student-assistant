import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti/layout/home_layout.dart';
import 'package:hti/models/course_model.dart';
import 'package:hti/models/lecture_model.dart';
import 'package:hti/models/user_model.dart';
import 'package:hti/modules/courses_screen.dart';
import 'package:hti/modules/hobbies_screen.dart';
import 'package:hti/modules/home_screen.dart';
import 'package:hti/modules/login/login_screen.dart';
import 'package:hti/modules/notes/notes_screen.dart';
import 'package:hti/modules/timer.dart';
import 'package:hti/shared/componant/components.dart';
import 'package:hti/shared/componant/constant.dart';
import 'package:hti/shared/cubit/states.dart';
import 'package:hti/shared/network/local/cache_helper.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Appcubit extends Cubit<AppStates> {
  Appcubit() : super(AppInitialState());

  static Appcubit get(context) => BlocProvider.of(context);
  bool isDark = false;
  bool isVerified = true;

  UserData? model;

  bool isBottomSheet = false;
  bool isFinished = false;
  IconData fabIcon = Icons.edit;

  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    CoursesScreen(),
    HobbiesScreen(),
    NotesScreen(),

   ];
  List<String> titles = [
    "Home",
    "Courses",
     "Hobbies",
    "Notes  ",
  ];

  List<SalomonBottomBarItem> bottomItem = [
    SalomonBottomBarItem(icon: Icon(Icons.home), title: Text("Home")),
    SalomonBottomBarItem(icon: Icon(Icons.library_books_sharp), title: Text("Courses")),
    SalomonBottomBarItem(icon: Icon(Icons.reset_tv_sharp), title: Text("Hobbies")),
    SalomonBottomBarItem(icon: Icon(Icons.note_sharp), title: Text("Notes")),
  ];

  void getUserdata() {
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(value.data());
      model = UserData.fromJson(value.data()!);
      emit(GetUserDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetUserDataErrorState(error.toString()));
    });
  }

  void ChangeBottomItem(int index) {
    currentIndex = index;
    emit(AppChangeBottomItemState());
  }

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }
  }

  void verifiedEmail({bool? fromSharedVerified}) {
    if (fromSharedVerified != null) {
      isVerified = fromSharedVerified;
      emit(AppChangeModeState());
    } else {
      isVerified = !isVerified;
      CacheHelper.putBoolean(key: 'isVerified', value: isVerified)
          .then((value) {
        emit(AppChangeModeState());
      });
    }
  }

  void ChangeIconData({@required bool? isShow, @required IconData? icon}) {
    isBottomSheet = isShow!;
    fabIcon = icon!;
    emit(ChangeIconDataState());
  }

  void CourseCreate({
    @required String? date,
    @required String? uId,
    @required String? time,
    @required String? title,
    @required bool? isFinished,
  }) {
    CoursesData coursesModel = CoursesData(
      date: date,
      title: title,
      time: time,
      uId: uId,
      isFinished: isFinished,
    );

    emit(CreateUserCourseLoadingState());

    FirebaseFirestore.instance
        .collection('usersCourses/${uId}/Courses')
        .add(coursesModel.toMap())
        .then((value) {
      String? Successmassege = "Course Added";

      emit(CreateUserCourseSuccessState(Successmassege));
    }).catchError((error) {
      print(error.toString());
      emit(CreateUserCourseErrorState(error.toString()));
    });
  }

  List<CoursesData> courses = [];

  void getCourseData() {
    emit(GetDataLoadingState());

    FirebaseFirestore.instance
        .collection("usersCourses/${uId}/Courses")
        .get()
        .then((value) {
      courses = [];
      value.docs.forEach((element) {
        courses.add(CoursesData.fromJson(element.data()));
      });
      emit(GetUserCoursesSuccessState());
    }).catchError((error) {
      emit(GetUserCoursesErrorState(error.toString()));
    });
  }

  void singOut(context) {
    CacheHelper.removeData(key: "uId").then((value) {
      emit(AppSingOutState());
      if (value!) {
        navigatorToReplacement(context, LoginScreen());
      }
      print(value);
    });
  }

  List<PlatformFile> files = []; //ANOTHER EDIT HERE,

  void getLecture() async {

    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      allowedExtensions: ['pdf', 'doc'],
    );
    if (result == null) return;
    files = result.files;
  }

  List<String> barTitles = [];

  void getTitles(){
    CoursesData data ;
    emit(GetDataLoadingState());

    FirebaseFirestore.instance
        .collection("usersCourses/${uId}/Courses")
        .get()
        .then((value) {
      courses = [];
      value.docs.forEach((element) {
        courses.add(CoursesData.fromJson(element.data()));
      });
      emit(GetUserCoursesSuccessState());
    }).catchError((error) {
      emit(GetUserCoursesErrorState(error.toString()));
    });

  }
}
