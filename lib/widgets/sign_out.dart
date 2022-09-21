import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iccc_app/pages/auth/auth.dart';
import 'package:iccc_app/pages/auth/sign_in_page.dart';

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

/*           Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => SignInPage()),
              (Route<dynamic> route) => false); */
        },
        icon: const Icon(Icons.logout, color: Colors.white));
  }
}
