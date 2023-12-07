import 'package:get/get.dart';

import 'CP002_controller.dart';

class CP002Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CP002Controller());
  }
}
