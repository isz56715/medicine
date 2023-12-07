import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'CP002_provider.dart';

class CP002Controller extends GetxController with StateMixin<dynamic> {
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
  
  DateFormat formatter = DateFormat('yyyyMMdd');

  var playerdatelist = List<dynamic>.empty(growable: true).obs;

  @override
  void onInit() {
    super.onInit();
    getCP002();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // select
  void getCP002() {
    CP002Provider().getCP002().then((value) {

      change(value, status: RxStatus.success());
    }, onError: (erorr) {
      change(null, status: RxStatus.error(erorr.toString()));
    });
  }

  void onupdate() {
    update();
  }

  //delete
  Future<void> clickButtonDelete(regisnum) async {
    CP002Provider().setIP001e01Delete(regisnum).then((value) {
      print(value);
      Get.snackbar('데이터 삭제', '성공');
    }, onError: (erorr) {
      print(erorr);
      Get.defaultDialog(
          title: '오류',
          middleText: '잘못된 접근',
          textConfirm: '확인',
          onConfirm: () {
            Get.back();
          });
    });
    reload();
  }

  // insert
  Future<void> clickButtonInsert() async {
    Map sample = {
      'insertid': '001e01',
    };
    String parms = json.encode(sample);
    print(parms);
    CP002Provider().setIP001e01Insert(parms).then((value) {
      print(value);
      Get.snackbar('데이터 입력', '성공');
    }, onError: (erorr) {
      print(erorr);
      Get.defaultDialog(
          title: '오류',
          middleText: '잘못된 접근',
          textConfirm: '확인',
          onConfirm: () {
            Get.back();
          });
    });
    reload();
  }

  // update
  Future<void> clickButtonUpdate(int regisnum) async {
    Map sample = {'regisnum': regisnum, 'upd': 'U'};
    String parms = json.encode(sample);

    print(parms);

    CP002Provider().setIP001e01Update(parms).then((value) {
      print(value);
    }, onError: (erorr) {
      print(erorr);
    });

    reload();
  }

  reload() async {
    await Future.delayed(Duration(milliseconds: 200));
    this.getCP002();
  }


  void onMedicineList(String pdate) {
    final result = Get.toNamed("/CP005",
        arguments: {"pdate": pdate});
    if (result != null) {
      // reload();
    }
  }
}
