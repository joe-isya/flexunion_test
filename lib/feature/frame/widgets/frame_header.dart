import 'package:flexunion_test/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FrameHeader extends StatelessWidget {
  const FrameHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(Assets.icons.mainIcon.path),
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            border: Border(),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ],
    );
  }
}
