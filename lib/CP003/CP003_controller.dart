import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'CP003_provider.dart';

class CP003Controller extends GetxController with StateMixin<dynamic> {
  late TextEditingController mnameform = TextEditingController();
  late TextEditingController countform = TextEditingController();

  RxString selectedSymp1 = ''.obs;
  RxString selectedSymp2 = ''.obs;
  List<String> sympList = ['기침', '두통', '발열', '복통', '구토', '설사', '피로', '기타']; 
  RxString dropdownSymp = ''.obs;
  RxString dropdownSymp2 = ''.obs;

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
    getCP003();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // select
  void getCP003() {
    CP003Provider().getCP003().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (erorr) {
      change(null, status: RxStatus.error(erorr.toString()));
    });
  }

  void onupdate() {
    update();
  }

  //delete
  Future<void> clickButtonDelete(mnum) async {
    CP003Provider().setCP003Delete(mnum).then((value) {
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
      'mname': mnameform.text,
      'count': countform.text,
      'selectedSymp1': selectedSymp1.value,
      'selectedSymp2': selectedSymp2.value,
    };
    String parms = json.encode(sample);
    print(parms);
    CP003Provider().setCP003Insert(parms).then((value) {
      print(value);
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
  Future<void> clickButtonUpdate(int mnum) async {
    Map sample = {
      'mnum': mnum,
      'mname': mnameform.text,
      'count': countform.text,
      'selectedSymp1': selectedSymp1.value,
      'selectedSymp2': selectedSymp2.value,
    };
    String parms = json.encode(sample);
    print(parms);
    Get.snackbar('데이터 수정', '성공');
    CP003Provider().setCP003Update(parms).then((value) {
      print(value);
    }, onError: (erorr) {
      print(erorr);
    });

    reload();
  }

  reload() async {
    await Future.delayed(Duration(milliseconds: 200));
    this.getCP003();
  }

  void onTapPlayerList(int regisnum, String name, int age) {
    final result = Get.toNamed("/IP001e02",
        arguments: {"REGISNUM": regisnum, "PLAYERNAME": name, "AGE": age});
    if (result != null) {
      // reload();
    }
  }
}
