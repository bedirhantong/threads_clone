import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:threads_clone/src/features/authentication/objects/thread.dart';
import 'package:threads_clone/src/features/authentication/screens/main_screen/main_screen.dart';
import 'dart:io';

import '../../objects/user.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key, required this.user});

  @override
  State<PostScreen> createState() => _PostScreenState();
  final User user;
}

class _PostScreenState extends State<PostScreen> {
  ImagePicker picker = ImagePicker();
  String visibility = "Anyone can reply";
  Thread thread = Thread(
      whoPosted: "", whenPosted: "2 days", likeNum: 0, height: 0, username: "");

  @override
  Widget build(BuildContext context) {
    thread.whoPosted = widget.user.name;
    thread.username = widget.user.username!;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: TextButton(
            onPressed: () {},
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),
          ),
          leadingWidth: 100,
          backgroundColor: Colors.black,
          title: const Text(
            'New thread',
            style: TextStyle(fontSize: 19.0),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          color: Colors.black,
          child: const Column(
            children: [
              BuildPostToShare(
                whoPosted: 'me',
                username: 'bedirhantng',
                whoCommented: null,
                whatTextIsPosted: null,
                whenPosted: null,
                height: 0.0,
                likeNum: 0,
                commentsListWidget: null,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        color: Colors.black87,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            TextButton(
                              child: const Text(
                                'Anyone can reply',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                setState(() {
                                  visibility = "Anyone can reply";
                                });
                                Navigator.pop(context);
                              },
                            ),
                            TextButton(
                              child: const Text(
                                'My followers can reply',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                setState(() {
                                  visibility = "My followers can reply";
                                });
                                Navigator.pop(context);
                              },
                            ),
                            TextButton(
                              child: const Text(
                                'No one can reply',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                setState(() {
                                  visibility = "No one can reply";
                                });
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  visibility,
                  style: const TextStyle(color: Colors.grey, fontSize: 15.0),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainScreen(
                          user: widget.user,
                        ),
                      ),
                      (route) => false);
                },
                child: const Text(
                  'Post',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildPostToShare extends StatefulWidget {
  const BuildPostToShare({
    super.key,
    required this.whoPosted,
    required this.username,
    required this.whoCommented,
    required this.whatTextIsPosted,
    required this.whenPosted,
    required this.height,
    required this.likeNum,
    this.commentsListWidget,
  });

  final String whoPosted;
  final String username;
  final String? whoCommented;
  final String? whatTextIsPosted;
  final String? whenPosted;
  final double height;
  final int likeNum;
  final List<Widget>? commentsListWidget;

  @override
  State<BuildPostToShare> createState() => _BuildPostToShareState();
}

class _BuildPostToShareState extends State<BuildPostToShare> {
  ImagePicker picker = ImagePicker();
  XFile? _pickedImage;
  String? whatImageIsPosted;

  Future<void> _pickImageFromGallery() async {
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _pickedImage = pickedImage;
        whatImageIsPosted = _pickedImage!.path;
        // if (kDebugMode) {
        //   print('path is : $whatImageIsPosted');
        // }
      });
    } else {
      // Handle the case where no image was picked
    }
  }

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
                        'assets/images/temp_user_images/${widget.whoPosted}.jpg'),
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
                        widget.username,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const Image(
                      image: AssetImage('assets/icons/verified.png'),
                    ),
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
                    height: widget.height,
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
                // post içeriği
                Expanded(
                  child:
                      buildContent(whatImageIsPosted, widget.whatTextIsPosted),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContent(String? whatImageIsPosted, String? whatTextIsPosted) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: TextFormField(
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: '+ Write Bio',
              hintStyle: TextStyle(color: Colors.grey),
              focusColor: Colors.white,
              border: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        whatImageIsPosted != null
            ? Image.file(File(whatImageIsPosted))
            : Container(),
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            onPressed: () async {
              await _pickImageFromGallery();
            },
            icon: const Icon(
              Icons.attach_file_outlined,
              color: Colors.blueGrey,
            ),
          ),
        ),
      ],
    );
  }
}
