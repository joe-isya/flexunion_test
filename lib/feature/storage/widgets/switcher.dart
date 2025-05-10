import 'package:flexunion_test/constants/colors.dart';
import 'package:flutter/material.dart';

class Switcher extends StatefulWidget {
  const Switcher({super.key});

  @override
  _SwitcherState createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => setState(() {
            _isSwitched = !_isSwitched;
          }),
      child: Container(
        width: 51.0,
        height: 33,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:
                _isSwitched
                    ? [Color(0xFF46A7BF), Color(0xFF36C0BC)]
                    : [Color(0xFFB7B7B7), Color(0xFFB7B7B7)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: AnimatedAlign(
            alignment:
                _isSwitched ? Alignment.centerRight : Alignment.centerLeft,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: AppColors.backgroundColorLight,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(
                child: Icon(
                  _isSwitched ? Icons.check : Icons.close,
                  color: _isSwitched ? Color(0xFF22C1BD) : Colors.grey,
                  size: 16.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
