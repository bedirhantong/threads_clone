import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Image.asset(
            'assets/images/threads.png',
            width: 50,
            height: 50,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
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
