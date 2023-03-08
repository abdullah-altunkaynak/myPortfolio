import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../model/language_enum.dart';

class MainController extends GetxController {
  Rx<languages> selectedLanguage = languages.tr.obs;
  RxBool darkThemeBool = false.obs;
}
