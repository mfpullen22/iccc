import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:iccc_app/models/user_data.dart";
import "package:iccc_app/providers.dart";
import '../models/chat.dart';

class SelectPersonToChat extends ConsumerWidget {
  const SelectPersonToChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Person to Chat With")),
      body: SafeArea(
        child: StreamBuilder<List<UserData>>(
            stream: ref.read(databaseProvider)!.getUsers(),
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
              final users = snapshot.data ?? [];
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  final myUser = ref.read(firebaseAuthProvider).currentUser!;

                  if (user.uid == myUser.uid) {
                    return Container();
                  }
                  return Column(
                    children: [
                      ListTile(
                        title: Text(user.name),
                        onTap: () async {},
                      ),
                      const Divider(),
                    ],
                  );
                },
              );
            }),
      ),
    );
  }
}
