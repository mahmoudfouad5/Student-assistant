import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti/models/course_model.dart';
import 'package:hti/models/user_model.dart';
import 'package:hti/modules/register/cubit/states.dart';
import 'package:hti/shared/componant/constant.dart';

class RegisterCubit extends Cubit<RegisterStates>{

  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context)=>BlocProvider.of(context);
    // LoginModel ? loginModel ;

  bool isPasswordShow =true ;
  bool isOpen =true ;
  bool isRePasswordShow =true ;

   void userRegister({
  @required String? email ,
  @required String? password,
  @required String? name,
  @required String? phone,

}){
    emit(RegisterLoadingState());

    FirebaseAuth.instance.
    createUserWithEmailAndPassword(
      email: email!,
      password: password!, )
        .then((value) {
          userCreate(email: email,
             password: password,
             name: name,
            phone: phone,
             uId: value.user!.uid);
     }).catchError((error){

       emit(RegisterErrorState(error.toString()));
    });



  }

   void userCreate({
    @required String? email ,
    @required String? password,
    @required String? name,
    @required String? phone,
    @required String? uId,
    @required bool? isVerified,

  }){
    UserData model =UserData(
      name: name,
      phone: phone,
      password: password,
      email: email,
      uId: uId,
      isVerified:isVerified,
     );
     FirebaseFirestore.
    instance.
    collection('users')
        .doc(uId).set(
        model.toMap()).then((value){
          emit(CreateUserSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(CreateUserErrorState(error.toString()));
    }

     );



  }




  IconData suffix = Icons.remove_red_eye_outlined ;

void ChangeObscuer (){
  isPasswordShow = !isPasswordShow ;
  suffix = isPasswordShow ?Icons.remove_red_eye_outlined :Icons.visibility_off ;
  emit(RegisterChangeSuffixIcon());

}
void ChangeReObscuer (){
  isRePasswordShow = !isRePasswordShow ;
  suffix = isRePasswordShow ?Icons.remove_red_eye_outlined :Icons.visibility_off ;
  emit(RegisterChangeSuffixIcon());

}


}