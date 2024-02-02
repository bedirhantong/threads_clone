import 'package:flutter/material.dart';
import 'package:threads_clone/src/features/authentication/screens/profile_screen/replies_posted.dart';
import 'package:threads_clone/src/features/authentication/screens/profile_screen/threads_posted.dart';

import '../../objects/user.dart';
import 'edit_profile.dart';
import 'settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();

  final User user;
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: buildAppBar(context),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildListTileOfUsername(widget.user),
              buildPaddingOfUserPref1(widget.user.bio),
              buildPaddingOfUserPref2(widget.user.phoneNumber),
              buildProfileSettingsButtons(),
              Expanded(
                flex: 7,
                //create tab bar
                child: buildTaps(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: const Icon(
        Icons.lock,
        color: Colors.white,
      ),
      backgroundColor: Colors.black,
      actions: [
        IconButton(
          onPressed: () {
            // Your onPressed logic here
          },
          icon: Image.asset(
            'assets/images/logo/insta.png',
            // Replace with your custom icon image path
            width: 24, // Set the width as per your requirement
            height: 24, // Set the height as per your requirement
          ),
        ),
        IconButton(
          onPressed: () {
            // Your onPressed logic here
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsScreen(),
              ),
            );
          },
          icon: const Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Padding buildPaddingOfUserPref2(String bio) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(
        bio,
        style: const TextStyle(fontSize: 14, color: Colors.white),
      ),
    );
  }

  Padding buildPaddingOfUserPref1(String bio) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(
        bio,
        style: const TextStyle(fontSize: 14, color: Colors.white),
      ),
    );
  }

  ListTile buildListTileOfUsername(User user) {
    return ListTile(
      title: Text(
        user.name,
        style: const TextStyle(fontSize: 25, color: Colors.white),
      ),
      subtitle: Text(
        user.name,
        style: const TextStyle(fontSize: 14, color: Colors.white),
      ),
      trailing: CircleAvatar(
        radius: 26,
        backgroundColor: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image(
            image: AssetImage(
              'assets/images/temp_user_images/${user.username}.jpg',
            ),
          ),
        ),
      ),
    );
  }

  Row buildProfileSettingsButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 17),
          child: OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditProfile(),
                ),
              );
            },
            style: ButtonStyle(
              side: MaterialStateProperty.all(
                const BorderSide(color: Colors.grey),
              ), // Add the grey border color
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10), // Adjust the border radius as desired
                ),
              ),
            ),
            child: const Text(
              'Edit Profile',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 17),
          child: OutlinedButton(
            onPressed: () {},
            style: ButtonStyle(
              side: MaterialStateProperty.all(
                const BorderSide(color: Colors.grey),
              ), // Add the grey border color
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10), // Adjust the border radius as desired
                ),
              ),
            ),
            child: const Text(
              'Share Profile',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  DefaultTabController buildTaps() {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          toolbarHeight: 0,
          bottom: const TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            indicatorSize: TabBarIndicatorSize.tab,
            tabAlignment: TabAlignment.center,
            tabs: [
              Tab(
                text: 'Threads',
              ),
              Tab(
                text: 'Replies',
              ),
            ],
          ),
        ),
        body: buildTabBarViewBody(),
      ),
    );
  }

  TabBarView buildTabBarViewBody() {
    return const TabBarView(
      children: [
        ThreadsPosted(),
        RepliesPosted(),
      ],
    );
  }
}
