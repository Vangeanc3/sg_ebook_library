import 'package:flutter/material.dart';
import 'package:grimorio/colors_schemes.dart';

showSnackBar(
    {required BuildContext context,
    bool isError = false,
    required String message}) {
  SnackBar snackBar = SnackBar(
      action: SnackBarAction(
        textColor: (isError)
            ? ColorsSchemes.lightColorScheme.error
            : ColorsSchemes.lightColorScheme.primary,
        backgroundColor: (isError)
            ? ColorsSchemes.lightColorScheme.onError
            : ColorsSchemes.lightColorScheme.onPrimary,
        label: 'Ok',
        onPressed: () {},
      ),
      backgroundColor: (isError)
          ? ColorsSchemes.lightColorScheme.error
          : ColorsSchemes.lightColorScheme.primary,
      content: Text(message,
          style: TextStyle(
              color: (isError)
                  ? ColorsSchemes.lightColorScheme.onError
                  : ColorsSchemes.lightColorScheme.onPrimary)));

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
