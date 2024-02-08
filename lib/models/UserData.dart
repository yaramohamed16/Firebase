
class UserData {
  String? uId;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  UserData({
    this.uId,
    this.name,
    this.email,
    this.phone,
    this.token,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    uId = json['uId'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    token = json['token'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name':name,
      'email':email,
      'phone':phone,
      'uId':uId
    };
  }
}
