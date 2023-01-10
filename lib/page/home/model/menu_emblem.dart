import '../../../values/images.dart';
import '../../../values/strings.dart';

class MenuEmblem {
  String imgMenu;
  String nameMenu;
  String nameRes;
  String price;

  MenuEmblem({
    required this.imgMenu,
    required this.nameRes,
    required this.nameMenu,
    required this.price,
  });
}

List<MenuEmblem> menuItem = <MenuEmblem>[
  MenuEmblem(
      imgMenu: greenNoddle,
      nameMenu: GREEN_NODDLE,
      nameRes: VEGAN,
      price: PRICE),
  MenuEmblem(
      imgMenu: greenNoddle,
      nameMenu: GREEN_NODDLE,
      nameRes: GREEN_NODDLE,
      price: PRICE),
  MenuEmblem(
      imgMenu: greenNoddle,
      nameMenu: GREEN_NODDLE,
      nameRes: GREEN_NODDLE,
      price: PRICE),
];
