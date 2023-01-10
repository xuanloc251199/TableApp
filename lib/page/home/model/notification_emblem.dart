import '../../../values/images.dart';
import '../../../values/strings.dart';

class NotificationEmblem {
  String imgIcon;
  String notification;
  String description;

  NotificationEmblem({
    required this.imgIcon,
    required this.notification,
    required this.description,
  });
}

List<NotificationEmblem> notificationItem = <NotificationEmblem>[
  NotificationEmblem(
    imgIcon: ic_checked,
    notification: NOTIFICATION_DETAIL,
    description: DESCRIPTION,
  ),
  NotificationEmblem(
    imgIcon: ic_money,
    notification: NOTIFICATION_DETAIL,
    description: DESCRIPTION,
  ),
  NotificationEmblem(
    imgIcon: ic_canceled,
    notification: NOTIFICATION_DETAIL,
    description: DESCRIPTION,
  ),
];
