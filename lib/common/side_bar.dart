import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.grey[300],
        child: Column(children: <Widget>[
          Expanded(
              child: Column(
            children: [
              ListTile(
                title: const Text('증상 입력'),
                onTap: () {
                  Get.toNamed("/CP001");
                },
              ),
              ListTile(
                title: const Text('알림 설정'),
                onTap: () {
                  Get.toNamed("/CP002");
                },
              ),
              ListTile(
                title: const Text('약 DB'),
                onTap: () {
                  Get.toNamed("/CP003");
                },
              )
            ],
          )),
          Container(
            width: double.infinity,
            height: 70,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.home),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                )),
              ),
              label: const Text(
                "홈",
              ),
              onPressed: () {
                Get.offAndToNamed('/CPmain');
              },
            ),
          ),
          Container(
            width: double.infinity,
            height: 70,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.exit_to_app),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                )),
              ),
              label: const Text(
                "앱 종료",
              ),
              onPressed: () {
                Get.dialog(AlertDialog(
                  title: const Text('앱 종료'),
                  content: const Text('앱을 종료합니다'),
                  actions: [
                    TextButton(
                      child: const Text("종료"),
                      onPressed: () => exit(0),
                    ),
                    TextButton(
                      child: const Text("취소"),
                      onPressed: () => Get.back(),
                    ),
                  ],
                ));
                //
              },
            ),
          )
        ]));
  }
}
