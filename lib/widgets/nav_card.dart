import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class NavCard extends StatelessWidget {
  final num widthMod;
  final Widget route;
  final String title;
  const NavCard({
    required this.route, 
    required this.title,
    required this.widthMod,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize =  MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => route)
          );
        },
        child: Container(
          width: screenSize.width * widthMod,
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
               ),
              ],
             ),
          child: Center(
            child: Text(
              title, 
              style: GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
    );
  }
}

