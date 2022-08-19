abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
     final String? error ;

  RegisterErrorState(this.error);

}

class RegisterChangeSuffixIcon extends RegisterStates {}

class CreateUserSuccessState extends RegisterStates {}
class CreateUserCourseSuccessState extends RegisterStates {}

class CreateUserCourseErrorState extends RegisterStates {
  final String? error ;

  CreateUserCourseErrorState(this.error);

}
class CreateUserErrorState extends RegisterStates {
  final String? error ;

  CreateUserErrorState(this.error);

}
class VerificationSuccessState extends RegisterStates {}

class VerificationErrorState extends RegisterStates {

}




