import '../../../values/images.dart';
import '../../../values/strings.dart';

class RestaurantEmblem {
  String imgRes;
  String nameRes;
  String time;

  RestaurantEmblem({
    required this.imgRes,
    required this.nameRes,
    required this.time,
  });
}

List<RestaurantEmblem> restaurantItem = <RestaurantEmblem>[
  RestaurantEmblem(imgRes: vegan, nameRes: VEGAN, time: TIME),
  RestaurantEmblem(imgRes: healthy, nameRes: VEGAN, time: TIME),
  RestaurantEmblem(imgRes: goodFood, nameRes: VEGAN, time: TIME),
  RestaurantEmblem(imgRes: vegan, nameRes: VEGAN, time: TIME),
  RestaurantEmblem(imgRes: healthy, nameRes: VEGAN, time: TIME),
  RestaurantEmblem(imgRes: resto, nameRes: VEGAN, time: TIME),
];
