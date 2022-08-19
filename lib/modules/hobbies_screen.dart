import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:hti/shared/cubit/cubit.dart';
import 'package:hti/shared/cubit/states.dart';

class HobbiesScreen extends StatelessWidget {
  const HobbiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Appcubit, AppStates>(
        listener: (context, state) {},
        builder: ((context, state) => Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.QUESTION,
                    headerAnimationLoop: false,
                    animType: AnimType.BOTTOMSLIDE,
                    title: 'Add You Favorites News ',
                    buttonsTextStyle: const TextStyle(color: Colors.black),
                    showCloseIcon: true,
                    body: MultiSelectContainer(
                        items: [
                          MultiSelectCard(
                              value: 'Business',
                              child: Row(
                                children: [
                                  Text(
                                    "Business",
                                    style: TextStyle(fontSize: 22),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.work)
                                ],
                              )),
                          MultiSelectCard(
                              value: 'Sports',
                              child: Row(
                                children: [
                                  Text(
                                    "Sports",
                                    style: TextStyle(fontSize: 22),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.sports_baseball)
                                ],
                              )),
                          MultiSelectCard(
                              value: 'Technology',
                              child: Row(
                                children: [
                                  Text(
                                    "Technology",
                                    style: TextStyle(fontSize: 22),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.computer)
                                ],
                              )),
                        ],
                        showInListView: true,
                        splashColor: Colors.blueAccent,
                        animations: MultiSelectAnimations(
                            labeAnimationlCurve: Curves.fastOutSlowIn),
                        onChange: (allSelectedItems, selectedItem) {}),
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {},
                  ).show();
                },
                child: Icon(Icons.add),
              ),
              body: BuildCondition(
                  condition: false,
                  builder: (context) => Text("data"),
                  fallback: (context) => Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.newspaper_outlined,
                                size: 200, color: Colors.black.withOpacity(.8)),
                            Text(
                              "please add your Hobbies",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black.withOpacity(.8)),
                            ),
                           ],
                        ),
                      )),
            )));
  }
}
