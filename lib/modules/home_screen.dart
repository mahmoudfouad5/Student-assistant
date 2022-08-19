
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti/modules/courses_screen.dart';
import 'package:hti/modules/hobbies_screen.dart';
import 'package:hti/modules/notes/notes_screen.dart';
import 'package:hti/shared/componant/components.dart';
import 'package:hti/shared/cubit/cubit.dart';
import 'package:hti/shared/cubit/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = Appcubit.get(context);

    List <Icon> icons = [
      Icon(Icons.ac_unit),
      Icon(Icons.access_alarm),
      Icon(Icons.science),
    ];
    List<Widget> screens = [
      CoursesScreen(),
      HobbiesScreen(),
      NotesScreen(),

    ];
    List <int> pageIndex =[1,2,3];
    List <String> name = ["Courses","Hobbies","Notes"];
    List <String> path = ["https://w7.pngwing.com/pngs/575/29/png-transparent-computer-icons-instructor-led-training-course-education-toolbox-miscellaneous-blue-angle.png",
    "https://w7.pngwing.com/pngs/643/954/png-transparent-hobby-symbol-computer-icons-interests-text-photography-public-relations.png",
    "https://img.lovepik.com/original_origin_pic/18/06/24/3f195287484326742c6ddb2e6ebb7acc.png_wh300.png"];
    return BlocConsumer<Appcubit,AppStates>(
      listener:(context, state) {},
      builder:((context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Catagories",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 160,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => InkWell(child: buildCatagerios(name:name[index],path: path[index] ),
                      onTap: (){
                      cubit.ChangeBottomItem(pageIndex[index]);
                      }, ),
                    separatorBuilder: (context, index) => SizedBox(
                      width: 1,
                    ),
                    itemCount: screens.length)),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "New product",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // Container(
          //   color: Colors.grey[300],
          //   child: GridView.count(
          //     mainAxisSpacing: 1,
          //     crossAxisSpacing: 1,
          //     childAspectRatio: 1 / 1.58,
          //     shrinkWrap: true,
          //     physics: NeverScrollableScrollPhysics(),
          //     crossAxisCount: 2,
          //     children: List.generate(
          //       model.data!.products!.length,
          //           (index) => buildGridProduct(model.data!.products![index],context),
          //     ),
          //   ),
          // )
        ],
      )) ,

     );
  }
  Widget buildCatagerios({@required String ? path ,@required String ? name ,}) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Column(
          children: [
            Image(
              image: NetworkImage(path!
               ,
              ),
              height: 140,
              width: 140,
            ),
          ],
        ),
        Container(
          height: 25,
          alignment: AlignmentDirectional.center,
          width: 150,
          color: Colors.black.withOpacity(.6),
          child: Text(
            name!,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,

            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );

}
