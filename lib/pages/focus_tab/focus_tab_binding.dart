import 'package:get/get.dart';

import '../focus_first/focus_first_logic.dart';
import '../focus_second/focus_second_logic.dart';
import 'focus_tab_logic.dart';

class FocusTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FocusTabLogic());
    Get.lazyPut(() => FocusFirstLogic());
    Get.lazyPut(() => FocusSecondLogic());
  }
}
