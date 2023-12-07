import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/common/common.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'CP002_controller.dart';

class CP002View extends GetView<CP002Controller> {
  const CP002View({Key? key}) : super(key: key);
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
            '알림 설정',
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
                Expanded(child: alarmArea()),
                const SizedBox(
                  height: 10,
                ),
                addArea()
              ],
            )));
  }

  Widget alarmArea() {
    return controller.obx((data) => Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          width: double.infinity,
          height: 400,
          color: Colors.grey,
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext countext, int index) {
              //
              return Slidable(
                key: const ValueKey(0),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) => [],
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      icon: Icons.update,
                      label: '수정',
                    ),
                    SlidableAction(
                      onPressed: (context) async => [],
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: '삭제',
                    ),
                  ],
                ),
                child: Card(
                  child: ListTile(
                    leading: Text(data[index]['mname']),
                    title: Text(data[index]['date']),
                    trailing: Text(data[index]['how'].toString()),
                    onTap: () {controller.onMedicineList(data[index]['date']);},
                  ),
                ),
              );
            },
          ),
        ));
  }

  Widget addArea() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        onPressed: () {},
        child: const Text('확인'),
      ),
    );
  }
}
