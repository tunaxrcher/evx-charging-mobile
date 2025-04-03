import 'package:flutter/material.dart';

import '../../../../../utils/constants/media.dart';

class SigninHeader extends StatelessWidget {
  const SigninHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height / 12),
        Padding(
          padding: EdgeInsets.only(left: width / 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/splay.png",
                scale: 4,
              ),
            ],
          ),
        )
      ],
    );
  }
}
