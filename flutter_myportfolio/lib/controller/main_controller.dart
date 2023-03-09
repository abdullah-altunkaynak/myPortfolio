import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../model/language_enum.dart';

class MainController extends GetxController {
  Rx<languages> selectedLanguage = languages.tr.obs;
  RxBool darkThemeBool = false.obs;
  var sliderImagesTexts = [
    ["assets/image/kumluk.png", "kumlukInfo"],
    ["assets/image/yuyyu_adminpanel.png", "yuyyu_adminpanelInfo"],
    ["assets/image/yuyyu1.png", "yuyyu1Info"],
    ["assets/image/yuyyu2.png", "yuyyu2Info"],
    ["assets/image/yuyyu3.png", "yuyyu3Info"]
  ];
}
