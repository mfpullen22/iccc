// ignore_for_file: file_names

import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:iccc_app/models/location.dart';
import 'package:iccc_app/models/presentation.dart';
import 'package:iccc_app/pages/schedules/friday_page.dart';
import 'package:iccc_app/pages/schedules/monday_page.dart';
import 'package:iccc_app/pages/schedules/thursday_page.dart';
import 'package:iccc_app/pages/schedules/tuesday_page.dart';
import 'package:iccc_app/pages/schedules/wednesday_page.dart';
import 'package:iccc_app/providers.dart';

class ScheduleStream extends ConsumerStatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  final String day;
  // ignore: prefer_const_constructors_in_immutables
  ScheduleStream({required this.day, Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScheduleStreamState();
}

class _ScheduleStreamState extends ConsumerState<ScheduleStream> {
  @override
  Widget build(BuildContext context) {
/*     List<Map<String, dynamic>> monLocs = [];
    List<Map<String, dynamic>> tuesLocs = [];
    List<Map<String, dynamic>> wedLocs = [];
    List<Map<String, dynamic>> thuLocs = [];
    List<Map<String, dynamic>> friLocs = [];
    List<Map<String, dynamic>> allLocs = [];
    Stream<List<Location>> locationsDaily = ref.read(databaseProvider)!.getLocations(widget.day); 
    locationsDaily.listen((data) {
      data.forEach((map) {
        allLocs.add(map.toMap());
      });
      allLocs.forEach((element) {
        if(element["day"] == "9") {
          monLocs.add(element);
        }
        if(element["day"] == "10") {
          tuesLocs.add(element);
        }
        if(element["day"] == "11") {
          wedLocs.add(element);
        }
        if(element["day"] == "12") {
          thuLocs.add(element);
        }
        if(element["day"] == "13") {
          friLocs.add(element);
        }
      });
    }); */
    return StreamBuilder<List<Presentation>>(
        stream: ref.read(databaseProvider)?.getPresentations(widget.day),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text(
                  "Something went wrong! Are you connected to the internet?"),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final presentations = snapshot.data ?? [];
          List<Map<String, dynamic>> presentationsList = [];
          for (var i = 0; i < presentations.length; i++) {
            var item = presentations[i].toMap();
            presentationsList.add(item);
          }
/*           presentationsList.sort(
            (a, b) => (a["day"]).compareTo(b["day"]),
          ); */
/*           Map<String, dynamic> intro =
              presentationsList.firstWhere((element) => element["time"] == "9"); */
          List<Map<String, dynamic>> monSchedule = presentationsList
              .where((element) => element["day"] == "9")
              .toList();
          List<Map<String, dynamic>> tueSchedule = presentationsList
              .where((element) => element["day"] == "10")
              .toList();
          List<Map<String, dynamic>> wedSchedule = presentationsList
              .where((element) => element["day"] == "11")
              .toList();
          List<Map<String, dynamic>> thuSchedule = presentationsList
              .where((element) => element["day"] == "12")
              .toList();
          List<Map<String, dynamic>> friSchedule = presentationsList
              .where((element) => element["day"] == "13")
              .toList();

/*           [
            presentationsList.firstWhere((element) => element["time"] == "9"),
            presentationsList.firstWhere((element) => element["time"] == "910"),
            presentationsList.firstWhere((element) => element["time"] == "920"),
            presentationsList.firstWhere((element) => element["time"] == "930"),
            presentationsList.firstWhere((element) => element["time"] == "940"),
            presentationsList.firstWhere((element) => element["time"] == "950"),
            presentationsList.firstWhere((element) => element["time"] == "10"),
            presentationsList
                .firstWhere((element) => element["time"] == "1010"),
            presentationsList
                .firstWhere((element) => element["time"] == "1020"),
            presentationsList
                .firstWhere((element) => element["time"] == "1030"),
          ]; */
          if (widget.day == "9") {
            return MondayPage(schedule: monSchedule);
          } else if (widget.day == "10") {
            return TuesdayPage(schedule: tueSchedule);
          } else if (widget.day == "11") {
            return WednesdayPage(schedule: wedSchedule);
          } else if (widget.day == "12") {
            return ThursdayPage(schedule: thuSchedule);
          } else {
            return FridayPage(schedule: friSchedule);
          }
        });
  }
}

/* ListView.builder(
              //itemCount: presenters.length,
              itemCount: presentationsList.length,
              itemBuilder: (context, index) {
                //final presenter = presenters[index].toMap();
                return Column(
                  children: [
                    Card(
                      child: Text(presentationsList[index]["lastName"] +
                          " " +
                          presentationsList[index]["day"] +
                          " - " +
                          presentationsList[index]["time"]),
                    ),
                  ],
                );
              }); */

/* ListView.builder(
              itemCount: schedule.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Card(
                      child: Text(schedule[index]["lastName"] +
                          " - " +
                          schedule[index]["time"] +
                          " - " +
                          schedule[index]["title"]),
                    )
                  ],
                );
              }); */