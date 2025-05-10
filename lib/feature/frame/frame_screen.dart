import 'package:flexunion_test/constants/colors.dart';
import 'package:flexunion_test/constants/lozalization.dart';
import 'package:flexunion_test/feature/frame/widgets/benefit_tile.dart';
import 'package:flexunion_test/feature/frame/widgets/button/activation_button.dart';
import 'package:flexunion_test/feature/frame/widgets/button/country_list_button.dart';
import 'package:flexunion_test/feature/frame/widgets/frame_header.dart';
import 'package:flexunion_test/feature/frame/widgets/pulsing_circle.dart';
import 'package:flexunion_test/feature/storage/storage_screen.dart';
import 'package:flexunion_test/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class FrameScreen extends StatefulWidget {
  const FrameScreen({super.key});

  @override
  State<FrameScreen> createState() => _FrameScreenState();
}

class _FrameScreenState extends State<FrameScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  static const Duration _animationDuration = Duration(seconds: 3);
  static const double _circleSize = 600;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _animationDuration)
      ..repeat(reverse: true);

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.8,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.backgroundColorDark,
      body: SafeArea(
        child: FrameContent(
          circleSize: _circleSize,
          mediaHeight: mediaHeight,
          scaleAnimation: _scaleAnimation,
        ),
      ),
    );
  }
}

class FrameContent extends StatelessWidget {
  const FrameContent({
    super.key,
    required double circleSize,
    required this.mediaHeight,
    required Animation<double> scaleAnimation,
  }) : _circleSize = circleSize,
       _scaleAnimation = scaleAnimation;

  final double _circleSize;
  final double mediaHeight;
  final Animation<double> _scaleAnimation;

  get balance => 1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: -_circleSize / 2,
          top: mediaHeight / 2 - _circleSize / 2,
          child: PulsingCircle(animation: _scaleAnimation, size: _circleSize),
        ),

        Positioned(
          left: -_circleSize / 2,
          bottom: -_circleSize / 2,
          child: PulsingCircle(animation: _scaleAnimation, size: _circleSize),
        ),

        Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,

            top: 20,
            bottom: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FrameHeader(),
              const SizedBox(height: 30),
              const Text(
                AppLocalization.frameTitle,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: AppColors.backgroundColorLight,
                ),
              ),
              SizedBox(height: 30),
              BenefitTile(
                icon: Assets.icons.globus.path,
                title: AppLocalization.frameGlobusTitle,
              ),
              SizedBox(height: 12),
              BenefitTile(
                icon: Assets.icons.check.path,
                title: AppLocalization.frameCheckTitle,
              ),
              SizedBox(height: 12),
              BenefitTile(
                icon: Assets.icons.infinity.path,
                title: AppLocalization.infinityTitle,
              ),
              SizedBox(height: 12),
              BenefitTile(icon: Assets.icons.card.path, title: 'Пакеты от 1\$'),
              const SizedBox(height: 30),
              CountryListButton(ontap: () {}),
              Spacer(),
              Center(
                child: Text(
                  '${AppLocalization.balance}$balance\$',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ActivationButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StorageScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
