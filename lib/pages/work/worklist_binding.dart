import 'package:get/get.dart';
import 'worklist_controller.dart';

class WorklistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorklistController>(() => WorklistController());
  }
}
