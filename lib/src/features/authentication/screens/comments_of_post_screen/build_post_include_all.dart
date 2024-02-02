import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../../objects/thread.dart';
import 'comments_of_post_screen.dart';

class BuildPostWithEverything2 extends StatelessWidget {
  const BuildPostWithEverything2({
    super.key,
    required this.thread,
  });
  final Thread thread;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        borderOnForeground: true,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // profile foto
                CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.transparent,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image(
                      image: AssetImage(
                          'assets/images/temp_user_images/${thread.whoPosted}.jpg'),
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
                          thread.username,
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Text(
                        thread.whenPosted,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
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
                      height: thread.height,
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                  // post içeriği
                  Expanded(
                    child: buildContent(
                        thread.whatImageIsPosted, thread.whatTextIsPosted),
                  ),
                ],
              ),
            ),
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
                  likeCount: thread.likeNum,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommentOfPostScreen(
                            myWidget: BuildPostWithEverything2(
                              thread: thread,
                            ),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.mode_comment_outlined,
                      color: Colors.white,
                    )
                    // icon: Image.asset('assets/icons/comment.png'),
                    ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.cyclone_outlined,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                      color: Colors.white,
                    )),
              ],
            ),
          ],
        ),
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
