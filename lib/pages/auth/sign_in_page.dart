import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      headerBuilder: (context, constraints, _) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset("assets/img/iccc_logo.webp"),
          ),
        );
      },
      actions: [
        AuthStateChangeAction<SignedIn>((context, _) {
          Navigator.of(context).pushReplacementNamed("/Home");
        }),
      ],
      providerConfigs: const [
        EmailProviderConfiguration(),
      ],
    );
  }
}
