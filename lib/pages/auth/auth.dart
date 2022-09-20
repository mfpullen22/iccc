import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:iccc_app/providers.dart";
import "package:iccc_app/models/user_data.dart";

class AuthWidget extends ConsumerWidget {
  const AuthWidget({
    Key? key,
    required this.signedInBuilder,
    required this.nonSignedInBuilder,
  }) : super(key: key);
  final WidgetBuilder nonSignedInBuilder;
  final WidgetBuilder signedInBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateChanges = ref.watch(authStateChangesProvider);
    // check if user exists and if not save it
    return authStateChanges.when(
      data: (user) => user != null
          ? signedInHandler(context, ref, user)
          : nonSignedInBuilder(context),
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (_, __) => const Scaffold(
          body: Center(
        child: Text("Something went wrong!"),
      )),
    );
  }

  FutureBuilder<UserData?> signedInHandler(context, WidgetRef ref, User user) {
    final database = ref.read(databaseProvider)!;
    final potentialUserFuture = database.getUser(user.uid);
    return FutureBuilder<UserData?>(
        future: potentialUserFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final potentialUser = snapshot.data;
            if (potentialUser == null) {
              database.addUser(UserData(
                  name: ref.read(nameProvider).name,
                  uid: user.uid)); // no need to await
            }
            return signedInBuilder(context);
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
