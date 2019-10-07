import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  GradientAppBar({
    @required this.gradient,
    @required this.appBar,
  }) : preferredSize = appBar.preferredSize;

  final Gradient gradient;
  final AppBar appBar;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(gradient: gradient),
          height: preferredSize.height,
        ),
        appBar,
      ],
    );
  }
}
