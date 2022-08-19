import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti/models/notes_model.dart';
import 'package:hti/modules/notes/cubit/cubit.dart';
import 'package:hti/modules/notes/cubit/states.dart';
import 'package:hti/shared/componant/components.dart';
import 'package:hti/shared/componant/constant.dart';
 import 'package:intl/intl.dart';

class TextNotes extends StatelessWidget {
  var notescontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();
  var scaffoldkey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    var cubit = NotesCubit.get(context);

    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {
        if (state is CreateUserTextNotesSuccessState) {
          showToast(message: state.Success, state: ToastStates.SUCCESS);
        }
        if (state is CreateUserTextNotesErrorState) {
          showToast(message: state.error, state: ToastStates.ERROR);
        }

      },
      builder: (context, state) {
        return Scaffold(
          key: scaffoldkey,
          appBar: AppBar(
            title: Text("Text Notes"),
          ),
          body:BuildCondition(
            condition: state is! CreateUserTextNotesLoadingState,
            builder: (context) => BuildCondition(
                condition: cubit.textNotes.length > 0,
                builder: (context) => ListView.builder(
                  itemBuilder: (context, index) =>
                      buildCourseItem(cubit.textNotes[index], context),
                  itemCount: cubit.textNotes.length,
                ),
                fallback: (context) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.note_add_sharp,
                          size: 200, color: Colors.black.withOpacity(.8)),
                      Text(
                        "please add your Text Notes",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black.withOpacity(.8)),
                      )
                    ],
                  ),
                )),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              late AwesomeDialog dialog;
              dialog = AwesomeDialog(
                context: context,
                animType: AnimType.SCALE,
                dialogType: DialogType.INFO,
                keyboardAware: true,
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Enter Your Notes',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Material(
                          elevation: 0,
                          child: TextFormField(
                            controller: notescontroller,
                            validator: (context) {
                              if (context!.isEmpty) {
                                return "You Must Add Title Name";
                              }
                            },
                            autofocus: true,
                            minLines: 1,
                            maxLines: 2,
                            decoration: InputDecoration(
                              fillColor: Colors.black.withAlpha(40),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              labelText: 'Title',
                              prefixIcon: Icon(Icons.text_fields),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AnimatedButton(
                                isFixedHeight: false,
                                width: 75,
                                text: 'Add',
                                pressEvent: () {
                                  if (formkey.currentState!.validate()) {
                                    cubit.TextNotesCreate(
                                      uId: uId,
                                       isFinished: cubit.isFinished,
                                       title: notescontroller.text,
                                    );
                                    notescontroller.text = '';
                                    dialog.dismiss();
                                  }
                                  cubit.getTextNotes();
                                },
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              AnimatedButton(
                                isFixedHeight: false,
                                color: Colors.red,
                                width: 75,
                                text: 'Close',
                                pressEvent: () {
                                  dialog.dismiss();
                                },
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )..show();
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );


  }
  Widget buildCourseItem(NotesData data, context) => Padding(
    padding: const EdgeInsetsDirectional.only(start: 10, top: 20,end: 80),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
      ),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.notes,
                size: 50,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${data.title}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    SizedBox(height: 10,),
                   ],
                ),

              ),
              SizedBox(width: 20,),

              Icon(Icons.alarm,size:40 ,),
              SizedBox(width: 20,)

            ],
          )
        ],
      ),
    ),
  );

}
