import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibukos/ui/components/dialog/info_dialog.dart';
import 'package:ibukos/ui/components/dialog/loading_dialog.dart';

class DialogUtils {
  static void showInfo(String message, IconData icon, String buttonText, {Function onClick}) {
    Get.dialog(
      InfoDialog(
        text: message,
        onClickOK: () => onClick != null ? onClick() : Get.back(),
        icon: icon,
        clickText: buttonText,
      ),
    );
  }

  static void showChoose(BuildContext context, String message, IconData icon, String buttonText,
      {Function onClick, bool closeOnOk = true}) {
    showModal(
        context: context,
        configuration: FadeScaleTransitionConfiguration(barrierDismissible: false),
        builder: (context) {
          return InfoDialog(
            text: message,
            onClickOK: () {
              if (onClick != null) {
                onClick();
                if (closeOnOk) {
                  Navigator.pop(context);
                }
              } else {
                Navigator.pop(context);
              }
            },
            icon: icon,
            onClickCancel: () => Navigator.pop(context),
            clickText: buttonText,
          );
        });
  }

  static void showLoading(String message) {
    Get.dialog(LoadingDialog(
      text: message,
    ));
  }
}
