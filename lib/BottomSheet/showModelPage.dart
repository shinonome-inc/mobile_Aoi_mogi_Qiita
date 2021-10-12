import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showModalPage(BuildContext context, Widget page) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
    ),
    builder: (context) => DraggableScrollableSheet(
      initialChildSize: 1.0,
      builder: (context, scrollController) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        ),
        child: page,
      ),
    ),
  );
}
