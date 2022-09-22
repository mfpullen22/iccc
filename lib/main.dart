import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iccc_app/firebase_options.dart';
import 'package:iccc_app/pages/auth/sign_in_page.dart';
import 'package:iccc_app/pages/home_page.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:iccc_app/widgets/auth_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'ICCC',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(122, 0, 25, 1),
            primary: const Color.fromRGBO(122, 0, 25, 1)),
        // primarySwatch: Colors.blue,
      ),
      home: AuthWidget(
        signedInBuilder: (context) => const HomePage(),
        nonSignedInBuilder: (_) => const SignInPage(),
      ),
      routes: <String, WidgetBuilder>{
        "/SignIn": (BuildContext context) => const SignInPage(),
        "/Home": (BuildContext context) => const HomePage(),
      },
    );
  }
}
