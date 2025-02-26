import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'focus_details_logic.dart';

class FocusDetailsPage extends GetView<FocusDetailsLogic> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (b,r) {
        controller.stopTimer();
      },
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: <Widget>[
            Image.asset(
              'assets/icon.webp',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            SafeArea(
                child: <Widget>[
              Text(
                controller.entity.name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Obx(() {
                return Text(
                  controller.dateStr.value,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                );
              }),
              const SizedBox(
                height: 25,
              ),
              <Widget>[
                SizedBox(
                  width: 232,
                  height: 232,
                  child: Obx(() {
                    return CircularProgressIndicator(
                      value: controller.progress.value,
                      backgroundColor: Colors.white.withOpacity(0.27),
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.white),
                    );
                  }),
                ),
                <Widget>[
                  const Text(
                    'Remaining time',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Obx(() {
                    return Text(
                      controller.remainingTime.value,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 56,
                          fontWeight: FontWeight.bold),
                    );
                  })
                ].toColumn(mainAxisAlignment: MainAxisAlignment.center)
              ].toStack(alignment: Alignment.center),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: 214,
                height: 76,
                alignment: Alignment.center,
                child: const Text(
                  'Long press to exit',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              )
                  .decorated(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12))
                  .gestures(onLongPress: () {
                controller.stopTimer();
                Get.offAndToNamed('/focusOut',
                    arguments: controller.entity,
                    parameters: {'timeDown': controller.timeDown.toString()});
              })
            ].toColumn(mainAxisAlignment: MainAxisAlignment.center))
          ].toStack(alignment: Alignment.center),
        ),
      ),
    );
  }
}
