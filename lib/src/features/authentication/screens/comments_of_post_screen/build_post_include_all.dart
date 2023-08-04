import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import 'comments_of_post_screen.dart';

class BuildPostWithEverything extends StatelessWidget {
  const BuildPostWithEverything({
    super.key,
    required this.whoPosted,
    required this.username,
    required this.whoCommented,
    required this.whatIsPosted,
    required this.whenPosted,
    required this.height,
    required this.likeNum,
    this.commentsListWidget,
  });

  final String whoPosted;
  final String username;
  final String? whoCommented;
  final String whatIsPosted;
  final String whenPosted;
  final double height;
  final int likeNum;
  final List<Widget>? commentsListWidget;

  @override
  Widget build(BuildContext context) {
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
              Container(
                height: height,
                width: 1,
                color: Colors.grey,
              ),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(
                    'assets/images/temp_user_images/$whoCommented.jpg'),
                radius: 10.0,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    LikeButton(
                      size: 30.0,
                      circleColor: const CircleColor(
                        start: Color(0xffff1717),
                        end: Color(0xffd00000),
                      ),
                      bubblesColor: const BubblesColor(
                        dotPrimaryColor: Color(0xff9b9b9b),
                        dotSecondaryColor: Color(0xffffffff),
                      ),
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          isLiked ? Icons.favorite : Icons.favorite_border,
                          color: isLiked ? Colors.red : Colors.white,
                          size: 25.0,
                        );
                      },
                      likeCount: likeNum,
                      // TODO: yorumlardaki like sayısı değişmiyor
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CommentOfPostScreen(
                              myWidget: BuildPostWithEverything(
                                  whoPosted: 'me',
                                  username: 'bdotng',
                                  whoCommented: null,
                                  whatIsPosted: 'I know!',
                                  whenPosted: 'last year',
                                  height: calculateHeight('last year'),
                                  likeNum: 324),
                            ),
                          ),
                        );
                      },
                      icon: Image.asset('assets/icons/comment.png'),
                    ),
                    const ImageIcon(
                      AssetImage('assets/icons/repost.png'),
                      color: Colors.white,
                    ),
                    const ImageIcon(
                      AssetImage('assets/icons/direct.png'),
                      color: Colors.white,
                    ),
                  ],
                ),
                whoCommented != null
                    ? Row(
                        children: [
                          Text(
                            '40 comments · $likeNum likes',
                            style: const TextStyle(color: Colors.white54),
                          )
                        ],
                      )
                    : Text('$likeNum likes'),
              ],
            ),
          ),
        ],
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

class BuildPostWithEverything2 extends StatelessWidget {
  const BuildPostWithEverything2({
    super.key,
    required this.whoPosted,
    required this.username,
    required this.whoCommented,
    required this.whatTextIsPosted,
    required this.whenPosted,
    required this.height,
    required this.likeNum,
    this.commentsListWidget,
    this.whatImageIsPosted,
  });

  final String whoPosted;
  final String username;
  final String? whoCommented;
  final String? whatTextIsPosted;
  final String? whatImageIsPosted;
  final String whenPosted;
  final double height;
  final int likeNum;
  final List<Widget>? commentsListWidget;

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // profile foto
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
              // kullanıcı adı ve onay işareti
              Flexible(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
              // tarih ve ayarlar
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
          Center(
            child: Row(
              children: [
                // çubuk
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, right: 20),
                  child: Container(
                    height: height,
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
                // post içeriği
                Expanded(
                  child: buildContent(whatImageIsPosted, whatTextIsPosted),
                ),
              ],
            ),
          ),
          Row(
            children: [
              // yorum yapan kişinin profil fotoğrafı
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: const Text(''),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(
                        'assets/images/temp_user_images/$whoCommented.jpg'),
                    radius: 15.0,
                  ),
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      LikeButton(
                        size: 35.0,
                        circleColor: const CircleColor(
                          start: Color(0xffff1717),
                          end: Color(0xffd00000),
                        ),
                        bubblesColor: const BubblesColor(
                          dotPrimaryColor: Color(0xff9b9b9b),
                          dotSecondaryColor: Color(0xffffffff),
                        ),
                        likeBuilder: (bool isLiked) {
                          return Icon(
                            isLiked ? Icons.favorite : Icons.favorite_border,
                            color: isLiked ? Colors.red : Colors.white,
                            size: 30.0,
                          );
                        },
                        likeCount: likeNum,
                        // TODO: yorumlardaki like sayısı değişmiyor
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CommentOfPostScreen(
                                myWidget: BuildPostWithEverything(
                                    whoPosted: 'me',
                                    username: 'bdotng',
                                    whoCommented: null,
                                    whatIsPosted: 'I know!',
                                    whenPosted: 'last year',
                                    height: height,
                                    likeNum: 324),
                              ),
                            ),
                          );
                        },
                        icon: Image.asset('assets/icons/comment.png'),
                      ),
                      // const ImageIcon(
                      //   AssetImage('assets/icons/repost.png'),
                      //   color: Colors.white,
                      // ),
                      IconButton(
                        onPressed: () {},
                        icon: const Image(
                          image: AssetImage('assets/icons/repost.png'),
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Image(
                          image: AssetImage('assets/icons/direct.png'),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  whoCommented != null
                      ? Row(
                          children: [
                            Text(
                              '40 comments · $likeNum likes',
                              style: const TextStyle(color: Colors.white54),
                            )
                          ],
                        )
                      : Text('$likeNum likes'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildContent(String? whatImageIsPosted, String? whatTextIsPosted) {
    if (whatImageIsPosted != null && whatTextIsPosted != null) {
      return Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              whatTextIsPosted,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Image(
            image: AssetImage(whatImageIsPosted),
          ),
        ],
      );
    } else if (whatImageIsPosted != null && whatTextIsPosted == null) {
      return Image(
        image: AssetImage(whatImageIsPosted),
      );
    } else if (whatImageIsPosted == null && whatTextIsPosted != null) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          whatTextIsPosted,
          style: const TextStyle(color: Colors.white),
        ),
      );
    } else {
      return const Align(
        alignment: Alignment.center,
        child: Text(
          'Content is not found',
          style: TextStyle(color: Colors.white),
        ),
      );
    }
  }
}
