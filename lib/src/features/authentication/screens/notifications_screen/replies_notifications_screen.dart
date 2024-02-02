import 'package:flutter/material.dart';

class RepliesNotificationsScreen extends StatelessWidget {
  const RepliesNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          buildFollowingNotification(
              username: 'bedirhantng',
              actionTo: 'What a cold day',
              notificationText: 'It is amazing bro',
              profileImageURL: 'assets/images/temp_user_images/betng.jpg',
              when: 'now',
              type: 'reply'),
          buildFollowingNotification(
              username: 'alatasms',
              actionTo: 'Then jesus said',
              notificationText: 'Followed you',
              profileImageURL: 'assets/images/temp_user_images/si_sharp.jpg',
              when: 'yesterday',
              type: 'reply'),
        ],
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
        onPressed: () {},
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
      case 'request':
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
                Icons.add,
                color: Colors.redAccent,
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
}
