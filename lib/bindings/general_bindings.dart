import 'package:get/get.dart';

import '../utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    // /// -- Core
    Get.put(NetworkManager());

    // /// -- Product
    // Get.put();
    // Get.put();
    // Get.put();

    // /// -- Other
    // Get.put();
  }
}
