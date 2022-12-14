// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
//import "package:flutterfire_ui/auth.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:iccc_app/models/user_data.dart';
import "package:iccc_app/providers.dart";

class SignInPage extends ConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final pwdController = TextEditingController();

    return Center(
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset("assets/img/iccc_logo.webp"),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: const Text("Sign up"),
                      onPressed: () async {
                        // pop up asking for name
                        await showDialog<String>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Sign Up"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  autofocus: true,
                                  controller: nameController,
                                  decoration: const InputDecoration(
                                    labelText: "Name",
                                  ),
                                ),
                                TextField(
                                  autofocus: true,
                                  controller: emailController,
                                  decoration: const InputDecoration(
                                    labelText: "Email",
                                  ),
                                ),
                                TextField(
                                  autofocus: true,
                                  controller: pwdController,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    labelText: "Password",
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              ElevatedButton(
                                child: const Text("OK"),
                                onPressed: () async {
                                  if (nameController.text != "") {
                                    try {
                                      ref
                                          .read(nameProvider)
                                          .setName(nameController.text);
                                      await ref
                                          .read(firebaseAuthProvider)
                                          .createUserWithEmailAndPassword(
                                              email: emailController.text,
                                              password: pwdController.text);
                                      // ignore: empty_catches
                                    } catch (e) {}
                                    final newUser = UserData(
                                        name: nameController.text,
                                        uid: FirebaseAuth
                                            .instance.currentUser!.uid);
                                    await ref
                                        .read(databaseProvider)!
                                        .addUser(newUser);
                                    // ignore: use_build_context_synchronously
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil('/Home',
                                            (Route<dynamic> route) => false);
                                  }
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 40),
                    ElevatedButton(
                      child: const Text("Log In"),
                      onPressed: () async {
                        // pop up asking for name
                        await showDialog<String>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Log In"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  autofocus: true,
                                  controller: emailController,
                                  decoration: const InputDecoration(
                                    labelText: "Email",
                                  ),
                                ),
                                TextField(
                                  autofocus: true,
                                  controller: pwdController,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    labelText: "Password",
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              ElevatedButton(
                                child: const Text("OK"),
                                onPressed: () async {
                                  try {
                                    await ref
                                        .read(firebaseAuthProvider)
                                        .signInWithEmailAndPassword(
                                            email: emailController.text,
                                            password: pwdController.text);
                                    // ignore: empty_catches
                                  } catch (e) {}
                                  // ignore: use_build_context_synchronously
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      '/Home', (Route<dynamic> route) => false);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum AuthStatus {
  successful,
  wrongPassword,
  emailAlreadyExists,
  invalidEmail,
  weakPassword,
  unknown,
}

class AuthExceptionHandler {
  static handleAuthException(e) {
    AuthStatus status;
    switch (e.code) {
      case "invalid-email":
        status = AuthStatus.invalidEmail;
        break;
      case "wrong-password":
        status = AuthStatus.wrongPassword;
        break;
      case "weak-password":
        status = AuthStatus.weakPassword;
        break;
      case "email-already-in-use":
        status = AuthStatus.emailAlreadyExists;
        break;
      default:
        status = AuthStatus.unknown;
    }
    return status;
  }
}

String generateErrorMessage(error) {
  String errorMessage;
  switch (error) {
    case AuthStatus.invalidEmail:
      errorMessage = "Your email address appears to be malformed.";
      break;
    case AuthStatus.weakPassword:
      errorMessage = "Your password should be at least 6 characters.";
      break;
    case AuthStatus.wrongPassword:
      errorMessage = "Your email or password is wrong.";
      break;
    case AuthStatus.emailAlreadyExists:
      errorMessage = "The email address is already in use by another account.";
      break;
    default:
      errorMessage = "An error occured. Please try again later.";
  }
  return errorMessage;
}

/*     return SignInScreen(
      headerBuilder: (context, constraints, _) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset("assets/img/iccc_logo.webp"),
          ),
        );
      },
      providerConfigs: [
        EmailProviderConfiguration(),
      ],
    );
  } */

/*                                     try {
                                    await ref
                                        .read(firebaseAuthProvider)
                                        .signInWithEmailAndPassword(
                                            email: emailController.text,
                                            password: pwdController.text);
                                    // ignore: empty_catches
                                  } catch (e) {
                                    
                                  } */