import 'package:design_system/design_system.dart';
import 'package:design_system/src/alert/alert_widget.dart';
import 'package:flutter/material.dart';

class Alerts {
  static void showSuccess(BuildContext context, String message) {
    SnackBar snackBar = AlertWidget(
      color: CoopartilharColors.of(context).white,
      backgroundColor: Theme.of(context).colorScheme.primary,
      imageIcon: CooIcons.cooCheck,
      message: message,
    ).build(context);
    
    show(context, snackBar);
  }

  static void showFailure(BuildContext context, String message) {
    SnackBar snackBar = AlertWidget(
      color: CoopartilharColors.of(context).white,
      backgroundColor: Theme.of(context).colorScheme.error,
      icon: CooIcons.cooCrossCircle,
      message: message,
    ).build(context);

    show(context, snackBar);
  }

  static void show(BuildContext context, SnackBar snackBar) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
