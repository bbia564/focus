import 'package:get/get.dart';

import 'focus_add_logic.dart';

class FocusAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FocusAddLogic());
  }
}
