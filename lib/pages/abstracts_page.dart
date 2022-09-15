import "package:flutter/material.dart";

class AbstractsPage extends StatelessWidget {
  const AbstractsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Abstracts")),
      body: Center(
        child: Column(
          children: const [
            Text("Abstracts Page"),
          ],
        ),
      )
    );
  }
}