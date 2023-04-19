import 'package:flutter/material.dart';

import '../utils/theme.dart';

class BackView extends StatelessWidget {
  const BackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
            color: CColors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 8.0)]),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                "1",
                textScaleFactor: 2.0,
              ),
              const SizedBox(
                height: 2,
              ),
              const Text(
                "APR",
                textScaleFactor: 2.5,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 5.0),
              Expanded(
                  child: GridView.builder(
                      itemCount: 29,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7,
                          childAspectRatio: 1 / 1,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0),
                      itemBuilder: (_, i) => Text('${i + 1}'))),
              const Text(
                "Selected a date to write",
                textScaleFactor: 0.8,
                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
