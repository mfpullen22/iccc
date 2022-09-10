import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class TopCard extends StatelessWidget {
  const TopCard ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize =  MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 0.95,
      height: screenSize.height * 0.15,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.5),
        boxShadow: [
          BoxShadow(
            offset: const Offset(10, 5),
            blurRadius: 10,
            spreadRadius: 10,
            color: Colors.grey.withOpacity(0.7),
          )]
      ),
      child: Column(
        children: [
          Text("ICCC 2023",
          style: GoogleFonts.raleway(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text("Kampala, Uganda",
          style: GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text("January 9 - 13, 2023",
          style: GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}