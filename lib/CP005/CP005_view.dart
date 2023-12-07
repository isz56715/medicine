import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:c_frontend/common/notification.dart';

import '/common/common.dart';

import 'CP005_controller.dart';

class CP005View extends GetView<CP005Controller> {
  const CP005View({Key? key}) : super(key: key);
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
            '알림설정',
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
    return Center(
      child: TextButton(
        onPressed: () => FlutterLocalNotification.showNotification(),
        child: const Text("알림 보내기"),
      ),
    );
  }
}
