import 'package:flutter/material.dart';

import '../utils/theme.dart';
import 'constantss.dart';

class FrontView extends StatelessWidget {
  final int monthIndex;
  const FrontView({super.key, required this.monthIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: CColors.main2Color,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //month
                  Text(
                    monthIndex.toString(),
                    textScaleFactor: 3.5,
                    style: const TextStyle(color: CColors.white),
                  ),

                  Text(
                    months[monthIndex]!.keys.toList()[0],
                    textScaleFactor: 2.5,
                    style: const TextStyle(color: CColors.white),
                  ),

                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
