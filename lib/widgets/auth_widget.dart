import "package:iccc_app/providers.dart";
import "package:flutter/material.dart";
//import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

class AuthWidget extends ConsumerWidget {
  const AuthWidget({
    Key? key,
    required this.signedInBuilder,
    required this.nonSignedInBuilder,
  }) : super(key: key);

  final WidgetBuilder signedInBuilder;
  final WidgetBuilder nonSignedInBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateChanges = ref.watch(authStateChangesProvider);
    return authStateChanges.when(
      data: (user) =>
          user != null ? signedInBuilder(context) : nonSignedInBuilder(context),
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (_, __) => const Scaffold(
        body: Center(
          child: Text("Something went wrong!"),
        ),
      ),
    );
  }
}
