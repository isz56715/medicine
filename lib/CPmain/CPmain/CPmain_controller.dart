import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CPmainController extends GetxController with StateMixin<dynamic> {
  late TextEditingController searchform = TextEditingController();
  late TextEditingController pdateform = TextEditingController();
  late TextEditingController endpdateform = TextEditingController();
  late TextEditingController pdateform2 = TextEditingController();
  late TextEditingController endpdateform2 = TextEditingController();

  RxString selectedTeam = ''.obs;
  List<String> positionList = ['FW', 'DF', 'MF', 'GK'];
  RxString dropdownPosition = ''.obs;

  RxString ppdate = ''.obs;
  RxString today2 = ''.obs;
  DateTime format = DateTime.now();
  var selectedDate = DateTime.now().obs;
  var selectedDate2 = DateTime.now().obs;
  RxString endppdate = ''.obs;

  RxString dropdownRelate = ''.obs;
  RxInt duration2 = 0.obs;

  Map<String, int> ateamlist = Map<String, int>();
  Map<String, String> aplayerlist = Map<String, String>();
  RxInt duration3 = 0.obs;
  var ADate = DateTime.now().obs;

  RxInt gcount = 0.obs;

  var playerdatelist = List<dynamic>.empty(growable: true).obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }


  void onTapPlayerList(int regisnum, String name, int age) {
    final result = Get.toNamed("/IP001e02",
        arguments: {"REGISNUM": regisnum, "PLAYERNAME": name, "AGE": age});
    if (result != null) {
      // reload();
    }
  }
}
