abstract class AppStates {}

class AppInitialState extends AppStates {}

class ChangeIndexState extends AppStates {}

class CreateUserDataState extends AppStates {}

class UserDataIsVerifiedState extends AppStates {}

class InsertUserDataState extends AppStates {}

class GetUserDataSuccessState extends AppStates {}
class GetDataLoadingState extends AppStates {}

class GetUserDataErrorState extends AppStates {
  final String? error;

  GetUserDataErrorState(this.error);
}

class GetUserCoursesSuccessState extends AppStates {}

class GetUserCoursesErrorState extends AppStates {
  final String? error;

  GetUserCoursesErrorState(this.error);
}

class UpdateUserDataState extends AppStates {}

class DeleteUserDataState extends AppStates {}

class ChangeIconDataState extends AppStates {}

class AppChangeModeState extends AppStates {}

class AppChangeBottomItemState extends AppStates {}

class AppSingOutState extends AppStates {}

class CreateUserCourseLoadingState extends AppStates {}


class CreateUserCourseSuccessState extends AppStates {
  final String? Success;

  CreateUserCourseSuccessState(this.Success);
}

class CreateUserCourseErrorState extends AppStates {
  final String? error;

  CreateUserCourseErrorState(this.error);
}

class CreateUserLectureLoadingState extends AppStates {}


class CreateUserLectureSuccessState extends AppStates {
  final String? Success;

  CreateUserLectureSuccessState(this.Success);
}

class CreateUserLectureErrorState extends AppStates {
  final String? error;

  CreateUserLectureErrorState(this.error);
}
