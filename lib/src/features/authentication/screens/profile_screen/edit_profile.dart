import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

bool light = false;

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _linkController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    @override
    void dispose() {
      _linkController.dispose();
      super.dispose();
    }

    void _launchUrl() async {
      String url = _linkController.text;
      if (await canLaunchUrl(url as Uri)) {
        await launchUrl(url as Uri);
      } else {
        print('Could not launch $url');
      }
    }

    final MaterialStateProperty<Icon?> thumbIcon =
        MaterialStateProperty.resolveWith<Icon?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return const Icon(Icons.check);
        }
        return const Icon(Icons.close);
      },
    );
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text('Edit Profile'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Done',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.center,
        child: Wrap(
          children: [
            Card(
              color: const Color(0xAB393939),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.grey,
                  strokeAlign: 3,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text(
                        'Name',
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: ListTile(
                        title: const Text(
                          'Bedirhan(@bedirhantng)',
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: const Icon(
                          Icons.account_circle_outlined,
                          color: Colors.white,
                        ),
                        trailing: CircleAvatar(
                          radius: 26,
                          backgroundColor: Colors.transparent,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: const Image(
                              image: AssetImage(
                                  'assets/images/temp_user_images/me.jpg'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        'Bio',
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: '+ Write Bio',
                          hintStyle: TextStyle(color: Colors.grey),
                          focusColor: Colors.white,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        'Link',
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _linkController,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                hintText: '+ enter a URL',
                                hintStyle: TextStyle(color: Colors.grey),
                                focusColor: Colors.white,
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter a URL';
                                }
                                return null;
                              },
                            ),
                            GestureDetector(
                              onTap: _launchUrl,
                              child: Text(
                                _linkController.text,
                                style: const TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        'Private profile',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Switch(
                        thumbIcon: thumbIcon,
                        value: light,
                        onChanged: (bool value) {
                          setState(
                            () {
                              light = value;
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
