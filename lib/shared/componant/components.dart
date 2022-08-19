 import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
 import 'package:awesome_dialog/awesome_dialog.dart';

Widget defualtButton({
  double width = double.infinity,
  Color background = Colors.blue,
  Color textColor = Colors.white,
  @required VoidCallback? onPressed,
  bool isUpperCase = true,
  @required String? text,
  double radius = (5.0),
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      width: width,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          isUpperCase ? text!.toUpperCase() : text!,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );

Widget defualtTextFormField({
  @required TextEditingController? controller,
  ValueChanged<String>? onChanged,
  ValueChanged<String>? onFieldSubmitted,
  GestureTapCallback? onTap,
  TextInputType? keyboardType,
  @required String? label,
  @required IconData? prefixIcon,
  Widget? suffixIcon,
  double reduis = 5,
  @required FormFieldValidator<String>? validate,
  bool isobscureText = false,
  VoidCallback? suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      onTap: onTap,
      keyboardType: keyboardType,
      validator: validate,
      obscureText: isobscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(reduis),

        ),
      ),
    );

// Widget buildIteamTasks(Map model, context) => Dismissible(
//   key: Key(model['id'].toString()),
//   onDismissed: (direction) {
//     Appcubit.get(context).DeleteDatabase(id: model['id']);
//   },
//   child: Padding(
//     padding: const EdgeInsetsDirectional.only(start: 25, top: 20),
//     child: Container(
//       width: double.infinity,
//       child: Column(
//         children: [
//           Row(
//             children: [
//               // {id: 7, title: u, date: 5/12/2022, time: 4:44 PM, status: new}
//               CircleAvatar(
//                 radius: 40.0,
//                 child: Text('${model['time']}'),
//               ),
//               SizedBox(
//                 width: 20,
//               ),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       '${model['title']}',
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold, fontSize: 20),
//                     ),
//                     Text(
//                       '${model['date']}',
//                       style: TextStyle(fontSize: 15, color: Colors.grey),
//                     ),
//                   ],
//                 ),
//               ),
//               IconButton(
//                   onPressed: () {
//                     Appcubit.get(context)
//                         .UpdateDatabase(status: 'done', id: model['id']);
//                   },
//                   icon: Icon(
//                     Icons.check_circle_outline,
//                     color: Colors.green,
//                   )),
//               IconButton(
//                   onPressed: () {
//                     Appcubit.get(context)
//                         .UpdateDatabase(status: 'archive', id: model['id']);
//                   },
//                   icon: Icon(
//                     Icons.archive_outlined,
//                     color: Colors.black45,
//                   )),
//             ],
//           )
//         ],
//       ),
//     ),
//   ),
// );

// Widget tasksBuild({
//   @required List<Map>? task,
// }) =>
//     BuildCondition(
//       condition: task!.length > 0,
//       builder: (context) => ListView.separated(
//         itemBuilder: (context, index) => buildIteamTasks(task[index], context),
//         separatorBuilder: (context, index) => Container(
//           color: Colors.grey,
//         ),
//         itemCount: task.length,
//       ),
//       fallback: (context) => Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(
//                 Icons.menu,
//                 size: 100,
//                 color: Colors.grey,
//               ),
//               Text(
//                 "No Tasks Yet, Please Add Some taska.",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.grey,
//                 ),
//               ),
//             ],
//           )),
//     );

// Widget newsArticalBluder(list, context, {isSearch = false}) {
//   return BuildCondition(
//     condition: list.isNotEmpty,
//     builder: (context) => ListView.separated(
//         physics: BouncingScrollPhysics(),
//         itemBuilder: (context, index) => buildArticl(list[index], context),
//         separatorBuilder: (context, index) => Padding(
//           padding: const EdgeInsetsDirectional.only(
//               start: 21, end: 21, bottom: 10),
//           child: Container(
//             height: 1,
//             color: Colors.grey[300],
//           ),
//         ),
//         itemCount: list.length),
//     fallback: (context) =>isSearch ? Container(): Center(child: CircularProgressIndicator.adaptive()),
//   );
// }

// Widget buildArticl(artical, context) {
//   return InkWell(
//     onTap:(){
//       navigatorTo(context, WebViewScreen(url: artical['url']));
//     },
//     child: Padding(
//       padding: const EdgeInsetsDirectional.only(
//           start: 20, bottom: 10, top: 10, end: 20),
//       child: Row(
//         children: [
//           Container(
//             width: 150,
//             height: 150,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 image: DecorationImage(
//                   image: NetworkImage(
//                       "${artical['urlToImage'] ?? "https://bitsofco.de/content/images/2018/12/Screenshot-2018-12-16-at-21.06.29.png"}"),
//                   fit: BoxFit.cover,
//                 )),
//           ),
//           SizedBox(
//             width: 15,
//           ),
//           Expanded(
//               child: Container(
//                   width: 150,
//                   height: 150,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Expanded(
//                           child: Text(
//                             "${artical['title']}",
//                             style: Theme.of(context).textTheme.bodyText1,
//                             maxLines: 3,
//                             overflow: TextOverflow.ellipsis,
//                           )),
//                       Text(
//                         "${artical['publishedAt']}",
//                         style: TextStyle(
//                             fontSize: 15,
//                             overflow: TextOverflow.ellipsis,
//                             color: Colors.grey),
//                       )
//                     ],
//                   )))
//         ],
//       ),
//     ),
//   );
// }

void navigatorTo(context, Widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));
void navigatorToReplacement(context, Widget) =>
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Widget));

void showToast({
  @required String? message ,
  @required ToastStates? state ,

})=>
    Fluttertoast.showToast(
        msg: message!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: chooseToastColor(state!),
        textColor: Colors.white,
        fontSize: 16.0

    );

enum ToastStates {SUCCESS,ERROR,WARNING

}

Color? chooseToastColor(ToastStates state){
  Color color;
  switch(state){
    case ToastStates.SUCCESS:
      color =Colors.green;
      break;
    case ToastStates.ERROR:
      color =Colors.red;
      break;
    case ToastStates.WARNING:
      color =Colors.amber;
      break;

  }
  return color ;
}
 Widget builtDrawerItem(context,{@required IconData? icon ,@required String? pageName,@required VoidCallback? onTap })=>InkWell(
   onTap: onTap ,
   child: Padding(
     padding: const EdgeInsets.symmetric(vertical: 15),
     child: Row(
       children: [
         Icon(icon,size: 25,),
         SizedBox(
           width: 20,
         ),
         Text(
          pageName!,
           style: Theme.of(context).textTheme.bodyText1,
         ),
         SizedBox(height: 10,)
       ],

     ),
   ),


 );













