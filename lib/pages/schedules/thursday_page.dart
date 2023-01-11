import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:iccc_app/widgets/schedule_card.dart';

class ThursdayPage extends StatelessWidget {
  final List<Map<String, dynamic>> schedule;
  const ThursdayPage({required this.schedule, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> morningSchedule = [];
    List<Map<String, dynamic>> eveningScheduleTrack1 = [];
    List<Map<String, dynamic>> eveningScheduleTrack2 = [];
    List<Map<String, dynamic>> optionalSchedule = [];
    List<Map<String, dynamic>> closingSchedule = [];

    for (var i = 0; i < schedule.length; i++) {
      if (schedule[i]["time"] > 1300 && schedule[i]["track"] == 1) {
        eveningScheduleTrack1.add(schedule[i]);
      } 
      if (schedule[i]["time"] > 1300 && schedule[i]["track"] == 2) {
        eveningScheduleTrack2.add(schedule[i]);
      } 
      if (schedule[i]["track"] == 0) {
        morningSchedule.add(schedule[i]);
      }
      if (schedule[i]["track"] == 3) {
        optionalSchedule.add(schedule[i]);
      }
      if (schedule[i]["track"] == 4) {
        closingSchedule.add(schedule[i]);
      }

    }

    eveningScheduleTrack1.sort((a, b) => a['time'].compareTo(b['time']));
    eveningScheduleTrack2.sort((a, b) => a['time'].compareTo(b['time']));
    morningSchedule.sort((a, b) => a['time'].compareTo(b['time']));
    optionalSchedule.sort((a, b) => a['time'].compareTo(b['time']));
    closingSchedule.sort((a, b) => a['time'].compareTo(b['time']));

    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        Text("Plenary - Drug Development and Clinical Trials",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("Location: Victoria Ballroom",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 16, fontWeight: FontWeight.bold)),
        Text("Moderator: David Meya",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 16)),
        Container(
          color: const Color.fromRGBO(117, 16, 62, 1),
          child: Column(
            children: <Widget> [     
            for(var item in morningSchedule) ScheduleCard(scheduleItem: item),
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
          color: const Color.fromRGBO(0, 192, 225, 1),
          child: Column(
            children: <Widget> [     
            for(var item in optionalSchedule) ScheduleCard(scheduleItem: item),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text("Basic Science - Genetics and Reproduction",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("Location: Albert Hall",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 16, fontWeight: FontWeight.bold)),
        Text("Moderator: Blake Billmyre",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 16)),
        Container(
          color: const Color.fromRGBO(117, 16, 62, 1),
          child: Column(
            children: <Widget> [     
            for(var item in eveningScheduleTrack1) ScheduleCard(scheduleItem: item),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text("Clinical Science - Ancillary Treatment Strategies",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("Location: Victoria Ballroom",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 16, fontWeight: FontWeight.bold)),
        Text("Moderator: Abdu Musubire",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 16)),
        Container(
          color: const Color.fromRGBO(0, 192, 225, 1),
          child: Column(
            children: <Widget> [     
            for(var item in eveningScheduleTrack2) ScheduleCard(scheduleItem: item),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          color: const Color.fromRGBO(117, 16, 62, 1),
          child: Column(
            children: <Widget> [     
            for(var item in closingSchedule) ScheduleCard(scheduleItem: item),
            ],
          ),
        ),
      ],
    );
  }
}
