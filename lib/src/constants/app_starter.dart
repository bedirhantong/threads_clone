import '../features/authentication/objects/thread.dart';
import '../features/authentication/objects/user.dart';

class AppStarter {
  static List<Thread> allThreads = [
    Thread(
        whoPosted: 'me',
        whatTextIsPosted: 'Recent Illustration of mine',
        whatImageIsPosted: 'assets/images/temp_user_images/bdo_post.png',
        whenPosted: '6 hours',
        likeNum: 23,
        height: calculateHeight(
          'How you doin\'?',
          230,
        ),
        username: 'bdotng'),
    Thread(
        whoPosted: 'serhan',
        whatTextIsPosted: 'All of my dream is to be a pilot.',
        whatImageIsPosted: 'assets/images/temp_user_images/f35.png',
        whenPosted: '2 days',
        likeNum: 23,
        height: calculateHeight(
          'They don\'t know that we know they know we know.',
          250,
        ),
        username: 'srhnbymz'),
    Thread(
        whoPosted: 'musa',
        whatTextIsPosted:
            'Bir şeyler denedim yine because I am Musa, I do such things.',
        whatImageIsPosted: 'assets/images/temp_user_images/musa_post.png',
        whenPosted: '2 hours',
        likeNum: 23,
        height: calculateHeight(
          'PIVOT!',
          450,
        ),
        username: 'alatasms'),
    Thread(
        whoPosted: 'sinan',
        whatTextIsPosted: 'Smelly Cat, Smelly Cat, what are they feeding you?',
        whenPosted: 'last year',
        likeNum: 23,
        height: calculateHeight(
          'Smelly Cat, Smelly Cat, what are they feeding you?',
          50,
        ),
        username: 'demir_exe'),
    Thread(
        whoPosted: 'yusuf',
        whatTextIsPosted: 'Sen de benim gibi bir şeyler denedin mi?',
        whatImageIsPosted: 'assets/images/temp_user_images/yusuf_post.png',
        whenPosted: '3 min',
        likeNum: 23,
        height: calculateHeight(
          'Could I be wearing any more clothes?',
          200,
        ),
        username: 'yuciferr'),
    Thread(
        whoPosted: 'onur',
        whatTextIsPosted:
            'Mükemmel şarkı her sabah dinliyorum. Bunsuz güne başlayamıyorum',
        whatImageIsPosted: 'assets/images/temp_user_images/onur_post.png',
        whenPosted: '13 hours',
        likeNum: 23,
        height: calculateHeight(
          'Welcome to the real world. It sucks! You\'re gonna love it.',
          190,
        ),
        username: '10urcetin'),
  ];

  static double calculateHeight(String postContent, double imageHeight) {
    // Verilen metni satır sayısına bölmek için gerekli işlemler
    List<String> lines = postContent.split('\n');
    int totalLines = lines.length;

    // Satır sayısı 0 ise varsayılan bir değer döndür
    if (totalLines == 0) {
      return 0.0;
    }

    return (totalLines * 12) + imageHeight;
  }

  static List<User> allUsers = [
    User(
      name: "ucak_adam",
      email: "srhn@bdo.com",
      password: "123",
      phoneNumber: "012321321",
      bio: "",
      profilePictureLink: 'assets/images/temp_user_images/serhan.jpg',
    ),
    User(
      name: "si_sharp",
      email: "mouses@bdo.com",
      password: "123",
      phoneNumber: "012321321",
      bio: "",
      profilePictureLink: 'assets/images/temp_user_images/musa.jpg',
    ),
    User(
      name: "10nur",
      email: "10nur@bdo.com",
      password: "123",
      phoneNumber: "012321321",
      bio: "",
      profilePictureLink: 'assets/images/temp_user_images/onur.jpg',
    ),
    User(
      name: "yucifer",
      email: "yusuf@bdo.com",
      password: "123",
      phoneNumber: "012321321",
      bio: "",
      profilePictureLink: 'assets/images/temp_user_images/yusuf.jpg',
    ),
  ];
}
