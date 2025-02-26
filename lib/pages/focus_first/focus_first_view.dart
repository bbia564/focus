import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:focus_mode/main.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'focus_first_logic.dart';

class FocusFirstPage extends GetView<FocusFirstLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: <Widget>[
          SizedBox(
            height: 201,
            child: <Widget>[
              Expanded(
                  child: <Widget>[
                const Text(
                  'Focus mode',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Improve focus',
                  style: TextStyle(color: Colors.grey),
                )
              ].toColumn(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start)),
              Image.asset(
                'assets/bg.webp',
                width: 171,
                height: 201,
                fit: BoxFit.cover,
              )
            ].toRow(crossAxisAlignment: CrossAxisAlignment.center),
          ),
          Obx(() {
            return controller.list.value.isEmpty
                ? const Center(
                    child: Text('No data'),
                  ).marginOnly(top: 130)
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: controller.list.value.length,
                    itemBuilder: (_, index) {
                      final entity = controller.list.value[index];
                      return SwipeActionCell(
                          key: ObjectKey('$index-${entity.id}'),
                          trailingActions: <SwipeAction>[
                            SwipeAction(
                                title: "Delete",
                                onTap: (CompletionHandler handler) async {
                                  await controller.dbFocus.deleteFocus(entity);
                                  controller.getData();
                                },
                                color: Colors.red),
                          ],
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 30),
                            child: <Widget>[
                              Expanded(
                                  child: <Widget>[
                                Text(
                                  entity.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                <Widget>[
                                  Text(
                                    '${entity.minutes} minutes',
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Icon(
                                    Icons.keyboard_arrow_right,
                                    size: 25,
                                    color: Colors.grey,
                                  )
                                ].toRow()
                              ].toColumn(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start)),
                              Container(
                                width: 107,
                                height: 43,
                                alignment: Alignment.center,
                                child: const Text(
                                  'Start',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ).decorated(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(8))
                            ].toRow(),
                          )
                              .decorated(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15))
                              .marginOnly(bottom: 12)
                              .gestures(onTap: () {
                            Get.toNamed('/focusDetails',
                                arguments: entity);
                          }));
                    }).marginOnly(top: 150);
          })
        ].toStack(alignment: Alignment.topCenter).marginAll(15)),
      ).decorated(
          gradient: const LinearGradient(
              colors: [Color(0xffd9e4ff), Color(0xfff4f4f4)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0, 0.4])),
    );
  }
}
