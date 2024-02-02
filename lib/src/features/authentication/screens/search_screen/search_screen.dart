import 'package:flutter/material.dart';
import '../../../../constants/app_starter.dart';
import '../../objects/user.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.user});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
  final User user;
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius:
                  BorderRadius.circular(11), // Increase border radius here
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                label: const Text(
                  'Search',
                  style: TextStyle(color: Colors.black26, fontSize: 19),
                ),
              ),
            ),
          ),
        ),
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: Colors.black12,
              spreadRadius: 0.5,
              offset: Offset(0.0, .0),
            )
          ],
        ),
        child: ListView.builder(
          itemCount: AppStarter.allUsers.length,
          itemBuilder: (context, index) {
            return BuildFollowableUser(
              imageAssetLink: AppStarter.allUsers[index].profilePictureLink,
              username: AppStarter.allUsers[index].name,
              name: AppStarter.allUsers[index].name,
            );
          },
        ),
      ),
    );
  }
}

class BuildFollowableUser extends StatelessWidget {
  const BuildFollowableUser({
    super.key,
    required this.imageAssetLink,
    required this.username,
    required this.name,
  });

  final String imageAssetLink;
  final String username;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          shape: const CircleBorder(),
        ),
        onPressed: () {},
        child: CircleAvatar(
          radius: 26,
          backgroundColor: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image(
              image: AssetImage(imageAssetLink),
            ),
          ),
        ),
      ),
      title: Row(
        children: [
          Text(
            username,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Image.asset('assets/icons/verified.png')
        ],
      ),
      subtitle: Text(
        name,
        style:
            const TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
      ),
      trailing: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xAB393939),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 1,
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: () {},
        child: const Text(
          'Follow',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
