import 'package:flutter/material.dart';

void navigateTo(
  BuildContext context,
  Widget Function(BuildContext) builder,
) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: builder,
    ),
  );
}
