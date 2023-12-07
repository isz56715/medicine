import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/common/common.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'CP003_controller.dart';

class CP003View extends GetView<CP003Controller> {
  const CP003View({Key? key}) : super(key: key);
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
            '약 DB',
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
            medicineDBArea(),
            const SizedBox(
              height: 10,
            ),
            yesnoArea(context)
          ],
        )));
  }

  Widget medicineDBArea() {
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
                      onPressed: (context) => [
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('약 데이터 수정'),
                                content: updatecontainer(
                                  data[index]['mnum'],
                                  data[index]['symp1'],
                                  data[index]['symp2'],
                                ),
                              );
                            }),
                        controller.mnameform.text = data[index]['mname'],
                        controller.countform.text =
                            data[index]['how'].toString(),
                      ],
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      icon: Icons.update,
                      label: '수정',
                    ),
                    SlidableAction(
                      onPressed: (context) async => [
                        await showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('삭제하시겠습니까?'),
                                content: selectyesno(data[index]['mnum']),
                              );
                            }),
                      ],
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
                    title: Text('${data[index]['symp1']} ${data[index]['symp2']}', textAlign: TextAlign.right,),
                    trailing: Text(data[index]['how']),
                    onTap: () {},
                  ),
                ),
              );
            },
          ),
        ));
  }

  Widget yesnoArea(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        onPressed: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('약 데이터 추가'),
                  content: insertContainer('a', 'b'),
                );
              });
        },
        child: const Text('추가'),
      ),
    );
  }

  Widget insertContainer(sdate, edate) {
    String dropdownSymp = controller.dropdownSymp.value;
    String dropdownSymp2 = controller.dropdownSymp2.value;

    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return controller.obx((data) => Form(
          key: _formKey,
          child: SizedBox(
            height: 400.0,
            width: 400.0,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Flexible(
                  flex: 1,
                  child: TextFormField(
                    controller: controller.mnameform,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '약 이름',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Flexible(
                  flex: 1,
                  child: TextFormField(
                    controller: controller.countform,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '하루 복용 횟수',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: DropdownSearch<String>(
                        items: controller.sympList,
                        selectedItem: '증상 선택',
                        onChanged: (String? newValue) {
                          dropdownSymp = newValue!;
                          controller.selectedSymp1.value = dropdownSymp;
                          controller.onupdate();
                        },
                        validator: (text) {
                          if (text == '증상 선택') {
                            return '증상을 선택해주세요';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: DropdownSearch<String>(
                        items: controller.sympList,
                        selectedItem: '증상 선택',
                        onChanged: (String? newValue) {
                          dropdownSymp2 = newValue!;
                          controller.selectedSymp2.value = dropdownSymp2;
                          controller.onupdate();
                        },
                        validator: (text) {
                          if (text == '증상 선택') {
                            return '증상을 선택해주세요';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("닫기"),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    OutlinedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await (controller.selectedSymp1.value = dropdownSymp);
                          await (controller.selectedSymp2.value =
                              dropdownSymp2);
                          await controller.clickButtonInsert();
                          Get.back();
                        }
                      },
                      child: const Text("추가"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget updatecontainer(mnum, ssymp1, ssymp2) {
    String dropdownSymp = controller.dropdownSymp.value;
    String dropdownSymp2 = controller.dropdownSymp2.value;

    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return controller.obx((data) => Form(
          key: _formKey,
          child: SizedBox(
            height: 400.0,
            width: 400.0,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Flexible(
                  flex: 1,
                  child: TextFormField(
                    controller: controller.mnameform,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '약 이름',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Flexible(
                  flex: 1,
                  child: TextFormField(
                    controller: controller.countform,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '하루 복용 횟수',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: DropdownSearch<String>(
                        items: controller.sympList,
                        selectedItem: ssymp1,
                        onChanged: (String? newValue) {
                          dropdownSymp = newValue!;
                          controller.selectedSymp1.value = dropdownSymp;
                          controller.onupdate();
                        },
                        validator: (text) {
                          if (text == '증상 선택') {
                            return '증상을 선택해주세요';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: DropdownSearch<String>(
                        items: controller.sympList,
                        selectedItem: ssymp2,
                        onChanged: (String? newValue) {
                          dropdownSymp2 = newValue!;
                          controller.selectedSymp2.value = dropdownSymp2;
                          controller.onupdate();
                        },
                        validator: (text) {
                          if (text == '증상 선택') {
                            return '증상을 선택해주세요';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("닫기"),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    OutlinedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await (dropdownSymp = ssymp1);
                          await (dropdownSymp2 = ssymp2);
                          await controller.clickButtonUpdate(mnum);
                          Get.close(1);
                        }
                      },
                      child: const Text("수정"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget selectyesno(int mnum) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("취소"),
        ),
        const SizedBox(
          width: 30,
        ),
        OutlinedButton(
          onPressed: () async {
            if (controller.gcount.value > 0) {
              Get.defaultDialog(
                  title: '오류',
                  middleText: '삭제할 수 없습니다.',
                  textConfirm: '확인',
                  onConfirm: () {
                    Get.back();
                  });
            } else {
              controller.clickButtonDelete(mnum);
              controller.getCP003();
              Get.back();
            }
          },
          child: const Text("삭제"),
        ),
      ],
    );
  }
}
