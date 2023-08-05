import 'package:flutter/material.dart';
import 'package:threads_clone/src/features/authentication/models/refresh_indicator_model/threads_logo_indicator.dart';
import '../comments_of_post_screen/build_post_include_all.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: const SafeArea(
        child: ThreadsLogoIndicator(
          child: ExampleList(),
        ),
      ),
    );
  }
}

class ExampleList extends StatelessWidget {
  final int itemCount;
  final bool countElements;
  final bool reverse;
  final Color backgroundColor;
  const ExampleList({
    Key? key,
    this.reverse = false,
    this.countElements = false,
    this.backgroundColor = Colors.black,
    this.itemCount = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: const [
          BoxShadow(
            blurRadius: 2,
            color: Colors.black12,
            spreadRadius: 0.5,
            offset: Offset(0.0, .0),
          )
        ],
      ),
      child: ListView.separated(
        reverse: reverse,
        physics: const AlwaysScrollableScrollPhysics(
          parent: ClampingScrollPhysics(),
        ),
        itemBuilder: (BuildContext context, int index) =>
            buildPostsScreenForBody(index),
        itemCount: itemCount,
        separatorBuilder: (BuildContext context, int index) => const Divider(
          height: 0,
          color: Color(0xFFe2d6ce),
          thickness: 1,
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

  Column buildPostsScreenForBody(int screenWidth) {
    return Column(
      children: [
        // A post
        BuildPostWithEverything2(
            whoPosted: 'me',
            username: 'bdotng',
            whoCommented: 'musa',
            whatImageIsPosted: 'assets/images/temp_user_images/bdo_post.png',
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
            whatImageIsPosted: 'assets/images/temp_user_images/musa_post.png',
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
            whatImageIsPosted: 'assets/images/temp_user_images/yusuf_post.png',
            whatTextIsPosted: 'Sen de benim gibi bir şeyler denedin mi?',
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
            whatImageIsPosted: 'assets/images/temp_user_images/onur_post.png',
            whatTextIsPosted:
                'Mükemmel şarkı her sabah dinliyorum. Bunsuz güne başlayamıyorum',
            whenPosted: '13 hours ago',
            height: calculateHeight(
                'Welcome to the real world. It sucks! You\'re gonna love it.',
                screenWidth),
            likeNum: 252),
      ],
    );
  }
}

class Element extends StatelessWidget {
  final Widget? child;

  const Element({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FakeBox(height: 80, width: 80, child: child),
          const SizedBox(width: 20),
          const Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FakeBox(height: 8, width: double.infinity),
                FakeBox(height: 8, width: double.infinity),
                FakeBox(height: 8, width: 200),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FakeBox extends StatelessWidget {
  final Widget? child;
  const FakeBox({
    Key? key,
    required this.width,
    required this.height,
    this.child,
  }) : super(key: key);

  final double width;
  final double height;

  static const _boxDecoration = BoxDecoration(
    color: Color(0xFFE2D8D7),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: width,
      height: height,
      decoration: _boxDecoration,
      child: child,
    );
  }
}

class ExampleHorizontalList extends StatelessWidget {
  final int itemCount;
  final bool reverse;
  final Color backgroundColor;
  final bool isHorizontal;

  const ExampleHorizontalList({
    Key? key,
    this.reverse = false,
    this.backgroundColor = Colors.red,
    this.itemCount = 14,
    this.isHorizontal = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: const [
          BoxShadow(
            blurRadius: 2,
            color: Colors.black12,
            spreadRadius: 0.5,
            offset: Offset(0.0, .0),
          )
        ],
      ),
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        reverse: reverse,
        scrollDirection: isHorizontal ? Axis.horizontal : Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(
          parent: ClampingScrollPhysics(),
        ),
        itemBuilder: (BuildContext context, int index) => const Padding(
          padding: EdgeInsets.all(16.0),
          child: FakeBox(
            width: 300,
            height: 300,
          ),
        ),
        itemCount: itemCount,
      ),
    );
  }
}
