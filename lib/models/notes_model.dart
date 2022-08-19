

class NotesData{

  String? title;
   String? uId;
   bool? isFinished;
  NotesData({
    this.title,
    this.uId,
    this.isFinished,
 });
 NotesData.fromJson(Map<String,dynamic>json)
 {
    title=json['title'];
    uId=json['uId'];
  isFinished=json['isFinished'];
  }
 Map<String,dynamic>toMap(){
   return
       {
         'title':title,
          'uId':uId,
         'isFinished':isFinished,
        };

 }
}