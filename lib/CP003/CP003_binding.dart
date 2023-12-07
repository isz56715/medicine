import 'package:get/get.dart';

import 'CP003_controller.dart';

class CP003Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CP003Controller());
  }
}
