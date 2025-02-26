import 'package:get/get.dart';

import 'focus_mang_logic.dart';

class FocusMangBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
