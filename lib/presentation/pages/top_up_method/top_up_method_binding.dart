import 'package:get/get.dart';

import 'top_up_method_controller.dart';

class TopUpMethodBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TopUpMethodController());
  }
}
