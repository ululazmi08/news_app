import 'package:flutter/material.dart';
import 'package:news_app/core/constants/colors.dart';
import 'package:news_app/presentation/widget/button_action.dart';

class AppBarDefault extends StatelessWidget {
  const AppBarDefault({
    Key? key,
    this.actions = const [],
    required this.title,
    this.withLeading = true,
    this.useShadow = true,
    this.bgColor = kColorWhite,
    this.textColor = kColorWhite,
    this.onTapBack,
  }) : super(key: key);
  final List<Widget> actions;
  final String title;
  final bool withLeading;
  final bool useShadow;
  final VoidCallback? onTapBack;
  final Color bgColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).viewPadding.top + 16,
        left: withLeading ? 8 : 0,
        right: 16,
        bottom: 8,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        boxShadow: useShadow
            ? [
                BoxShadow(
                  color: kColorGrey.withOpacity(0.3),
                  offset: const Offset(0, 0.5),
                  blurRadius: 2,
                )
              ]
            : null,
      ),
      child: Row(
        children: [
          withLeading
              ? Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  child: ButtonAction(
                    onTap: onTapBack ?? () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.black,
                    ),
                  ),
                )
              : const SizedBox(width: 8),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                  color: kColorPrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: 22),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 8),
            child: Row(
              children: actions,
            ),
          )
        ],
      ),
    );
  }
}
