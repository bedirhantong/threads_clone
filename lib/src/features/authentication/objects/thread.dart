import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../screens/comments_of_post_screen/build_post_include_all.dart';
import '../screens/comments_of_post_screen/comments_of_post_screen.dart';

class Thread {
  String? id;
  final int numOfLikes;
  final String whoPosted;
  final String username;

  final String? whoCommented;
  final String? whatTextIsPosted;
  final String? whatImageIsPosted;
  final String whenPosted;
  final double height;
  final int likeNum;
  final List<Widget>? commentsListWidget;
  // String token = "";

  Thread(
    this.whoPosted,
    this.whatTextIsPosted,
    this.whatImageIsPosted,
    this.whenPosted,
    this.likeNum,
    this.commentsListWidget,
    this.whoCommented,
    this.height,
    this.numOfLikes,
    this.username, {
    this.id,
  });

  Widget buildThread(BuildContext context) {
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
