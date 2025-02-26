import 'package:focus_mode/db_focus/db_focus.dart';
import 'package:focus_mode/db_focus/focus_entity.dart';
import 'package:get/get.dart';

class FocusOutLogic extends GetxController {

  DBFocus dbFocus = Get.find();

  FocusEntity entity = Get.arguments;

  var useTimeStr = ''.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    final timeDown = Get.parameters['timeDown'] ?? '0';
    final useTime = entity.minutes*60 - int.parse(timeDown);
    final minutes = useTime ~/ 60;
    final seconds = useTime % 60;
    useTimeStr.value = '${minutes < 10 ? '0$minutes' : minutes}:${seconds < 10 ? '0$seconds' : seconds}';
    await dbFocus.insertRecord(FocusEntity(id: 0, createdTime: DateTime.now(), name: entity.name, minutes: useTime));
    super.onInit();
  }

}
