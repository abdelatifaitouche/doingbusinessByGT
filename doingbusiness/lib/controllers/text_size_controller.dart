import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TextSizeController extends GetxController {
  final box = GetStorage();
  RxInt font_size = 17.obs;

  void onInit() async {
    font_size.value = box.read("font_size");
    super.onInit();
  }

  void add() {
    if (font_size.value < 35) {
      font_size.value += 1;
      box.write("font_size", font_size.value);
    }
  }

  void reduce() {
    if (font_size.value > 16) {
      font_size.value -= 1;
      box.write("font_size", font_size.value);
    }
  }
}
