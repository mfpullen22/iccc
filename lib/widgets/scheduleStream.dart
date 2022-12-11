// ignore_for_file: file_names

import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iccc_app/models/presentation.dart';
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
          presentationsList.sort(
            (a, b) => (a["day"]).compareTo(b["day"]),
          );
          Map<String, dynamic> intro =
              presentationsList.firstWhere((element) => element["time"] == "9");
          List<Map<String, dynamic>> schedule = [
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
          ];
          return ListView.builder(
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
              });
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
