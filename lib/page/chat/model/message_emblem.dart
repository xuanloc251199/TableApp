import '../../../values/images.dart';
import '../../../values/strings.dart';
import 'user_emblem.dart';

class Message {
  final User sender;
  final String time;
  final String avatar;
  final int? unreadCount;
  final bool? isRead;
  final String text;

  Message({
    required this.sender,
    required this.time,
    this.unreadCount,
    required this.text,
    this.isRead,
    required this.avatar,
  });
}

final List<Message> allChats = <Message>[
  Message(
    sender: name1,
    avatar: user_chat,
    time: TIME_CHAT,
    text: DETAIL_CHAT,
    unreadCount: 0,
    isRead: true,
  ),
  Message(
    sender: name2,
    avatar: user_chat,
    time: TIME_CHAT,
    text: DETAIL_CHAT,
    unreadCount: 1,
    isRead: false,
  ),
  Message(
    sender: name3,
    avatar: user_chat,
    time: TIME_CHAT,
    text: DETAIL_CHAT,
    unreadCount: 0,
    isRead: true,
  ),
];

final List<Message> messages = [
  Message(
    sender: name1,
    avatar: user_chat,
    time: TIME_CHAT,
    text: DETAIL_CHAT,
  ),
  Message(
    sender: currentUser,
    avatar: user_chat,
    time: TIME_CHAT,
    text: DETAIL_CHAT,
    isRead: true,
  ),
  Message(
    sender: currentUser,
    avatar: user_chat,
    time: TIME_CHAT,
    text: DETAIL_CHAT,
    isRead: true,
  ),
  Message(
    sender: name1,
    avatar: user_chat,
    time: TIME_CHAT,
    text: DETAIL_CHAT,
  ),
  Message(
    sender: name1,
    avatar: user_chat,
    time: TIME_CHAT,
    text: DETAIL_CHAT,
  ),
  Message(
    sender: currentUser,
    avatar: user_chat,
    time: TIME_CHAT,
    text: DETAIL_CHAT,
    isRead: true,
  ),
  Message(
    sender: name1,
    avatar: user_chat,
    time: TIME_CHAT,
    text: DETAIL_CHAT,
  ),
];
