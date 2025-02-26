import 'package:flutter/material.dart';
import 'package:focus_mode/db_focus/db_focus.dart';
import 'package:focus_mode/db_focus/focus_entity.dart';
import 'package:get/get.dart';

class RecordsLogic extends GetxController {

  DBFocus dbFocus = Get.find();

  var list = <FocusEntity>[].obs;

  void getData() async {
    list.value = await dbFocus.getRecordsAllData();
  }

  cleanAllData() async {
    Get.dialog(AlertDialog(
      title: const Text('Warm reminder'),
      content: const Text('Do you want to clean all records?'),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel',style: TextStyle(color: Colors.black),),
        ),
        TextButton(
          onPressed: () async {
            await dbFocus.cleanRecordsData();
            getData();
            Get.back();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ));
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
