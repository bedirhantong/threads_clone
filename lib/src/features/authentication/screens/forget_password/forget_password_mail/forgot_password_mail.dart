import 'package:flutter/material.dart';
import 'package:threads_clone/src/constants/sizes.dart';

import '../../../../../common_widgets/form/form_header_widget.dart';
import '../../../../../constants/image_strings.dart';

class ForgotPasswordMailScreen extends StatelessWidget {
  const ForgotPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(defaultSize),
        child: const Column(
          children: [
            SizedBox(
              height: defaultSize * 4,
            )
          ],
        ),
      ),
    );
  }
}
