import 'package:flutter/material.dart';

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
            buildPost(
              'me',
              'bdotng',
              'musa',
              'How you doin\'?',
              '6 hours ago',
              calculateHeight('ya xude'),
            ),
            const SizedBox(
              height: 10.0,
            ),
            buildPost(
              'serhan',
              'srhnbymz',
              'me',
              'They don\'t know that we know they know we know.',
              '2 days ago',
              calculateHeight('selam bebek'),
            ),
            const SizedBox(
              height: 10.0,
            ),
            buildPost(
              'musa',
              'alatasms',
              'me',
              'PIVOT!',
              '2 hours ago',
              calculateHeight('2 hours ago'),
            ),
            const SizedBox(
              height: 10.0,
            ),
            buildPost(
              'sinan',
              'demir_exe',
              'serhan',
              'Smelly Cat, Smelly Cat, what are they feeding you?',
              '3 hours ago',
              calculateHeight('3 minutes ago'),
            ),
            const SizedBox(
              height: 10.0,
            ),
            buildPost(
              'yusuf',
              'yuciferr',
              'musa',
              'Could I be wearing any more clothes?',
              '3 minutes ago',
              calculateHeight('3 minutes ago'),
            ),
            const SizedBox(
              height: 10.0,
            ),
            buildPost(
              'onur',
              '10urcetin',
              'serhan',
              'Welcome to the real world. It sucks! You\'re gonna love it.',
              '13 hours ago',
              calculateHeight('13 hours ago'),
            ),
            const SizedBox(
              height: 10.0,
            ),
            buildPost(
              'ibrahim',
              'dumanibrahim',
              'musa',
              'We were on a break!',
              '33 minutes ago',
              calculateHeight('hiiiiiiii'),
            ),
            const SizedBox(
              height: 10.0,
            ),
            buildPost(
              'musa',
              'alatasms',
              'serhan',
              'I\'m not so good with the advice. Can I interest you in a sarcastic comment?',
              '5 days ago',
              calculateHeight(
                  'C# da bu haftaki gelişmeler : bedirhan aaki gelişmeler : bedirhan abim C# basic syntax ve linQ öaki gelişmeler : bedirhan abim C# basic syntax ve linQ öaki gelişmeler : bedirhan abim C# basic syntax ve linQ öaki gelişmeler : bedirhan abim C# basic syntax ve linQ öbim C# basic syntax ve linQ öğrendi.'),
            ),
            const SizedBox(
              height: 10.0,
            ),
            buildPost(
              'me',
              'bdotng',
              'sinan',
              'I know!',
              'last year',
              calculateHeight('last year'),
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
            buildPost(
              'serhan',
              'srhnbymz',
              'me',
              'They don\'t know that we know they know we know.',
              '2 days ago',
              calculateHeight('selam bebek'),
            ),
            const SizedBox(
              height: 10.0,
            ),
            buildPost(
              'musa',
              'alatasms',
              'me',
              'PIVOT!',
              '2 hours ago',
              calculateHeight('2 hours ago'),
            ),
            const SizedBox(
              height: 10.0,
            ),
            buildPost(
              'musa',
              'alatasms',
              'serhan',
              'I\'m not so good with the advice. Can I interest you in a sarcastic comment?',
              '5 days ago',
              calculateHeight(
                  'C# da bu haftaki gelişmeler : bedirhan aaki gelişmeler : bedirhan abim C# basic syntax ve linQ öaki gelişmeler : bedirhan abim C# basic syntax ve linQ öaki gelişmeler : bedirhan abim C# basic syntax ve linQ öaki gelişmeler : bedirhan abim C# basic syntax ve linQ öbim C# basic syntax ve linQ öğrendi.'),
            ),
            const SizedBox(
              height: 10.0,
            ),
            buildPost(
              'me',
              'bdotng',
              'sinan',
              'I know!',
              'last year',
              calculateHeight('last year'),
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
