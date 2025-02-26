import 'package:get/get.dart';

import 'focus_second_logic.dart';

class FocusSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FocusSecondLogic());
  }
}
