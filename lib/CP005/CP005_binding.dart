import 'package:get/get.dart';

import 'CP005_controller.dart';

class CP005Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CP005Controller());
  }
}
