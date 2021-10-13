import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showModalPage(BuildContext context, Widget page) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
    ),
    builder: (context) => page,
  );
}
