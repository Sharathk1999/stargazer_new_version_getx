import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app_getx/constands/constand.dart';
import 'package:music_app_getx/controller/splash_screen_controller.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreenPage extends StatelessWidget {
  SplashScreenPage({super.key});
  final splashScreenController = Get.put(SplashScreenController());
      
  @override
  Widget build(BuildContext context) {
    displayHeight = MediaQuery.of(context).size.height;
    displayWight = MediaQuery.of(context).size.width / 100;
  
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
           const CircleAvatar(
              radius: 80,
              backgroundColor: bgColor,
              backgroundImage: AssetImage('assets/Stargazer_logo-bg.png'),
            ),
             Padding(
              padding:const EdgeInsets.all(30.0),
              child: Shimmer.fromColors(
                baseColor: bgAppBar,
                highlightColor: bgColor,
                child: Text(
                  'Stargazer Loading...',
                  style: GoogleFonts.inconsolata(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
