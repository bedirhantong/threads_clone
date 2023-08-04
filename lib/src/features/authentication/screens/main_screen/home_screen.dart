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
    var screenSize = MediaQuery.of(context).size;
    int screenWidth = screenSize.width.toInt();
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
                const SizedBox(
                  height: 10.0,
                ),
                BuildPostWithEverything2(
                    whoPosted: 'serhan',
                    username: 'srhnbymz',
                    whoCommented: 'me',
                    whatTextIsPosted: 'All of my dream is to be a pilot.',
                    whatImageIsPosted: 'assets/images/temp_user_images/f35.png',
                    // whatImageIsPosted: 'https://www.savunmasanayist.com/wp-content/uploads/2018/08/lockheed-martin-f-35-lightning-ii-wallpapers-29075-6049167.jpg',
                    whenPosted: '2 days ago',
                    height: calculateHeight(
                      'They don\'t know that we know they know we know.',
                      screenWidth,
                    ),
                    likeNum: 43),
                const SizedBox(
                  height: 10.0,
                ),
                BuildPostWithEverything2(
                    whoPosted: 'musa',
                    username: 'alatasms',
                    whoCommented: 'me',
                    whatImageIsPosted:
                        'assets/images/temp_user_images/musa_post.png',
                    whatTextIsPosted:
                        'Bir şeyler denedim yine because I am Musa, I do such things.',
                    whenPosted: '2 hours ago',
                    height: calculateHeight('PIVOT!', screenWidth),
                    likeNum: 564),
                const SizedBox(
                  height: 10.0,
                ),
                BuildPostWithEverything2(
                    whoPosted: 'sinan',
                    username: 'demir_exe',
                    whoCommented: 'serhan',
                    whatTextIsPosted:
                        'Smelly Cat, Smelly Cat, what are they feeding you?',
                    whenPosted: 'last year',
                    height: calculateHeight(
                        'Smelly Cat, Smelly Cat, what are they feeding you?',
                        screenWidth),
                    likeNum: 23),
                const SizedBox(
                  height: 10.0,
                ),
                BuildPostWithEverything2(
                    whoPosted: 'yusuf',
                    username: 'yuciferr',
                    whoCommented: 'musa',
                    whatImageIsPosted:
                        'assets/images/temp_user_images/yusuf_post.png',
                    whatTextIsPosted:
                        'Sen de benim gibi bir şeyler denedin mi?',
                    whenPosted: '3 minutes ago',
                    height: calculateHeight(
                        'Could I be wearing any more clothes?', screenWidth),
                    likeNum: 435),
                const SizedBox(
                  height: 10.0,
                ),
                BuildPostWithEverything2(
                    whoPosted: 'onur',
                    username: '10urcetin',
                    whoCommented: 'serhan',
                    whatImageIsPosted:
                        'assets/images/temp_user_images/onur_post.png',
                    whatTextIsPosted:
                        'Mükemmel şarkı her sabah dinliyorum. Bunsuz güne başlayamıyorum',
                    whenPosted: '13 hours ago',
                    height: calculateHeight(
                        'Welcome to the real world. It sucks! You\'re gonna love it.',
                        screenWidth),
                    likeNum: 252),
                const SizedBox(
                  height: 10.0,
                ),
                BuildPostWithEverything2(
                    whoPosted: 'ibrahim',
                    username: 'dumanibrahim',
                    whoCommented: 'musa',
                    whatTextIsPosted: 'We were on a break!',
                    whenPosted: '33 minutes ago',
                    height: calculateHeight('We were on a break!', screenWidth),
                    likeNum: 454),
                const SizedBox(
                  height: 10.0,
                ),
                BuildPostWithEverything2(
                  whoPosted: 'me',
                  username: 'bdotng',
                  whoCommented: 'sinan',
                  whatTextIsPosted: 'I know!',
                  whenPosted: 'last year',
                  height: calculateHeight('I know!', screenWidth),
                  likeNum: 324,
                  commentsListWidget: [
                    BuildPostWithEverything2(
                      whoPosted: 'ibrahim',
                      username: 'dumanibrahim',
                      whatTextIsPosted: 'We were on a break!',
                      whenPosted: '33 minutes ago',
                      height:
                          calculateHeight('We were on a break!', screenWidth),
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
