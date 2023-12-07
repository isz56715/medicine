import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'CP005_provider.dart';

class CP005Controller extends GetxController with StateMixin<dynamic> {
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

  RxString search = ''.obs;
  RxString pdate = ''.obs;
  RxString comment = ''.obs;

  RxInt duration2 = 0.obs;

  Map<String, int> ateamlist = Map<String, int>();
  Map<String, String> aplayerlist = Map<String, String>();
  RxInt duration3 = 0.obs;
  var aDate = DateTime.now().obs;

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

  // select
  void getCP004() {
    CP005Provider().getCP004(search.value).then((value) {
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
    CP005Provider().setCP003Delete(mnum).then((value) {
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
  Future<void> clickButtonInsert(mnum, pdate) async {
    Map sample = {
      "mnum": mnum,
      "pdate": pdate.value,
    };
    String parms = json.encode(sample);
    print(parms);
    CP005Provider().setCP003Insert(parms).then((value) {
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

  reload() async {
    await Future.delayed(Duration(milliseconds: 200));
    this.getCP004();
  }

  void onTapSymp() {
    final result = Get.offAllNamed(
      "/CP002",
      arguments: {
      },
    );
    if (result != null) {
      // reload();
    }
  }
}
