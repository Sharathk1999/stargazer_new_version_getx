import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app_getx/constands/constand.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor2,

      appBar: AppBar(
        title:  Text('About Us',style: GoogleFonts.inconsolata(),),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        toolbarHeight: 50,
        backgroundColor: const Color.fromARGB(255, 247, 129, 129),
      ),
      body:  SafeArea(
        child: Padding(
          padding:const EdgeInsets.all(16),
          child: Text(
            'A simple music player created with flutter with easy to use functionalities and UI',
            style: GoogleFonts.inconsolata(color: Colors.black, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
