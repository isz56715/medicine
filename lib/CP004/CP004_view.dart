import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/common/common.dart';

import 'CP004_controller.dart';

class CP004View extends GetView<CP004Controller> {
  const CP004View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //
        // 상단바
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            '약 선택',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),

        // 사이드바
        endDrawer: const SideBar(),

        // 내용
        body: SafeArea(
            child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            medicineDBArea(context),
            const SizedBox(
              height: 10,
            ),
          ],
        )));
  }

  Widget medicineDBArea(context) {
    return controller.obx((data) => Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          width: double.infinity,
          height: 400,
          color: Colors.grey,
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext countext, int index) {
              //
              return Card(
                child: ListTile(
                  leading: Text(data[index]['mname']),
                  title: Text(
                    '${data[index]['symp1']} ${data[index]['symp2']}',
                    textAlign: TextAlign.right,
                  ),
                  trailing: Text(data[index]['how']),
                  onTap: () {
                    Get.defaultDialog(
                        title: '약 선택',
                        middleText: '해당 약품으로 알림설정합니다',
                        textConfirm: '확인',
                        onConfirm: () async => [
                              await controller.clickButtonInsert(
                                  data[index]['mnum'], controller.pdate),
                              controller.onTapSymp()
                            ]);
                  },
                ),
              );
            },
          ),
        ));
  }
}
