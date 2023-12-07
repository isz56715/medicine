import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'CP001_provider.dart';

class CP001Controller extends GetxController with StateMixin<dynamic> {
  late TextEditingController pdateform = TextEditingController();
  late TextEditingController endpdateform = TextEditingController();
  late TextEditingController commentform = TextEditingController();


  RxString search = ''.obs;

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

  // select
  void getCP001() {
    CP001Provider().getCP001(search).then((value) {
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
    CP001Provider().setIP001e01Delete(regisnum).then((value) {
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
    CP001Provider().setIP001e01Insert(parms).then((value) {
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

  reload() async {
    await Future.delayed(Duration(milliseconds: 200));
    this.getCP001();
  }

  void onTapSymp() {
    search.value = '\'$selectedSymp1\',\'$selectedSymp2\'';
    print(search.value);
    final result = Get.toNamed(
      "/CP004",
      arguments: {
        "search": search.value,
        "pdate": pdateform.text,
        "comment": commentform.text
      },
    );
    if (result != null) {
      // reload();
    }
  }

  yearMonthDayPicker() async {
    final year = DateTime.now().year;
    // ignore: unused_local_variable
    final DateTime? dateTime = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate2.value,
      firstDate: DateTime(year - 1),
      lastDate: DateTime(year + 10),
    ).then((pdate) {
      if (pdate != null) {
        DateFormat formatter = DateFormat('yyyyMMdd');
        selectedDate2.value = pdate;
        var strday2 = formatter.format(pdate);
        today2.value = strday2;
        pdateform.text = today2.value;
        ppdate.value = pdateform.text;
      }
      return null;
    });
  }
}
