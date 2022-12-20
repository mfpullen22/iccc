// ignore_for_file: prefer_interpolation_to_compose_strings, library_private_types_in_public_api

import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class ScheduleCard extends StatelessWidget {
  final Map<String, dynamic> scheduleItem;
  const ScheduleCard({required this.scheduleItem, super.key});

  @override
  Widget build(BuildContext context) {
    String timeString = scheduleItem["time"].toString();
    String formattedTime = timeString.substring(0, timeString.length - 2) +
        ':' +
        timeString.substring(timeString.length - 2);
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(
                scheduleItem["firstName"] +
                    " " +
                    scheduleItem["lastName"] +
                    " " +
                    scheduleItem["degree"],
                style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
            leading: Text(formattedTime,
                style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
            subtitle: Text(scheduleItem["title"]),
          )
        ],
      ),
    );
  }
}
