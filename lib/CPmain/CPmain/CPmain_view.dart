import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/common/common.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'CPmain_controller.dart';

class CPmainView extends GetView<CPmainController> {
  const CPmainView({Key? key}) : super(key: key);
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
            '메디컬 매니저',
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
                Expanded(child: bannerArea()),
                const SizedBox(
                  height: 10,
                ),
                noticeArea(),
                const SizedBox(
                  height: 10,
                ),
                Expanded(child: menuArea())
              ],
            )));
  }

  Widget bannerArea() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        bannerImageArea(),
      ],
    );
  }

  Widget noticeArea() {
    return Card(
      child: ListTile(
          onTap: () {},
          title: const Text(
            '공지사항',
            textAlign: TextAlign.center,
          )),
    );
  }

  Widget menuArea() {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                Get.toNamed("/CP001");
              },
              child: menuIcon('hospital.png', '증상 입력', 75, 22),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                Get.toNamed("/CP002");
              },
              child: menuIcon('alarm.png', '알림 설정', 75, 22),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                Get.toNamed("/CP003");
              },
              child: menuIcon('medical.png', '약 DB', 75, 22),
            ),
          ),
        ],
      ),
    );
  }

  Widget bannerImageArea() {
    final List<String> bannerList = [
      'assets/images/ambulance.jpg',
      'assets/images/Operate.jpg',
      'assets/images/pill.jpg',
    ];
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: CarouselSlider.builder(
              itemCount: bannerList.length,
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                height: 250,
                viewportFraction: 1.0,
                enlargeCenterPage: true,
              ),
              itemBuilder: (context, index, realIdx) {
                return Container(
                  child: Center(
                      child: Image.asset(
                    bannerList[index],
                    fit: BoxFit.fitWidth,
                  )),
                );
              }),
        )
      ],
    );
  }

  ///////////////////////////////
  //
  // 메뉴 아이콘 위젯
  //
  Widget menuIcon(String icon, String name, double imgsize, double fontsize) {
    imgsize = 60;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            child: Image(
              image: AssetImage('assets/images/icon/$icon'),
              width: imgsize,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            alignment: Alignment.center,
            child: Text(
              name,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
