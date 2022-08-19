import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti/layout/home_layout.dart';
import 'package:hti/modules/login/login_screen.dart';
import 'package:hti/modules/notes/cubit/cubit.dart';
import 'package:hti/shared/componant/constant.dart';
import 'package:hti/shared/cubit/cubit.dart';
import 'package:hti/shared/cubit/states.dart';
import 'package:hti/shared/network/local/cache_helper.dart';
import 'package:hti/shared/styles/themes.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');

  Widget? widget;

  uId = CacheHelper.getData(key: 'uId')  ;
  if (uId != null) {
    widget = HomeLayout();
  } else  {
    widget = LoginScreen();
  }
  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));


}

class MyApp extends StatelessWidget {
  final bool? isDark;

  final Widget? startWidget;

  MyApp({this.startWidget,    this.isDark ,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => Appcubit()..getUserdata()..getCourseData()
            ..changeAppMode(
              fromShared: isDark,

            ),
        ),
        BlocProvider(create: (context)=>NotesCubit()..getTextNotes())


      ],
      child: BlocConsumer<Appcubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: themeData,
              darkTheme: DarkTheme,
              themeMode:
              Appcubit.get(context).isDark ? ThemeMode.light : ThemeMode.dark,
              home: startWidget
          );
        },
      ),
    );
  }
}


