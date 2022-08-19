
class LectureModel{

  String? name;
  String? time;
  String? date;
   String? uId;
  bool? isDone;
  LectureModel({
    this.time,
   this.name,
   this.date,
    this.uId,
   this.isDone,
 });
 LectureModel.fromJson(Map<String,dynamic>json)
 {
   time=json['time'];
   name=json['name'];
   date=json['date'];
    uId=json['uId'];
   isDone=json['isDone'];
  }
 Map<String,dynamic>toMap(){
   return
       {
         'name':name,
         'time':time,
         'date':date,
          'uId':uId,
         'isDone':isDone,
        };

 }
}