import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppbarTitle extends StatelessWidget {
  AppbarTitle({
    Key? key,
    required this.text,
    this.margin,
  }) : super(
    key: key,
  );
  String text;
  EdgeInsetsGeometry? margin;


  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.left,
        style: theme.textTheme.titleLarge!.copyWith(
          color: theme.colorScheme.onPrimary,
        ),
      ),
    );
  }
}
