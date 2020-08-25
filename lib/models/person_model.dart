const String namePerson = 'Alexandr Zherebtsov';
const String numberPerson = '+380931122334';
const String iconPerson = 'assets/images/ava_current.jpg';
const String iconTheme = 'assets/images/wallpaper.jpg';
const bool inThisDevice = true;

class User {
  final int id;
  final String name;
  final String imageUrl;
  final String lastSeen;
  final bool onlineNow;
  final bool inThisDevice;

  User({
    this.id,
    this.name,
    this.imageUrl,
    this.lastSeen,
    this.onlineNow,
    this.inThisDevice,
  });
}

final User currentUser = User(
  id: 0,
  name: namePerson,
  imageUrl: iconPerson,
  lastSeen: 'Online',
  onlineNow: true,
);

final User userId1 = User(
  id: 1,
  name: 'Владимир Михайловский-Салтыков',
  imageUrl: 'assets/images/ava_id1.jpg',
  lastSeen: 'Online',
  onlineNow: true,
);

final User userId2 = User(
  id: 2,
  name: 'Пономаренко Борислав Миколайович',
  imageUrl: 'assets/images/ava_id2.jpg',
  lastSeen: 'last seen at 17:56',
  onlineNow: false,
);

final User userId3 = User(
  id: 3,
  name: 'Jack Johnson',
  imageUrl: 'assets/images/ava_id3.jpg',
  lastSeen: 'Online',
  onlineNow: true,
);

final User userId4 = User(
  id: 4,
  name: 'Charlie Smith',
  imageUrl: 'assets/images/ava_id4.jpg',
  lastSeen: 'Online',
  onlineNow: true,
);

final User userId5 = User(
  id: 5,
  name: 'Joshua Williams',
  imageUrl: 'assets/images/ava_id5.jpg',
  lastSeen: 'Online',
  onlineNow: true,
);

final User userId6 = User(
  id: 6,
  name: 'Oliver Edwards',
  imageUrl: 'assets/images/ava_id6.jpg',
  lastSeen: 'last seen at 16:44',
  onlineNow: false,
);

final User userId7 = User(
  id: 7,
  name: '徳仁',
  imageUrl: 'assets/images/ava_id7.jpg',
  lastSeen: 'last seen at 11:56',
  onlineNow: false,
);

final User userId8 = User(
  id: 8,
  name: '朱常洛',
  imageUrl: 'assets/images/ava_id8.jpg',
  lastSeen: 'last seen at 09:06',
  onlineNow: false,
);

final User userId9 = User(
  id: 9,
  name: 'Theodore Jones',
  imageUrl: 'assets/images/ava_id9.jpg',
  lastSeen: 'last seen at 10:20',
  onlineNow: false,
);

final User userId10 = User(
  id: 10,
  name: 'سید سجاد',
  imageUrl: 'assets/images/ava_id10.jpg',
  lastSeen: 'last seen at 22:21',
  onlineNow: false,
);

final User userId11 = User(
  id: 11,
  name: 'Albert Morgan',
  imageUrl: 'assets/images/default.jpg',
  lastSeen: 'Online',
  onlineNow: true,
);

class FoldersNames {
  const FoldersNames({this.title});
  final String title;
}

const List<FoldersNames> foldersNames = const <FoldersNames>[
  const FoldersNames(title: 'All'),
  const FoldersNames(title: 'Bands'),
  const FoldersNames(title: 'IT',),
  const FoldersNames(title: 'University'),
  const FoldersNames(title: 'Telegram'),
  const FoldersNames(title: 'Flutter'),
  const FoldersNames(title: 'Music'),
];
