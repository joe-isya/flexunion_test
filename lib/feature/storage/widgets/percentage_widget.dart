import 'package:flexunion_test/constants/colors.dart';
import 'package:flexunion_test/constants/lozalization.dart';
import 'package:flexunion_test/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PercentageWidget extends StatefulWidget {
  const PercentageWidget({
    super.key,
    required this.colorAnimation,
    required this.progressValue,
  });

  final Animation<Color?> colorAnimation;
  final double progressValue;

  @override
  State<PercentageWidget> createState() => _PercentageWidgetState();
}

class _PercentageWidgetState extends State<PercentageWidget> {
  @override
  void initState() {
    super.initState();
    widget.colorAnimation.addListener(_onAnimationChanged);
  }

  @override
  void didUpdateWidget(covariant PercentageWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.colorAnimation != widget.colorAnimation) {
      oldWidget.colorAnimation.removeListener(_onAnimationChanged);
      widget.colorAnimation.addListener(_onAnimationChanged);
    }
  }

  @override
  void dispose() {
    widget.colorAnimation.removeListener(_onAnimationChanged);
    super.dispose();
  }

  void _onAnimationChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.colorAnimation.value ?? AppColors.primaryColor;

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 340,
          height: 340,
          child: CircularProgressIndicator(
            value: widget.progressValue,
            strokeWidth: 30,
            backgroundColor: const Color(0xFF4CADC4),
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              Assets.icons.mainIcon.path,
              color: AppColors.iconColor,
            ),
            const SizedBox(height: 8),
            Text(
              AppLocalization.yourTrafic,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF155A6A),
              ),
            ),
            Text(
              '${(widget.progressValue * 10)} GB',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
            Text(
              AppLocalization.of10GBUsed,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
