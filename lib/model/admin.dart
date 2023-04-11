class Admins{
  String? name;
  String? adminUID;

  String? Email;
Admins({
  this.name,
  this.adminUID,
 this.Email,
});
Admins.fromJson(Map<String,dynamic> json)
{
  adminUID=json['adminUID'];
  name=json['name'];
 
  Email=json['Email'];
}
Map<String,dynamic> toJson()
{
  final Map<String,dynamic> data = new Map<String,dynamic>();
  data['adminUID']=this.adminUID;
  data['name']=this.name;

  data['Email']=this.Email;
  return data;
}

}