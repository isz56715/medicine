import 'package:get/get.dart';

import 'CP004_controller.dart';

class CP004Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CP004Controller());
  }
}
