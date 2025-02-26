import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focus_mode/main.dart';
import 'package:focus_mode/pages/focus_add/focus_text_field.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'focus_add_logic.dart';

class FocusAddPage extends GetView<FocusAddLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Focus'),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<FocusAddLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: <Widget>[
                  SizedBox(
                    height: 40,
                    child: FocusTextField(
                        hintText: 'Fill in focus name',
                        maxLength: 12,
                        textAlign: TextAlign.center,
                        value: controller.name,
                        onChange: (v) {
                          controller.name = v;
                        }),
                  ),
                  Divider(
                    height: 25,
                    color: Colors.grey[300],
                  ),
                  SizedBox(
                    height: 260,
                    child: CupertinoPicker(
                        scrollController: FixedExtentScrollController(
                            initialItem: controller.selectedIndex),
                        itemExtent: 40,
                        useMagnifier: true,
                        magnification: 1.2,
                        onSelectedItemChanged: (v) {
                          controller.selectedIndex = v;
                          controller.update();
                        },
                        children: List.generate(120, (index) {
                          return Center(
                            child: Text(
                              '${index + 1} minutes',
                              style: TextStyle(
                                fontSize: 16,
                                color: controller.selectedIndex == index
                                    ? Colors.black
                                    : Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        })),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    height: 44,
                    alignment: Alignment.center,
                    child: const Text(
                      'Add',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                      .decorated(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10))
                      .marginOnly(bottom: 20)
                      .gestures(onTap: () {
                    controller.commit();
                  })
                ].toColumn(),
              ).decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(15))
            ].toColumn(),
          );
        }).marginAll(15)),
      ),
    );
  }
}
