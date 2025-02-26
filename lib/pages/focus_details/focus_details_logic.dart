import 'dart:async';

import 'package:focus_mode/db_focus/focus_entity.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FocusDetailsLogic extends GetxController {
  FocusEntity entity = Get.arguments;

  var timeDown = 0;

  final weeks = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  var dateStr = ''.obs;
  var progress = 0.0.obs;
  var remainingTime = ''.obs;

  Timer? _timer;

  void startTimer() {
    final hMinutes = timeDown ~/ 60;
    final hSeconds = timeDown % 60;
    remainingTime.value = '${hMinutes < 10 ? '0$hMinutes' : hMinutes}:${hSeconds < 10 ? '0$hSeconds' : hSeconds}';
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      timeDown--;
      final now = DateTime.now();
      dateStr.value = '${DateFormat('MM-dd').format(now)}  ${weeks[now.weekday - 1]}';
      progress.value = (entity.minutes * 60 - timeDown) / (entity.minutes * 60);
      final minutes = timeDown ~/ 60;
      final seconds = timeDown % 60;
      remainingTime.value = '${minutes < 10 ? '0$minutes' : minutes}:${seconds < 10 ? '0$seconds' : seconds}';
      if (timeDown <= 0) {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    timeDown = entity.minutes * 60;
    startTimer();
    super.onInit();
  }
}
