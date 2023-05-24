import 'package:flutter/material.dart';
import 'package:notes_app/utils/theme.dart';
import 'package:notes_app/widgets/habittile.dart';

class HabittrickerPage extends StatelessWidget {
  const HabittrickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.backgroundcolor,
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: ListView(
          children: const [HabitTile(), HabitTile(), HabitTile(), HabitTile(), HabitTile()],
        ),
      ),
    );
  }
}
