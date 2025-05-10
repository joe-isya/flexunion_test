import 'package:flexunion_test/constants/app_colors.dart';
import 'package:flexunion_test/constants/lozalization.dart';
import 'package:flexunion_test/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CountryListButton extends StatelessWidget {
  final Function()? ontap;
  const CountryListButton({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 227,
        height: 44,
        decoration: BoxDecoration(
          color: AppColors.backgroundColorLight,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalization.countryListButtonTitle,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
            const SizedBox(width: 10),
            SvgPicture.asset(Assets.icons.arrowRight.path),
          ],
        ),
      ),
    );
  }
}
