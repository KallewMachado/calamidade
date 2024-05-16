import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

class AffiliatedFirstActionControllerImpl extends BaseController {
  AffiliatedFirstActionControllerImpl() : super(InitialState());

  Future<void> navigateToNeedHelp(BuildContext context) =>
      Navigator.pushNamed(context, '/ask_help');

  Future<void> navigateToWantToHelp(BuildContext context) =>
      Navigator.pushNamed(context, '/want_to_help');
}
