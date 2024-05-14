import 'package:flutter/material.dart';
import 'package:news_app/core/constants/colors.dart';

class ButtonAction extends StatelessWidget {
  const ButtonAction({Key? key, required this.onTap, required this.child})
      : super(key: key);
  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kColorLightGrey,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(100),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
