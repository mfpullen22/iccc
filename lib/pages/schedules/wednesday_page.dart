import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:iccc_app/widgets/schedule_card.dart';

class WednesdayPage extends StatelessWidget {
  final List<Map<String, dynamic>> schedule;
  const WednesdayPage({required this.schedule, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> morningScheduleTrack1 = [];
    List<Map<String, dynamic>> morningScheduleTrack2 = [];
    List<Map<String, dynamic>> eveningSchedule = [];
    List<Map<String, dynamic>> posterSchedule = [];
    List<Map<String, dynamic>> optionalSchedule1 = [];
    List<Map<String, dynamic>> optionalSchedule2 = [];

    for (var i = 0; i < schedule.length; i++) {
      if (schedule[i]["time"] < 1300 && schedule[i]["track"] == 1) {
        morningScheduleTrack1.add(schedule[i]);
      } 
      if (schedule[i]["time"] < 1300 && schedule[i]["track"] == 2) {
        morningScheduleTrack2.add(schedule[i]);
      } 
      if (schedule[i]["track"] == 0) {
        eveningSchedule.add(schedule[i]);
      }
      if (schedule[i]["track"] == 3) {
        optionalSchedule1.add(schedule[i]);
      }
      if (schedule[i]["track"] == 4) {
        optionalSchedule2.add(schedule[i]);
      }
      if (schedule[i]["track"] == 5) {
        posterSchedule.add(schedule[i]);
      }
    }

    morningScheduleTrack1.sort((a, b) => a['time'].compareTo(b['time']));
    morningScheduleTrack2.sort((a, b) => a['time'].compareTo(b['time']));
    eveningSchedule.sort((a, b) => a['time'].compareTo(b['time']));
    posterSchedule.sort((a, b) => a['time'].compareTo(b['time']));
    optionalSchedule1.sort((a, b) => a['time'].compareTo(b['time']));
    optionalSchedule2.sort((a, b) => a['time'].compareTo(b['time']));

    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        Text("Basic Science - Cell Biology and Development",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("Location: Albert Hall",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 16, fontWeight: FontWeight.bold)),
        Text("Moderator: Bettina Fries",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 16)),
        Container(
          color: const Color.fromRGBO(117, 16, 62, 1),
          child: Column(
            children: <Widget> [     
            for(var item in morningScheduleTrack1) ScheduleCard(scheduleItem: item),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text("Clinical Science - Disease Manifestations",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("Location: Victoria Ballroom",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 16, fontWeight: FontWeight.bold)),
        Text("Moderator: Lillian Tugume",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 16)),
        Container(
          color: const Color.fromRGBO(0, 192, 225, 1),
          child: Column(
            children: <Widget> [     
            for(var item in morningScheduleTrack2) ScheduleCard(scheduleItem: item),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text("-Lunch: Stables Restaurant-",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("12:00 - 14:00",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Container(
          color: const Color.fromRGBO(117, 16, 62, 1),
          child: Column(
            children: <Widget> [     
            for(var item in optionalSchedule1) ScheduleCard(scheduleItem: item),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text("Plenary - Understanding and Treating Disease",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("Location: Victoria Ballroom",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 16, fontWeight: FontWeight.bold)),
        Text("Moderator: Caleb Skipper",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 16)),
        Container(
          color: const Color.fromRGBO(0, 192, 225, 1),
          child: Column(
            children: <Widget> [     
            for(var item in eveningSchedule) ScheduleCard(scheduleItem: item),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          color: const Color.fromRGBO(117, 16, 62, 1),
          child: Column(
            children: <Widget> [     
            for(var item in optionalSchedule2) ScheduleCard(scheduleItem: item),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          color: const Color.fromRGBO(0, 192, 225, 1),
          child: Column(
            children: <Widget> [     
            for(var item in posterSchedule) ScheduleCard(scheduleItem: item),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text("-Dinner on the 'Mango Green'-",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("19:15 - 20:30",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
