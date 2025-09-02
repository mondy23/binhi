import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;

  // Styling
  final Color color;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;
  final List<BoxShadow>? boxShadow;

  const CustomContainer({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.color = Colors.white,
    this.borderRadius = 16,
    this.borderColor = const Color(0xFFe7e7e7),
    this.borderWidth = 1.75,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}
