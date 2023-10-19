import 'package:threads_clone/src/features/authentication/objects/thread.dart';

class User {
  String? id;
  String name = "edit here";
  String email = "edit here";
  String password = "edit here";
  String phoneNumber = "edit here";
  String profilePictureLink = "assets/images/nonuser.jpg";
  String bio = "edit here";
  bool isPrivate = false;
  List<User> friends = [];
  List<Thread> threadsPosted = [];
  List<Thread> threadsLiked = [];

  // String token = "";

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.bio,
    // required this.token
  });
//
// User.fromJson(Map<String, dynamic> json) {
//   id = json['id'];
//   name = json['name'];
//   email = json['email'];
//   password = json['password'];
//   token = json['token'];
// }
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{};
//   data['id'] = id;
//   data['name'] = name;
//   data['email'] = email;
//   data['password'] = password;
//   data['token'] = token;
//   return data;
// });
}
