// ignore_for_file: avoid_unnecessary_containers

import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:iccc_app/widgets/schedule_card.dart';

class TuesdayPage extends StatelessWidget {
  final List<Map<String, dynamic>> schedule;
  //final List<Map<String, dynamic>> locations;
  const TuesdayPage({required this.schedule, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> morningScheduleTrack1 = [];
    List<Map<String, dynamic>> morningScheduleTrack2 = [];
    List<Map<String, dynamic>> eveningSchedule = [];
    List<Map<String, dynamic>> optionalSchedule = [];
    List<Map<String, dynamic>> posterSchedule = [];

    for (var i = 0; i < schedule.length; i++) {
      if (schedule[i]["time"] < 1300 && schedule[i]["track"] == 1) {
        morningScheduleTrack1.add(schedule[i]);
      } 
      if (schedule[i]["time"] < 1300 && schedule[i]["track"] == 2) {
        morningScheduleTrack2.add(schedule[i]);
      } 
      if (schedule[i]["time"] >= 1300 && schedule[i]["track"] == 0){
        eveningSchedule.add(schedule[i]);
      }
      if (schedule[i]["track"] == 4) {
        optionalSchedule.add(schedule[i]);
      }
      if (schedule[i]["track"] == 5) {
        posterSchedule.add(schedule[i]);
      }
    }

    morningScheduleTrack1.sort((a, b) => a['time'].compareTo(b['time']));
    morningScheduleTrack2.sort((a, b) => a['time'].compareTo(b['time']));
    eveningSchedule.sort((a, b) => a['time'].compareTo(b['time']));
    posterSchedule.sort((a, b) => a['time'].compareTo(b['time']));
    optionalSchedule.sort((a, b) => a['time'].compareTo(b['time']));

    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        Container(
          color:  const Color.fromRGBO(0, 192, 225, 1),
          child:  const ScheduleCard(scheduleItem: {
                  "firstName": "Announcements",
                  "lastName": "",
                  "degree": "",
                  "title": "Location: Victoria Hall",
                  "time": 830
                }),
        ),
        const SizedBox(height: 20),
        Text("Basic Science - Species & Phenotypes",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("Location: Albert Hall",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 16, fontWeight: FontWeight.bold)),
        Text("Moderator: Liliane Mukaremera",
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
        /* Container(
          color: const Color.fromRGBO(117, 16, 62, 1),
          child: Column(
            children: [
              ScheduleCard(scheduleItem: morningScheduleTrack1[0]),
              ScheduleCard(scheduleItem: morningScheduleTrack1[1]),
              ScheduleCard(scheduleItem: morningScheduleTrack1[2]),
              ScheduleCard(scheduleItem: morningScheduleTrack1[3]),
              const ScheduleCard(scheduleItem: {
                "firstName": "Break",
                "lastName": "",
                "degree": "",
                "title": "",
                "time": 1030
              }),
              ScheduleCard(scheduleItem: morningScheduleTrack1[4]),
              ScheduleCard(scheduleItem: morningScheduleTrack1[5]),
            ],
          ),
        ), */
        const SizedBox(height: 10),
        Text("Clinical Science - CrAg Screening",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("Location: Victoria Ballroom",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 16, fontWeight: FontWeight.bold)),
        Text("Moderator: Radha Rajasingham",
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
        /* Container(
          color: const Color.fromRGBO(0, 192, 225, 1),
          child: Column(
            children: [
              ScheduleCard(scheduleItem: morningScheduleTrack2[0]),
              Card(
                elevation: 10,
                child: ListTile(
                  title: Text("Panel Discussion: Optimizing Preemptive Therapy",
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                  leading: Text("8:45",
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Moderators",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline)),
                      Text("Tom Harrison, David Boulware",
                          style: GoogleFonts.raleway()),
                      const SizedBox(height: 5),
                      Text("Panelists",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline)),
                      Text("Sile Molloy (EFFECT Trial)",
                          style: GoogleFonts.raleway()),
                      Text("Radha Rajasingham (ACACIA Trial)",
                          style: GoogleFonts.raleway()),
                      Text("Elizabeth Nalintya (ENCORE Trial)",
                          style: GoogleFonts.raleway()),
                      Text("Tshiama Miriam Mwamba (NICD)",
                          style: GoogleFonts.raleway())
                    ],
                  ),
                ),
              ),
              const ScheduleCard(scheduleItem: {
                "firstName": "Break",
                "lastName": "",
                "degree": "",
                "title": "",
                "time": 1000
              }),
              ScheduleCard(scheduleItem: morningScheduleTrack2[1]),
              Card(
                elevation: 10,
                child: ListTile(
                  title: Text(
                      "Panel Discussion: Programmatic and Implementation Issues on CrAg Screening",
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                  leading: Text("10:45",
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Moderators",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline)),
                      Text("Tom Chiller, David Meya",
                          style: GoogleFonts.raleway()),
                      const SizedBox(height: 5),
                      Text("Panelists",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline)),
                      Text("Nelesh Govender (South Africa)",
                          style: GoogleFonts.raleway()),
                      Text("Elizabeth Nalintya (Uganda)",
                          style: GoogleFonts.raleway()),
                      Text("Master Chisale (Malawi)",
                          style: GoogleFonts.raleway()),
                      Text("Boniface Ocora (Lira, Uganda)",
                          style: GoogleFonts.raleway()),
                      Text("Tafese Beyene Tufa (Ethiopia)",
                          style: GoogleFonts.raleway()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ), */
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
            children: [
              Container(
                child: Column(
                  children: <Widget> [     
                    for(var item in optionalSchedule) ScheduleCard(scheduleItem: item),
                    ],
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text("Plenary - Virulence Factors & Treatment Strategies",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("Location: Victoria Ballroom",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 16, fontWeight: FontWeight.bold)),
        Text("Moderator: Kirsten Nielsen",
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
        /* Container(
          color: const Color.fromRGBO(0, 192, 225, 1),
          child: Column(
            children: [
              ScheduleCard(scheduleItem: eveningSchedule[0]),
              ScheduleCard(scheduleItem: eveningSchedule[1]),
              ScheduleCard(scheduleItem: eveningSchedule[2]),
              const ScheduleCard(scheduleItem: {
                "firstName": "Break",
                "lastName": "",
                "degree": "",
                "title": "",
                "time": 1530
              }),
              ScheduleCard(scheduleItem: eveningSchedule[3]),
              ScheduleCard(scheduleItem: eveningSchedule[4]),
            ],
          ),
        ), */
        const SizedBox(height: 10),
        Text("Evening Poster Session",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Container(
          color: const Color.fromRGBO(117, 16, 62, 1),
          child: Column(
            children: <Widget> [     
            for(var item in posterSchedule) ScheduleCard(scheduleItem: item),
            ],
          ),
        ),
        /* Container(
          color: const Color.fromRGBO(117, 16, 62, 1),
          child: Column(
            children: [
              
              Card(
                elevation: 10,
                child: ListTile(
                  title: Text("Poster Flash Talks",
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                  leading: Text("16:45 - 18:00",
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                  subtitle: Text("Location: Victoria Ballroom", 
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
        ),
        Container(
          color: const Color.fromRGBO(117, 16, 62, 1),
          child: Column(
            children: [
              Card(
                elevation: 10,
                child: ListTile(
                  title: Text("Poster Session",
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                  leading: Text("18:00 - 19:15",
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                  subtitle: Text("Location: Exhibition Space", 
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
        ), */
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
