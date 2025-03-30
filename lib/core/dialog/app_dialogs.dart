import 'package:chat_bot/core/theme/app_colors.dart';
import 'package:chat_bot/gen/assets.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'dialog_utils.dart';

class AppDialogs {
  static void showFailDialog(
      {required String message,
      required BuildContext context,
      String? posActionTitle,
      VoidCallback? posAction,
      String? negativeActionTitle,
      VoidCallback? negativeAction}) {
    AppDialogUtils.showDialogOnScreen(
        context: context,
        message: message,
        imagePath: Assets.error,
        posAction: posAction,
        negativeAction: negativeAction,
        negativeActionTitle: negativeActionTitle,
        posActionTitle: posActionTitle);
  }

  static void showInfoDialog(
      {required String message,
      required BuildContext context,
      String? posActionTitle,
      VoidCallback? posAction,
      String? negativeActionTitle,
      VoidCallback? negativeAction}) {
    AppDialogUtils.showDialogOnScreen(
        context: context,
        message: message,
        imagePath: Assets.info,
        posAction: posAction,
        negativeAction: negativeAction,
        negativeActionTitle: negativeActionTitle,
        posActionTitle: posActionTitle);
  }

  static void showLoading(
      {required String message, required BuildContext context}) {
    AppDialogUtils.showLoadingDialog(context: context, message: message);
  }

  static void showSuccessDialog(
      {required String message,
      required BuildContext context,
      String? posActionTitle,
      VoidCallback? posAction,
      String? negativeActionTitle,
      VoidCallback? negativeAction}) {
    AppDialogUtils.showDialogOnScreen(
        context: context,
        message: message,
        imagePath: Assets.check,
        posAction: posAction,
        negativeAction: negativeAction,
        negativeActionTitle: negativeActionTitle,
        posActionTitle: posActionTitle);
  }

  static void showErrorToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void showSuccessToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.white,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void showInfoToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.white,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void showFailMessage(String message, BuildContext context) {
    CherryToast.error(
      title: Text(
        message,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    ).show(context);
  }

  static void showSuccessMessage(String message, BuildContext context) {
    CherryToast.success(
      title: Text(
        message,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    ).show(context);
  }

  static void showInfosMessage(String message, BuildContext context) {
    CherryToast.info(
      title: Text(
        message,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    ).show(context);
  }
}
