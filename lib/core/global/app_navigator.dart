import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppNavigator {
  static void navigateTo({
    required Widget screen,
  }) {
    Get.to(
      screen,
      transition: Transition.rightToLeftWithFade,
    );
  }

  static void getBack() {
    Get.back();
  }

  static void navigateAndFinish({
    required Widget screen,
  }) {
    Get.off(
      screen,
      transition: Transition.rightToLeftWithFade,
    );
  }

  static void navigateAndFinishAll({
    required Widget screen,
  }) {
    Get.offAll(
          () => screen,
      transition: Transition.rightToLeftWithFade,
    );
  }
}