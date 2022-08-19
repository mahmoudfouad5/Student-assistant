
import 'package:hti/modules/login/login_screen.dart';
import 'package:hti/shared/componant/components.dart';
import 'package:hti/shared/network/local/cache_helper.dart';

void singOut(context){
  CacheHelper.removeData(key: "uId").then((value){
    if(value!){
      navigatorToReplacement(context,  LoginScreen());


    }
  }) ;

}
String ?uId ;
