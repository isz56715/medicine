import 'package:get/get.dart';

import '../CP001/CP001_binding.dart';
import '../CP001/CP001_view.dart';
import '../CP002/CP002_binding.dart';
import '../CP002/CP002_view.dart';
import '../CP003/CP003_binding.dart';
import '../CP003/CP003_view.dart';
import '../CP004/CP004_binding.dart';
import '../CP004/CP004_view.dart';
import '../CP005/CP005_binding.dart';
import '../CP005/CP005_view.dart';
import '../CPmain/CPmain/CPmain_binding.dart';
import '../CPmain/CPmain/CPmain_view.dart';

class Routes {
  static final routes = [
    //메인화면
    GetPage(
      name: '/CPmain',
      page: () => const CPmainView(),
      binding: CPmainBinding(),
    ),
    //증상입력
    GetPage(
      name: '/CP001',
      page: () => const CP001View(),
      binding: CP001Binding(),
    ),
    //알림설정
    GetPage(
      name: '/CP002',
      page: () => const CP002View(),
      binding: CP002Binding(),
    ),
    //약 DB
    GetPage(
      name: '/CP003',
      page: () => const CP003View(),
      binding: CP003Binding(),
    ),
    //증상에 맞는 약
    GetPage(
      name: '/CP003e01',
      page: () => const CP004View(),
      binding: CP004Binding(),
    ),
    //알림 띄우기
    GetPage(
      name: '/CP005',
      page: () => const CP005View(),
      binding: CP005Binding(),
    ),
  ];
}
