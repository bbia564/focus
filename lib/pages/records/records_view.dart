import 'package:flutter/material.dart';
import 'package:focus_mode/main.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'records_logic.dart';

class RecordsPage extends GetView<RecordsLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Records'),
        backgroundColor: Colors.white,
        actions: [
          Text(
            'Clean',
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
          ).marginOnly(right: 20).gestures(onTap: () {
            controller.cleanAllData();
          })
        ],
      ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(15),
        child: Obx(() {
          return controller.list.value.isEmpty
              ? const Center(
                  child: Text('No data'),
                )
              : ListView.builder(
                  itemCount: controller.list.value.length,
                  itemBuilder: (_, index) {
                    final entity = controller.list.value[index];
                    final minutes = entity.minutes ~/ 60;
                    final seconds = entity.minutes % 60;
                    final useTimeStr =
                        '${minutes < 10 ? '0$minutes' : minutes}:${seconds < 10 ? '0$seconds' : seconds}';
                    return <Widget>[
                      <Widget>[
                        Expanded(
                            child: Text(
                          entity.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )),
                        Text(
                          useTimeStr,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ].toRow(),
                      Text(
                        entity.createdTimeString,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Divider(
                        height: 25,
                        color: Colors.grey[300],
                      )
                    ].toColumn(crossAxisAlignment: CrossAxisAlignment.start);
                  });
        }),
      )
              .decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(20))
              .marginAll(15)),
    );
  }
}
