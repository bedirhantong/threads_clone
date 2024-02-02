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
                onPressed: () {
                  // method to show the search bar
                  showSearch(
                    context: context,
                    // delegate to customize the search bar
                    delegate: CustomSearchDelegateWithDummyData(),
                  );
                },
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

  Expanded buildExpandedSearchBar(Color color) {
    return Expanded(
      child: Container(
        color: color,
        child: IconButton(
          onPressed: () {
            // method to show the search bar
            showSearch(
                context: context,
                // delegate to customize the search bar
                delegate: CustomSearchDelegateWithDummyData());
          },
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
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
      subtitle: const Text(
        'Serhan Baymaz',
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
      ),
      trailing: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xAB393939),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
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

class CustomSearchDelegateWithDummyData extends SearchDelegate {
// Demo list to show querying
  List<BuildFollowableUser> searchTerms = [
    const BuildFollowableUser(
      imageAssetLink: 'assets/images/temp_user_images/serhan.jpg',
      username: 'srhnbymz',
      name: 'Serhan Baymaz',
    ),
    const BuildFollowableUser(
      imageAssetLink: 'assets/images/temp_user_images/sinan.jpg',
      username: 'demir_exe',
      name: 'Sinan Demir',
    ),
    const BuildFollowableUser(
      imageAssetLink: 'assets/images/temp_user_images/musa.jpg',
      username: 'alatasms',
      name: 'Musa Alataş',
    ),
    const BuildFollowableUser(
      imageAssetLink: 'assets/images/temp_user_images/yusuf.jpg',
      username: 'yuciferr',
      name: 'Yusuf Samed Çelik',
    ),
    const BuildFollowableUser(
      imageAssetLink: 'assets/images/temp_user_images/onur.jpg',
      username: '10nurcetin',
      name: 'Onur Çetin',
    ),
  ];

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.username.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit.username);
      }
    }
    return Container(
      color: Colors.black, //
      child: ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            focusColor: Colors.black,
            title: Text(result),
          );
        },
      ),
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<BuildFollowableUser> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.username.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return Container(
      color: Colors.black,
      child: ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return result;
        },
      ),
    );
  }
}
