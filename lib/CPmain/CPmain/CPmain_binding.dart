import 'package:get/get.dart';

import 'CPmain_controller.dart';

class CPmainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CPmainController());
  }
}
