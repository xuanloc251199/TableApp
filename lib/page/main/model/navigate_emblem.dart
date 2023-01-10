import 'package:flutter/cupertino.dart';

import '../../../values/colors.dart';
import '../../../values/images.dart';
import '../../../values/strings.dart';

class NavigateEmblem {
  String image;
  String text;
  Color color;

  NavigateEmblem({
    required this.text,
    required this.image,
    required this.color,
  });
}

List<NavigateEmblem> navigateItem = <NavigateEmblem>[
  NavigateEmblem(text: HOME, image: ic_home, color: activeColor),
  NavigateEmblem(text: USER, image: ic_user, color: activeColor),
  NavigateEmblem(text: CHAT, image: ic_chat, color: activeColor),
  NavigateEmblem(text: SETTING, image: ic_setting, color: activeColor),
];
