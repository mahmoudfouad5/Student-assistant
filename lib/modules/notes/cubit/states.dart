abstract class NotesStates {}

class NotesInitialState extends NotesStates {}

class CreateUserTextNotesLoadingState extends NotesStates {}


class CreateUserTextNotesSuccessState extends NotesStates {
  final String? Success;

  CreateUserTextNotesSuccessState(this.Success);
}

class CreateUserTextNotesErrorState extends NotesStates {
  final String? error;

  CreateUserTextNotesErrorState(this.error);
}

class GetNotesLoadingState extends NotesStates {}
class GetNotesSuccessState extends NotesStates {}
class GetNotesErrorState extends NotesStates {
  final String? error;

  GetNotesErrorState(this.error);
}

class  NotesImagePickedLoadingState extends NotesStates {}

 class NotesImagePickedSuccessState extends NotesStates {}
class NotesImagePickedErrorState extends NotesStates {
  final String? error;

  NotesImagePickedErrorState(this.error);
}




