import 'package:flutter/material.dart';

import '../utils/theme.dart';

class FrontView extends StatelessWidget {
  const FrontView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
            color: CColors.mainColor,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 8.0)]),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //month
              const Text(
                "12",
                textScaleFactor: 3.5,
                style: TextStyle(color: CColors.white),
              ),
              const Text(
                "APR",
                textScaleFactor: 2.5,
                style: TextStyle(color: CColors.white),
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "12/29",
                        style: TextStyle(color: CColors.white),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Container(
                        width: double.infinity,
                        height: 3.0,
                        color: Colors.white30,
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: 12 / 29,
                          child: Container(
                            color: CColors.white,
                          ),
                        ),
                      ),
                    ],
                  )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert_outlined,
                        color: CColors.white,
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
