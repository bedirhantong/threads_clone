import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:threads_clone/src/features/authentication/objects/thread.dart';
import 'package:threads_clone/src/features/authentication/screens/main_screen/main_screen.dart';
import 'dart:io';
import '../../view_model/app_starter.dart';

class PostScreen extends ConsumerStatefulWidget {
  const PostScreen({super.key});

  @override
  ConsumerState<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends ConsumerState<PostScreen> {
  String visibility = "Anyone can reply";
  late String content;

  // ---
  ImagePicker picker = ImagePicker();
  XFile? _pickedImage;
  String textContent = "";
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
    final userViewModel = ref.watch(userViewModelProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'New thread',
            style: TextStyle(
              fontSize: 19.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          color: Colors.black,
          child: Card(
            borderOnForeground: true,
            color: Colors.white12,
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
                              'assets/images/temp_user_images/${userViewModel.currentUser.username}.jpg'),
                        ),
                      ),
                    ),
                    // kullanıcı adı ve onay işareti
                    Flexible(
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              userViewModel.currentUser.username,
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
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          onChanged: (value) {
                            setState(() {
                              textContent = value;
                            });
                          },
                          decoration: const InputDecoration(
                            hintText: '+ Write Bio',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            focusColor: Colors.white,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      whatImageIsPosted != null
                          ? Expanded(
                              child: Image.file(
                                File(whatImageIsPosted!),
                              ),
                            )
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
                  ),
                ),
              ],
            ),
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
                  ref.read(userViewModelProvider).currentUser.threadsPosted.add(
                        Thread(
                          whoPosted: userViewModel.currentUser,
                          whenPosted: "2 day",
                          likeNum: 0,
                          whatTextIsPosted: textContent,
                          whatImageIsPosted: whatImageIsPosted,
                        ),
                      );

                  AppStarter.allThreads.add(
                    Thread(
                      whoPosted: userViewModel.currentUser,
                      whenPosted: "2 day",
                      likeNum: 0,
                      whatTextIsPosted: textContent,
                      whatImageIsPosted: whatImageIsPosted,
                    ),
                  );
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainScreen(),
                    ),
                    (route) => false,
                  );
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
