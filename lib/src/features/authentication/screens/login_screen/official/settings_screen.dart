import 'package:flutter/material.dart';

import 'official_login.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          buildRowOfSettings(
              Icons.person_add_outlined, 'Follow and Invite Friends'),
          buildRowOfSettings(Icons.notifications_outlined, 'Notifications'),
          buildRowOfSettings(Icons.privacy_tip_outlined, 'Privacy'),
          buildRowOfSettings(Icons.account_circle_outlined, 'Account'),
          buildRowOfSettings(Icons.support_outlined, 'Help'),
          buildRowOfSettings(Icons.info_outline_rounded, 'About'),
          const Divider(
            color: Colors.white,
            thickness: 0.2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OfficialLoginPage(),
                      ),
                      (route) => false);
                },
                child: const Text(
                  'Log Out',
                  style: TextStyle(color: Colors.blue, fontSize: 17.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding buildRowOfSettings(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: () {},
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 30.0),
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 17.0),
            ),
          ],
        ),
      ),
    );
  }
}
