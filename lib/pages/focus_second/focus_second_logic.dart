import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class FocusSecondLogic extends GetxController {

  aboutFocusUS(BuildContext context) async {
    var info = await PackageInfo.fromPlatform();
    showAboutDialog(
      applicationName: info.appName,
      applicationVersion: info.version,
      applicationIcon: Image.asset(
        'assets/launcher.webp',
        width: 75,
        height: 75,
      ),
      children: [
        const Text(
            """We can track your focus time for you"""),
      ],
      context: context,
    );
  }

}
