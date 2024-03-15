class UserData {
  String? uId;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;
  String? message; // Add message property
  bool? status; // Add status property

  UserData({
    this.uId,
    this.name,
    this.email,
    this.phone,
    this.token,
    this.message,
    this.status,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    uId = json['uId'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    token = json['token'];
    message = json['message']; // Initialize message
    status = json['status']; // Initialize status
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
      'message': message, // Include message in map
      'status': status // Include status in map
    };
  }
}
