import 'package:flexunion_test/constants/lozalization.dart';
import 'package:flutter/material.dart';

class StorageHeader extends StatelessWidget {
  const StorageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            AppLocalization.storageHeaderTitle,
            style: TextStyle(color: Color(0xFF155A6A), fontSize: 20),
          ),
        ),
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ],
    );
  }
}
