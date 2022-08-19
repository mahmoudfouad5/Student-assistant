
class UserData{

  String? name;
  String? email;
  String? phone;
  String? password;
  String? uId;
  bool? isVerified;
  UserData({
    this.email,
   this.name,
   this.phone,
   this.password,
   this.uId,
   this.isVerified,
 });
 UserData.fromJson(Map<String,dynamic>json)
 {
   email=json['email'];
   name=json['name'];
   phone=json['phone'];
   password=json['password'];
   uId=json['uId'];
   isVerified=json['isVerified'];
  }
 Map<String,dynamic>toMap(){
   return
       {
         'name':name,
         'email':email,
         'phone':phone,
         'password':password,
         'uId':uId,
         'isVerified':isVerified,
        };

 }
}