// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignOut extends StatefulWidget {
  const SignOut({super.key});

  @override
  State<SignOut> createState() => _SignOutState();
}

class _SignOutState extends State<SignOut> {
  FirebaseAuth auth = FirebaseAuth.instance;

  signOut() async {
    await auth.signOut();
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/SignIn', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          signOut();
        },
        icon: const Icon(Icons.logout, color: Colors.white));
  }
}
