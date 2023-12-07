import 'package:get/get.dart';

import 'CP001_controller.dart';

class CP001Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CP001Controller());
  }
}
