import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iccc_app/models/presenter.dart';
import 'package:iccc_app/models/user_data.dart';
import 'package:iccc_app/providers.dart';
import 'package:iccc_app/widgets/bottom_navbar.dart';

class SchedulePage extends ConsumerWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Schedule"),
          automaticallyImplyLeading: false,
        ),
        body: StreamBuilder<List<Presenter>>(
            stream: ref.read(databaseProvider)!.getPresenters(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Something went wrong!"),
                );
              }
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final presenters = snapshot.data ?? [];
              return ListView.builder(
                  itemCount: presenters.length,
                  itemBuilder: (context, index) {
                    final presenter = presenters[index];
                    return Column(
                      children: [
                        Card(
                          child: Text(presenter.firstName),
                        ),
                      ],
                    );
                  });
            }),
        bottomNavigationBar: const BottomNavBarFb5(pageIndex: 1),
      ),
    );
  }
}
