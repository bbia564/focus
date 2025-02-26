import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'focus_out_logic.dart';

class FocusOutPage extends GetView<FocusOutLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        Image.asset(
          'assets/icon.webp',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        <Widget>[
          const Icon(
            Icons.check_circle_outline,
            size: 77,
            color: Colors.white,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            controller.entity.name,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            controller.useTimeStr.value,
            style: const TextStyle(
                color: Colors.white,
                decorationStyle: TextDecorationStyle.solid,
                decorationColor: Colors.white,
                decoration: TextDecoration.underline,fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            width: 214,
            height: 76,
            alignment: Alignment.center,
            child: const Text(
              'Back home',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          )
              .decorated(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12))
              .gestures(onTap: () {
            Get.back();
          })
        ].toColumn(mainAxisAlignment: MainAxisAlignment.center)
      ].toStack(alignment: Alignment.center),
    );
  }
}
