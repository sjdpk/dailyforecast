import 'package:flutter/material.dart';

CommonUtils commonUtils = CommonUtils();


class CommonUtils {
  // @desc: hideKeyboard utils
  hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
