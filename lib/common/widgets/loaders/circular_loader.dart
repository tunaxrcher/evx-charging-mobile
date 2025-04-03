import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

/// A circular loader widget with customizable foreground and background colors.
class EvxCircularLoader extends StatelessWidget {
  /// Default constructor for the EvxCircularLoader.
  ///
  /// Parameters:
  ///   - foregroundColor: The color of the circular loader.
  ///   - backgroundColor: The background color of the circular loader.
  const EvxCircularLoader({
    super.key,
    this.foregroundColor,
    this.backgroundColor,
  });

  final Color? foregroundColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
      // Circular background
      child: Center(
        child: CircularProgressIndicator(
          color: foregroundColor,
          backgroundColor: Colors.transparent,
        ), // Circular loader
      ),
    );
  }
}
