import 'package:get/get.dart';

import 'focus_details_logic.dart';

class FocusDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FocusDetailsLogic());
  }
}
