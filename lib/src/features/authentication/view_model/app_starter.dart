import 'package:flutter/material.dart';
import '../objects/thread.dart';
import '../objects/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppStarter extends ChangeNotifier {
  static List<Thread> allThreads = [
    // Thread(
    //     whoPosted: User(
    //       name: "bedirhan tong",
    //       email: "admin@bdo.com",
    //       password: "123",
    //       phoneNumber: "012321321",
    //       bio: "",
    //       profilePictureLink: 'assets/images/temp_user_images/sbaymaz.jpg',
    //       username: 'betng',
    //     ),
    //     whatTextIsPosted: 'Recent Illustration of mine',
    //     whatImageIsPosted: 'assets/images/temp_user_images/bdo_post.png',
    //     whenPosted: '6 hours',
    //     likeNum: 23,
    //     commentsListWidget: []),
    // Thread(
    //     whoPosted: 'serhan',
    //     whatTextIsPosted: 'All of my dream is to be a pilot.',
    //     whatImageIsPosted: 'assets/images/temp_user_images/f35.png',
    //     whenPosted: '2 days',
    //     likeNum: 23,
    //     height: calculateHeight(
    //       'They don\'t know that we know they know we know.',
    //       250,
    //     ),
    //     username: 'srhnbymz',
    //     commentsListWidget: []),
    // Thread(
    //     whoPosted: 'musa',
    //     whatTextIsPosted:
    //         'Bir şeyler denedim yine because I am Musa, I do such things.',
    //     whatImageIsPosted: 'assets/images/temp_user_images/musa_post.png',
    //     whenPosted: '2 hours',
    //     likeNum: 23,
    //     height: calculateHeight(
    //       'PIVOT!',
    //       450,
    //     ),
    //     username: 'alatasms',
    //     commentsListWidget: []),
    // Thread(
    //     whoPosted: 'sinan',
    //     whatTextIsPosted: 'Smelly Cat, Smelly Cat, what are they feeding you?',
    //     whenPosted: 'last year',
    //     likeNum: 23,
    //     height: calculateHeight(
    //       'Smelly Cat, Smelly Cat, what are they feeding you?',
    //       50,
    //     ),
    //     username: 'demir_exe',
    //     commentsListWidget: []),
    // Thread(
    //     whoPosted: 'yusuf',
    //     whatTextIsPosted: 'Sen de benim gibi bir şeyler denedin mi?',
    //     whatImageIsPosted: 'assets/images/temp_user_images/yusuf_post.png',
    //     whenPosted: '3 min',
    //     likeNum: 23,
    //     height: calculateHeight(
    //       'Could I be wearing any more clothes?',
    //       200,
    //     ),
    //     username: 'yuciferr',
    //     commentsListWidget: []),
    // Thread(
    //     whoPosted: 'onur',
    //     whatTextIsPosted:
    //         'Mükemmel şarkı her sabah dinliyorum. Bunsuz güne başlayamıyorum',
    //     whatImageIsPosted: 'assets/images/temp_user_images/onur_post.png',
    //     whenPosted: '13 hours',
    //     likeNum: 23,
    //     height: calculateHeight(
    //       'Welcome to the real world. It sucks! You\'re gonna love it.',
    //       190,
    //     ),
    //     username: '10urcetin',
    //     commentsListWidget: []),
  ];
  late User currentUser;

  void changeCurrentUser(User user) {
    currentUser = user;
    notifyListeners();
  }

  void createUser(User user) {
    allUsers.add(user);
    notifyListeners();
  }

  void addPostToUser(Thread thread, String email) {
    User user = getCurrentUser(email);
    user.threadsPosted.add(thread);
    notifyListeners();
  }

  static Map<String, User> users = {
    'admin@bdo.com': User(
      name: "bedirhan tong",
      email: "admin@bdo.com",
      password: "123",
      phoneNumber: "012321321",
      bio: "",
      profilePictureLink: 'assets/images/temp_user_images/betng.jpg',
      username: 'betng',
    ),
    'srhn@bdo.com': User(
      name: "serhan baymaz",
      email: "srhn@bdo.com",
      password: "123",
      phoneNumber: "012321321",
      bio: "",
      profilePictureLink: 'assets/images/temp_user_images/sbaymaz.jpg',
      username: 'sbaymaz',
    ),
    'mouses@bdo.com': User(
      name: "Musa alatas",
      email: "mouses@bdo.com",
      password: "123",
      phoneNumber: "012321321",
      bio: "",
      profilePictureLink: 'assets/images/temp_user_images/si_sharp.jpg',
      username: 'si_sharp',
    ),
    '10nur@bdo.com': User(
      name: "Onur cetin",
      email: "10nur@bdo.com",
      password: "123",
      phoneNumber: "012321321",
      bio: "",
      profilePictureLink: 'assets/images/temp_user_images/10nurcetin.jpg',
      username: '10nurcetin',
    ),
    'yusuf@bdo.com': User(
      name: "Yusuf",
      email: "yusuf@bdo.com",
      password: "123",
      phoneNumber: "012321321",
      bio: "",
      profilePictureLink: 'assets/images/temp_user_images/yucifer.jpg',
      username: 'yucifer',
    ),
  };

  User getCurrentUser(String email) {
    late User foundUser;
    for (var user in allUsers) {
      if (user.email == email) {
        foundUser = user;
      }
    }
    return foundUser;
  }

  static List<User> allUsers = [
    User(
      name: "bedirhan tong",
      email: "admin@bdo.com",
      password: "123",
      phoneNumber: "012321321",
      bio: "",
      profilePictureLink: 'assets/images/temp_user_images/sbaymaz.jpg',
      username: 'betng',
    ),
    User(
      name: "serhan baymaz",
      email: "srhn@bdo.com",
      password: "123",
      phoneNumber: "012321321",
      bio: "",
      profilePictureLink: 'assets/images/temp_user_images/sbaymaz.jpg',
      username: 'sbaymaz',
    ),
    User(
      name: "Musa alatas",
      email: "mouses@bdo.com",
      password: "123",
      phoneNumber: "012321321",
      bio: "",
      profilePictureLink: 'assets/images/temp_user_images/si_sharp.jpg',
      username: 'si_sharp',
    ),
    User(
      name: "Onur cetin",
      email: "10nur@bdo.com",
      password: "123",
      phoneNumber: "012321321",
      bio: "",
      profilePictureLink: 'assets/images/temp_user_images/10nurcetin.jpg',
      username: '10nurcetin',
    ),
    User(
      name: "Yusuf",
      email: "yusuf@bdo.com",
      password: "123",
      phoneNumber: "012321321",
      bio: "",
      profilePictureLink: 'assets/images/temp_user_images/yucifer.jpg',
      username: 'yucifer',
    ),
  ];
}

final userViewModelProvider = ChangeNotifierProvider((ref) => AppStarter());
