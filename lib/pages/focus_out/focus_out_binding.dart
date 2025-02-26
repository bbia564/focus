import 'package:get/get.dart';

import 'focus_out_logic.dart';

class FocusOutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FocusOutLogic());
  }
}
