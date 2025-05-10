import 'package:flexunion_test/constants/colors.dart';
import 'package:flexunion_test/constants/lozalization.dart';
import 'package:flexunion_test/feature/storage/widgets/storage_header.dart';
import 'package:flexunion_test/feature/storage/widgets/percentage_widget.dart';
import 'package:flexunion_test/feature/storage/widgets/switcher.dart';
import 'package:flutter/material.dart';

class StorageScreen extends StatefulWidget {
  const StorageScreen({super.key});

  @override
  State<StorageScreen> createState() => _StorageScreenState();
}

class _StorageScreenState extends State<StorageScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Color?> _colorAnimation;
  double progressValue = 0.35;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );

    _colorAnimation = ColorTween(
      begin: AppColors.primaryColor,
      end: AppColors.secondaryColor,
    ).animate(_controller);

    _updateColorAnimation();
  }

  void _updateColorAnimation() {
    if (progressValue == 1.0) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  void _handleTrafficChange() {
    setState(() {
      progressValue = progressValue == 1.0 ? 0.35 : 1.0;
      _updateColorAnimation();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildTrafficStatus() {
    if (progressValue == 1.0) {
      return _buildEndedTrafficBanner();
    } else {
      return _buildAlertSwitcher();
    }
  }

  Widget _buildEndedTrafficBanner() {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.secondaryColor, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Center(
        child: Text(
          'Trafic has ended',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.secondaryColor,
          ),
        ),
      ),
    );
  }

  Widget _buildAlertSwitcher() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 64,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Alert when 1h from expiration',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.activeTextColor,
            ),
          ),
          Switcher(),
        ],
      ),
    );
  }

  Widget _buildAddTrafficButton() {
    return GestureDetector(
      onTap: () {
        _handleTrafficChange();
      },
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            AppLocalization.addTraficButtontitle,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.textColorLight,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColorLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const StorageHeader(),
              const SizedBox(height: 150),
              PercentageWidget(
                colorAnimation: _colorAnimation,
                progressValue: progressValue,
              ),
              const Spacer(),
              _buildTrafficStatus(),
              const SizedBox(height: 20),
              _buildAddTrafficButton(),
            ],
          ),
        ),
      ),
    );
  }
}
