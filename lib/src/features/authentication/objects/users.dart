import 'package:threads_clone/src/features/authentication/objects/user.dart';

class Users {
  static Map<String, User> users = {
    'bedirhan':
    User(name: '',
        email: '',
        password: '',
        phoneNumber: '',
        bio: ''),
  };

  static Map<String, User> usersD = {
  };

  static List<User> list = [];
}
