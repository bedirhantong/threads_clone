import 'package:flutter/material.dart';
import '../comments_of_post_screen/build_post_include_all.dart';

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
}
