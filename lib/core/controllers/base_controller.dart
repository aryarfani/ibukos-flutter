import 'package:get/get.dart';
import 'package:ibukos/core/utils/dialog_utils.dart';

class BaseController extends GetxController {
  RxBool isLoading = false.obs;

  showLoading({String text}) {
    isLoading.value = true;
    if (text != null) DialogUtils.showLoading(text);
  }

  hideLoading({bool closeLoading = false}) {
    isLoading.value = false;
    if (closeLoading) Get.back();
  }
}
