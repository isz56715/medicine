import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/common/common.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'CP001_controller.dart';

class CP001View extends GetView<CP001Controller> {
  const CP001View({Key? key}) : super(key: key);
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
            '증상 입력',
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
            Expanded(child: dropdownArea()),
            const SizedBox(
              height: 10,
            ),
            yesnoArea(context)
          ],
        )));
  }

  Widget dropdownArea() {
    String dropdownSymp = controller.dropdownSymp.value;
    String dropdownSymp2 = controller.dropdownSymp2.value;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextFormField(  
              controller: controller.pdateform,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '날짜 입력',
              ),
              onTap: controller.yearMonthDayPicker,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return '비어있음';
                }
                return null;
              }),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: DropdownSearch<String>(
                  items: controller.sympList,
                  selectedItem: '증상 선택',
                  validator: (text) {
                    if (text == '증상 선택') {
                      return '증상을 선택해주세요';
                    }
                    return null;
                  },
                  onChanged: (String? newValue) {
                    dropdownSymp = newValue!;
                    controller.selectedSymp1.value = dropdownSymp;
                    controller.onupdate();
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: DropdownSearch<String>(
                  items: controller.sympList,
                  selectedItem: '증상 선택',
                  validator: (text) {
                    if (text == '증상 선택') {
                      return '증상을 선택해주세요';
                    }
                    return null;
                  },
                  onChanged: (String? newValue) {
                    dropdownSymp2 = newValue!;
                    controller.selectedSymp2.value = dropdownSymp2;
                    controller.onupdate();
                  },
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: controller.commentform,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: '코멘트',
            ),
          ),
        ],
      ),
    );
  }

  Widget yesnoArea(context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        onPressed: () => [
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('약을 확인하시겠습니까?'),
                  content: ElevatedButton(
                      onPressed: () {
                        controller.onTapSymp();
                      },
                      child: const Text('확인')),
                );
              }),
        ],
        child: const Text('확인'),
      ),
    );
  }
}
