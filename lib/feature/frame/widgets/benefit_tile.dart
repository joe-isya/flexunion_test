import 'package:flexunion_test/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BenefitTile extends StatelessWidget {
  final String icon;
  final String title;
  const BenefitTile({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(height: 24, width: 24, child: SvgPicture.asset(icon)),
        SizedBox(width: 10),
        Text(
          title,
          style: TextStyle(fontSize: 15, color: AppColors.textColorLight),
        ),
      ],
    );
  }
}
