import 'package:expononet_energy/controller/game_controller.dart';
import 'package:get/get.dart';


class ConfigurationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => GameController());
  }

}