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
                buildPost('me', 'bdotng', 'musa'),
                const SizedBox(
                  height: 10.0,
                ),
                buildPost('serhan', 'srhnbymz', 'me'),
                const SizedBox(
                  height: 10.0,
                ),
                buildPost('musa', 'alatasms', 'me'),
                const SizedBox(
                  height: 10.0,
                ),
                buildPost('sinan', 'demir_exe', 'serhan'),
                const SizedBox(
                  height: 10.0,
                ),
                buildPost('yusuf', 'yuciferr', 'musa'),
                const SizedBox(
                  height: 10.0,
                ),
                buildPost('onur', '10urcetin', 'serhan'),
                const SizedBox(
                  height: 10.0,
                ),
                buildPost('ibrahim', 'dmnibrhm', 'musa'),
                const SizedBox(
                  height: 10.0,
                ),
                buildPost('musa', 'alatasms', 'serhan'),
                const SizedBox(
                  height: 10.0,
                ),
                buildPost('me', 'bdotng', 'sinan'),
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

  Card buildPost(
    String whoPosted,
    String username,
    String whoCommented,
  ) {
    return Card(
      borderOnForeground: true,
      color: Colors.transparent,
      child: Row(
        children: [
          Flexible(
            child: Column(
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
                Image.asset(
                  'assets/images/temp_user_images/scr.png',
                  height: 72,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Text(
                            username,
                            style: const TextStyle(color: Colors.white),
                          ),
                          const Image(
                            image: AssetImage('assets/icons/verified.png'),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: const [
                        Text(
                          '6 min ago',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.more_vert_sharp,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Hello World!',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Expanded(
                      child: ImageIcon(
                        AssetImage('assets/icons/like_post.png'),
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: ImageIcon(
                        AssetImage('assets/icons/comment.png'),
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: ImageIcon(
                        AssetImage('assets/icons/repost.png'),
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: ImageIcon(
                        AssetImage('assets/icons/direct.png'),
                        color: Colors.white,
                      ),
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
