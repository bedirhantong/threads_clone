import 'package:flutter/material.dart';

import '../comments_of_post_screen/build_post_include_all.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.lock),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: () {
                // Your onPressed logic here
              },
              icon: Image.asset(
                'assets/images/logo/insta.png', // Replace with your custom icon image path
                width: 24, // Set the width as per your requirement
                height: 24, // Set the height as per your requirement
              ),
            ),
            IconButton(
              onPressed: () {
                // Your onPressed logic here
              },
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                title: const Text(
                  'Bedirhan',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                subtitle: const Text(
                  'bedirhantng',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                trailing: CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.transparent,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: const Image(
                      image:
                          AssetImage('assets/images/temp_user_images/me.jpg'),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'CSE_Akdeniz',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'Professional overthinker',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 17),
                    child: OutlinedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(
                          const BorderSide(color: Colors.grey),
                        ), // Add the grey border color
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 17),
                    child: OutlinedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(
                          const BorderSide(color: Colors.grey),
                        ), // Add the grey border color
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
              ),
              Expanded(
                flex: 7,
                //create tab bar
                child: DefaultTabController(
                  length: 8,
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: AppBar(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      toolbarHeight: 1,
                      bottom: const TabBar(
                        isScrollable: true,
                        indicatorColor: Colors.white,
                        indicatorWeight: 3,
                        indicatorSize: TabBarIndicatorSize.tab,
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
                    body: const TabBarView(
                      children: [
                        ThreadsPosted(),
                        RepliesPosted(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card buildPost(
    String whoPosted,
    String username,
    String whoCommented,
    String whatIsPosted,
    String whenPosted,
    double height,
  ) {
    return Card(
      borderOnForeground: true,
      color: Colors.transparent,
      child: Row(
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: Colors.transparent,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image(
                    image: AssetImage(
                        'assets/images/temp_user_images/$whoPosted.jpg'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Image.asset(
                  'assets/images/temp_user_images/scr.png',
                  height: height,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              username,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          const Image(
                            image: AssetImage('assets/icons/verified.png'),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          whenPosted,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 0, bottom: 3),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      whatIsPosted,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ImageIcon(
                      AssetImage('assets/icons/like_post.png'),
                      color: Colors.white,
                    ),
                    ImageIcon(
                      AssetImage('assets/icons/comment.png'),
                      color: Colors.white,
                    ),
                    ImageIcon(
                      AssetImage('assets/icons/repost.png'),
                      color: Colors.white,
                    ),
                    ImageIcon(
                      AssetImage('assets/icons/direct.png'),
                      color: Colors.white,
                    ),
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(
                          'assets/images/temp_user_images/$whoCommented.jpg'),
                      radius: 10.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ThreadsPosted extends StatefulWidget {
  const ThreadsPosted({super.key});

  @override
  State<ThreadsPosted> createState() => _ThreadsPostedState();
}

class _ThreadsPostedState extends State<ThreadsPosted> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        // All posts
        child: Column(
          children: [
            // A post
            BuildPostWithEverything(
                whoPosted: 'me',
                username: 'bdotng',
                whoCommented: 'musa',
                whatIsPosted: 'How you doin\'?',
                whenPosted: '6 hours ago',
                height: calculateHeight('ya xude'),
                likeNum: 23),
            const SizedBox(
              height: 10.0,
            ),
            BuildPostWithEverything(
                whoPosted: 'serhan',
                username: 'srhnbymz',
                whoCommented: 'me',
                whatIsPosted:
                    'They don\'t know that we know they know we know.',
                whenPosted: '2 days ago',
                height: calculateHeight('selam bebek'),
                likeNum: 43),
            const SizedBox(
              height: 10.0,
            ),
            BuildPostWithEverything(
                whoPosted: 'musa',
                username: 'alatasms',
                whoCommented: 'me',
                whatIsPosted: 'PIVOT!',
                whenPosted: '2 hours ago',
                height: calculateHeight('2 hours ago'),
                likeNum: 564),
            const SizedBox(
              height: 10.0,
            ),
            BuildPostWithEverything(
                whoPosted: 'sinan',
                username: 'demir_exe',
                whoCommented: 'serhan',
                whatIsPosted:
                    'Smelly Cat, Smelly Cat, what are they feeding you?',
                whenPosted: '3 hours ago',
                height: calculateHeight('3 minutes ago'),
                likeNum: 23),
            const SizedBox(
              height: 10.0,
            ),
            BuildPostWithEverything(
                whoPosted: 'yusuf',
                username: 'yuciferr',
                whoCommented: 'musa',
                whatIsPosted: 'Could I be wearing any more clothes?',
                whenPosted: '3 minutes ago',
                height: calculateHeight('3 minutes ago'),
                likeNum: 435),
            const SizedBox(
              height: 10.0,
            ),
            BuildPostWithEverything(
                whoPosted: 'onur',
                username: '10urcetin',
                whoCommented: 'serhan',
                whatIsPosted:
                    'Welcome to the real world. It sucks! You\'re gonna love it.',
                whenPosted: '13 hours ago',
                height: calculateHeight('13 hours ago'),
                likeNum: 252),
            const SizedBox(
              height: 10.0,
            ),
            BuildPostWithEverything(
                whoPosted: 'ibrahim',
                username: 'dumanibrahim',
                whoCommented: 'musa',
                whatIsPosted: 'We were on a break!',
                whenPosted: '33 minutes ago',
                height: calculateHeight('hiiiiiiii'),
                likeNum: 454),
            const SizedBox(
              height: 10.0,
            ),
            BuildPostWithEverything(
              whoPosted: 'me',
              username: 'bdotng',
              whoCommented: 'sinan',
              whatIsPosted: 'I know!',
              whenPosted: 'last year',
              height: calculateHeight('last year'),
              likeNum: 324,
              commentsListWidget: [
                BuildPostWithEverything(
                  whoPosted: 'ibrahim',
                  username: 'dumanibrahim',
                  whatIsPosted: 'We were on a break!',
                  whenPosted: '33 minutes ago',
                  height: calculateHeight('hiiiiiiii'),
                  likeNum: 454,
                  whoCommented: '',
                )
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }

  double calculateHeight(String str) {
    if (str.length < 46) {
      return 75.0;
    }
    return ((str.length) / 41.0) * 10;
  }

  Card buildPost(
    String whoPosted,
    String username,
    String whoCommented,
    String whatIsPosted,
    String whenPosted,
    double height,
  ) {
    return Card(
      borderOnForeground: true,
      color: Colors.transparent,
      child: Row(
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: Colors.transparent,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image(
                    image: AssetImage(
                        'assets/images/temp_user_images/$whoPosted.jpg'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Image.asset(
                  'assets/images/temp_user_images/scr.png',
                  height: height,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              username,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          const Image(
                            image: AssetImage('assets/icons/verified.png'),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          whenPosted,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 0, bottom: 3),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      whatIsPosted,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ImageIcon(
                      AssetImage('assets/icons/like_post.png'),
                      color: Colors.white,
                    ),
                    ImageIcon(
                      AssetImage('assets/icons/comment.png'),
                      color: Colors.white,
                    ),
                    ImageIcon(
                      AssetImage('assets/icons/repost.png'),
                      color: Colors.white,
                    ),
                    ImageIcon(
                      AssetImage('assets/icons/direct.png'),
                      color: Colors.white,
                    ),
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(
                          'assets/images/temp_user_images/$whoCommented.jpg'),
                      radius: 10.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RepliesPosted extends StatefulWidget {
  const RepliesPosted({super.key});

  @override
  State<RepliesPosted> createState() => _RepliesPostedState();
}

class _RepliesPostedState extends State<RepliesPosted> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        // All posts
        child: Column(
          children: [
            // A post
            BuildPostWithEverything(
                whoPosted: 'me',
                username: 'bdotng',
                whoCommented: 'musa',
                whatIsPosted: 'How you doin\'?',
                whenPosted: '6 hours ago',
                height: calculateHeight('ya xude'),
                likeNum: 23),
            const SizedBox(
              height: 10.0,
            ),
            BuildPostWithEverything(
                whoPosted: 'serhan',
                username: 'srhnbymz',
                whoCommented: 'me',
                whatIsPosted:
                    'They don\'t know that we know they know we know.',
                whenPosted: '2 days ago',
                height: calculateHeight('selam bebek'),
                likeNum: 43),
            const SizedBox(
              height: 10.0,
            ),
            BuildPostWithEverything(
                whoPosted: 'musa',
                username: 'alatasms',
                whoCommented: 'me',
                whatIsPosted: 'PIVOT!',
                whenPosted: '2 hours ago',
                height: calculateHeight('2 hours ago'),
                likeNum: 564),
            const SizedBox(
              height: 10.0,
            ),
            BuildPostWithEverything(
                whoPosted: 'sinan',
                username: 'demir_exe',
                whoCommented: 'serhan',
                whatIsPosted:
                    'Smelly Cat, Smelly Cat, what are they feeding you?',
                whenPosted: '3 hours ago',
                height: calculateHeight('3 minutes ago'),
                likeNum: 23),
            const SizedBox(
              height: 10.0,
            ),
            BuildPostWithEverything(
                whoPosted: 'yusuf',
                username: 'yuciferr',
                whoCommented: 'musa',
                whatIsPosted: 'Could I be wearing any more clothes?',
                whenPosted: '3 minutes ago',
                height: calculateHeight('3 minutes ago'),
                likeNum: 435),
            const SizedBox(
              height: 10.0,
            ),
            BuildPostWithEverything(
                whoPosted: 'onur',
                username: '10urcetin',
                whoCommented: 'serhan',
                whatIsPosted:
                    'Welcome to the real world. It sucks! You\'re gonna love it.',
                whenPosted: '13 hours ago',
                height: calculateHeight('13 hours ago'),
                likeNum: 252),
            const SizedBox(
              height: 10.0,
            ),
            BuildPostWithEverything(
                whoPosted: 'ibrahim',
                username: 'dumanibrahim',
                whoCommented: 'musa',
                whatIsPosted: 'We were on a break!',
                whenPosted: '33 minutes ago',
                height: calculateHeight('hiiiiiiii'),
                likeNum: 454),
            const SizedBox(
              height: 10.0,
            ),
            BuildPostWithEverything(
              whoPosted: 'me',
              username: 'bdotng',
              whoCommented: 'sinan',
              whatIsPosted: 'I know!',
              whenPosted: 'last year',
              height: calculateHeight('last year'),
              likeNum: 324,
              commentsListWidget: [
                BuildPostWithEverything(
                  whoPosted: 'ibrahim',
                  username: 'dumanibrahim',
                  whatIsPosted: 'We were on a break!',
                  whenPosted: '33 minutes ago',
                  height: calculateHeight('hiiiiiiii'),
                  likeNum: 454,
                  whoCommented: '',
                )
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }

  double calculateHeight(String str) {
    if (str.length < 46) {
      return 75.0;
    }
    return ((str.length) / 41.0) * 10;
  }

  Card buildPost(
    String whoPosted,
    String username,
    String whoCommented,
    String whatIsPosted,
    String whenPosted,
    double height,
  ) {
    return Card(
      borderOnForeground: true,
      color: Colors.transparent,
      child: Row(
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: Colors.transparent,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image(
                    image: AssetImage(
                        'assets/images/temp_user_images/$whoPosted.jpg'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Image.asset(
                  'assets/images/temp_user_images/scr.png',
                  height: height,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              username,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          const Image(
                            image: AssetImage('assets/icons/verified.png'),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          whenPosted,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 0, bottom: 3),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      whatIsPosted,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ImageIcon(
                      AssetImage('assets/icons/like_post.png'),
                      color: Colors.white,
                    ),
                    ImageIcon(
                      AssetImage('assets/icons/comment.png'),
                      color: Colors.white,
                    ),
                    ImageIcon(
                      AssetImage('assets/icons/repost.png'),
                      color: Colors.white,
                    ),
                    ImageIcon(
                      AssetImage('assets/icons/direct.png'),
                      color: Colors.white,
                    ),
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(
                          'assets/images/temp_user_images/$whoCommented.jpg'),
                      radius: 10.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
