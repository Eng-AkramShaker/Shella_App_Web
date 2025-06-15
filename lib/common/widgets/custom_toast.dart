import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shella_design/common/helper/responsive_helper.dart';

class CustomToast extends StatelessWidget {
  final String text;
  final bool isError;
  final Color textColor;
  final double borderRadius;
  final EdgeInsets padding;
  final BuildContext myContext;

  const CustomToast({
    super.key,
    required this.text,
    this.textColor = Colors.white,
    this.borderRadius = 30,
    this.padding = const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    required this.isError,
    required this.myContext,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isWeb();
    final screenWidth = MediaQuery.of(myContext).size.width;

    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF334257),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            padding: padding,
            margin: EdgeInsets.only(
              right: isDesktop ? screenWidth * 0.7 : 20,
              left: 20,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isError
                      ? CupertinoIcons.multiply_circle_fill
                      : Icons.check_circle,
                  color: isError
                      ? const Color(0xffFF9090).withOpacity(0.5)
                      : const Color(0xff039D55),
                  size: 20,
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    text,
                    style: TextStyle(color: textColor),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
