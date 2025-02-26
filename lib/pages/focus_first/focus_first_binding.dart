import 'package:get/get.dart';

import 'focus_first_logic.dart';

class FocusFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FocusFirstLogic());
  }
}
