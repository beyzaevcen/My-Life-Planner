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
          children: const [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                  child: Text(
                "Success is the sum of small efforts repeated day in day out",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              )),
            ),
            HabitTile(
              habitTile: "Study",
            ),
            HabitTile(
              habitTile: "Mediatate",
            ),
            HabitTile(
              habitTile: "Read",
            ),
            HabitTile(
              habitTile: "Love",
            ),
          ],
        ),
      ),
    );
  }
}
