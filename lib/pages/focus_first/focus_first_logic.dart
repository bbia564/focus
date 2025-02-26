import 'package:focus_mode/db_focus/db_focus.dart';
import 'package:focus_mode/db_focus/focus_entity.dart';
import 'package:get/get.dart';

class FocusFirstLogic extends GetxController {

  DBFocus dbFocus = Get.find();

  var list = <FocusEntity>[].obs;

  void getData() async {
    list.value = await dbFocus.getFocusAllData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
