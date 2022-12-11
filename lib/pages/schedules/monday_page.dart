import "package:flutter/material.dart";

class MondayPage extends StatelessWidget {
  final List<Map<String, dynamic>> schedule;
  const MondayPage({required this.schedule, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
                  children: [
                    Card(
                      child: Text(schedule[0]["lastName"] +
                          " - " +
                          schedule[0]["time"] +
                          " - " +
                          schedule[0]["title"]),
                    )
                  ],
                );
  }
}