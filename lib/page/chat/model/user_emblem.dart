import '../../../values/images.dart';
import '../../../values/strings.dart';

class User {
  final int id;
  final String name;
  final String avatar;
  final String status;

  User({
    required this.id,
    required this.name,
    required this.status,
    required this.avatar,
  });
}

final User currentUser =
    User(id: 0, name: ME, avatar: user_chat, status: STATUS);

final User name1 = User(id: 1, name: NAME1, avatar: user_chat, status: STATUS);

final User name2 = User(id: 2, name: NAME2, avatar: user_chat, status: STATUS);

final User name3 = User(id: 3, name: NAME3, avatar: user_chat, status: STATUS);
