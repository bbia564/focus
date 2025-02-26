import 'package:fluttertoast/fluttertoast.dart';
import 'package:focus_mode/db_focus/db_focus.dart';
import 'package:focus_mode/db_focus/focus_entity.dart';
import 'package:get/get.dart';

class FocusAddLogic extends GetxController {

  DBFocus dbFocus = Get.find();

  String name = '';
  int selectedIndex = 0;

  void commit() async {
    if (name.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter a name');
      return;
    }
    await dbFocus.insertFocus(FocusEntity(id: 0, createdTime: DateTime.now(), name: name, minutes: selectedIndex+1));
    Fluttertoast.showToast(msg: 'Add Success');
    Get.back();
  }

}
