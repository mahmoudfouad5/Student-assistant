

class CoursesData{

  String? title;
  String? date;
  String? time;
  String? uId;
   bool? isFinished;
  CoursesData({
    this.date,
   this.title,
   this.time,
   this.uId,
    this.isFinished,
 });
 CoursesData.fromJson(Map<String,dynamic>json)
 {
   date=json['date'];
   title=json['title'];
   time=json['time'];
   uId=json['uId'];
  isFinished=json['isFinished'];
  }
 Map<String,dynamic>toMap(){
   return
       {
         'title':title,
         'date':date,
         'time':time,
         'uId':uId,
         'isFinished':isFinished,
        };

 }
}