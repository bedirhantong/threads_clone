import 'package:flutter/material.dart';

import '../../comments_of_post_screen/build_post_include_all.dart';

class ThreadsPosted extends StatefulWidget {
  const ThreadsPosted({super.key});

  @override
  State<ThreadsPosted> createState() => _ThreadsPostedState();
}

class _ThreadsPostedState extends State<ThreadsPosted> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    int screenWidth = screenSize.width.toInt();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        // All posts
        child: Column(
          children: [
            // A post
            BuildPostWithEverything2(
                whoPosted: 'me',
                username: 'bdotng',
                whoCommented: 'musa',
                whatImageIsPosted:
                    'assets/images/temp_user_images/bdo_post.png',
                whatTextIsPosted: 'Recent Illustration of mine',
                whenPosted: '6 hours ago',
                height: calculateHeight('How you doin\'?', screenWidth),
                likeNum: 23),
            BuildPostWithEverything2(
              whoPosted: 'me',
              username: 'bdotng',
              whoCommented: 'sinan',
              whatTextIsPosted: 'I know!',
              whenPosted: 'last year',
              height: calculateHeight('I know!', screenWidth),
              likeNum: 324,
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }

  double calculateLineLength(int screenWidth, int totalLines) {
    // Başlangıçta her satır eşit uzunlukta olacak şekilde hesapla
    double initialLineLength = screenWidth.toDouble();

    // Satır sayısı arttıkça çubuğun uzunluğunu hesapla
    double decrementFactor =
        0.8; // Çizgi uzunluğunun azalma faktörü (0.2 yerine istediğiniz bir değer verebilirsiniz)
    double incrementalLineLength =
        initialLineLength * (1.0 - (totalLines - 1) * decrementFactor);

    return incrementalLineLength;
  }

// Instagram postunuza ekleyeceğiniz dik çizginin uzunluğunu hesaplayan fonksiyon
  double calculateHeight(String postContent, int screenWidth) {
    // Verilen metni satır sayısına bölmek için gerekli işlemler
    List<String> lines = postContent.split('\n');
    int totalLines = lines.length;

    // Satır sayısı 0 ise varsayılan bir değer döndür
    if (totalLines == 0) {
      return 0.0;
    }

    // Her satırın eşit uzunlukta başlayarak çubuğun uzunluğunu hesapla
    double lineLength = calculateLineLength(screenWidth, totalLines);

    return (totalLines * 12) + 52.0;
  }
}
