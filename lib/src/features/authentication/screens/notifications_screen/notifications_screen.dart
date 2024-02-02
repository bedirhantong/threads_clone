import 'package:flutter/material.dart';
import 'package:threads_clone/src/features/authentication/screens/notifications_screen/replies_notifications_screen.dart';
import 'package:threads_clone/src/features/authentication/screens/notifications_screen/requests_notifications_screen.dart';

import '../../objects/user.dart';
import 'all_notifications_screen.dart';
import 'likes_notifications_screen.dart';
import 'mentions_notifications_screen.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key, required this.user});

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
  final User user;
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<bool> isButtonSelectedList = [false, false, false, false, false];
  List<Color> buttonBackgroundColors = [
    Colors.black87,
    Colors.black87,
    Colors.black87,
    Colors.black87,
    Colors.black87,
  ];
  List<Color> buttonTextColors = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  List<Color> buttonBorderColors = [
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
  ];
  int indexOfContent = 0;

  List<Widget> listOfNotifications = [
    const AllNotificationsScreen(),
    const RequestsNotificationsScreen(),
    const RepliesNotificationsScreen(),
    const MentionsNotificationsScreen(),
    const LikesNotificationsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Activity',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: buildButtons(),
            ),
            // RequestsNotificationsScreen() or RepliesNotificationsScreen() or FollowingNotificationsScreen() or LikesNotificationsScreen() or MentionsNotificationsScreen()
            Expanded(
              flex: 10,
              child: buildNotificationBody(),
            )
          ],
        ),
      ),
    );
  }

  ListTile buildFollowingNotification({
    required String username,
    required String notificationText,
    required String profileImageURL,
    required String when,
    required String type,
    String? actionTo,
  }) {
    return ListTile(
      leading: switchLeading(type, profileImageURL),
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: username,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const TextSpan(
              text: '  ',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: when,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      subtitle: actionTo == null
          ? Align(
              alignment: Alignment.centerLeft,
              child: Text(
                notificationText,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  actionTo,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  notificationText,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
      trailing: OutlinedButton(
        style: OutlinedButton.styleFrom(
          fixedSize: const Size(110.0, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          side: const BorderSide(
            color: Colors.grey,
          ),
          backgroundColor: Colors.transparent,
        ),
        onPressed: () {
          changeButtonAppearance(0);
        },
        child: const Text(
          'Followed you',
          style: TextStyle(color: Colors.white, fontSize: 12.0),
        ),
      ),
    );
  }

  Stack switchLeading(String type, String profileImageURL) {
    switch (type) {
      case 'follow':
        return Stack(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(profileImageURL),
              radius: 30.0,
            ),
            const Positioned(
              bottom: -3,
              right: -3,
              child: Icon(
                Icons.person,
                color: Colors.purple,
              ),
            ),
          ],
        );
      case 'like':
        return Stack(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(profileImageURL),
              radius: 25.0,
            ),
            const Positioned(
              bottom: -6,
              right: -6,
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
          ],
        );
      case 'reply':
        return Stack(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(profileImageURL),
              radius: 25.0,
            ),
            const Positioned(
              bottom: -6,
              right: -6,
              child: Icon(
                Icons.reply,
                color: Colors.blue,
              ),
            ),
          ],
        );
      case 'mention':
        return Stack(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(profileImageURL),
              radius: 25.0,
            ),
            const Positioned(
              bottom: -6,
              right: -6,
              child: Icon(
                Icons.assignment_ind_outlined,
                color: Colors.green,
              ),
            ),
          ],
        );
      default:
        return Stack(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(profileImageURL),
              radius: 25.0,
            ),
            const Positioned(
              bottom: -6,
              right: -6,
              child: Icon(
                Icons.published_with_changes_outlined,
                color: Colors.blue,
              ),
            ),
          ],
        );
    }
  }

  Padding buildButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(110.0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                side: BorderSide(
                  color: buttonBorderColors[0],
                ),
                backgroundColor: buttonBackgroundColors[0],
              ),
              onPressed: () {
                indexOfContent = 0;
                changeButtonAppearance(0);
              },
              child: Text(
                'All',
                style: TextStyle(color: buttonTextColors[0]),
              ),
            ),
            const SizedBox(
              width: 7.0,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(110.0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                side: BorderSide(
                  color: buttonBorderColors[1],
                ),
                backgroundColor: buttonBackgroundColors[1],
              ),
              onPressed: () {
                indexOfContent = 1;

                changeButtonAppearance(1);
              },
              child: Text(
                'Requests',
                style: TextStyle(color: buttonTextColors[1]),
              ),
            ),
            const SizedBox(
              width: 7.0,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(110.0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                side: BorderSide(
                  color: buttonBorderColors[2],
                ),
                backgroundColor: buttonBackgroundColors[2],
              ),
              onPressed: () {
                indexOfContent = 2;

                changeButtonAppearance(2);
              },
              child: Text(
                'Replies',
                style: TextStyle(color: buttonTextColors[2]),
              ),
            ),
            const SizedBox(
              width: 7.0,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(110.0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                side: BorderSide(
                  color: buttonBorderColors[3],
                ),
                backgroundColor: buttonBackgroundColors[3],
              ),
              onPressed: () {
                indexOfContent = 3;

                changeButtonAppearance(3);
              },
              child: Text(
                'Mentions',
                style: TextStyle(color: buttonTextColors[3]),
              ),
            ),
            const SizedBox(
              width: 7.0,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(110.0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                side: BorderSide(
                  color: buttonBorderColors[4],
                ),
                backgroundColor: buttonBackgroundColors[4],
              ),
              onPressed: () {
                indexOfContent = 4;

                changeButtonAppearance(4);
              },
              child: Text(
                'Likes',
                style: TextStyle(color: buttonTextColors[4]),
              ),
            ),
            const SizedBox(
              width: 7.0,
            ),
          ],
        ),
      ),
    );
  }

  Padding buildNotificationBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
      child: listOfNotifications[indexOfContent],
    );
  }

  @override
  void initState() {
    changeButtonAppearance(0); // Select the "All" button initially
    super.initState();
  }

  void changeButtonAppearance(int index) {
    setState(() {
      for (int i = 0; i < isButtonSelectedList.length; i++) {
        if (i == index) {
          isButtonSelectedList[i] = true;
          buttonBackgroundColors[i] = Colors.white;
          buttonTextColors[i] = Colors.black;
          buttonBorderColors[i] = Colors.white;
        } else {
          isButtonSelectedList[i] = false;
          buttonBackgroundColors[i] = Colors.black87;
          buttonTextColors[i] = Colors.white;
          buttonBorderColors[i] = Colors.grey;
        }
      }
    });
  }
}
