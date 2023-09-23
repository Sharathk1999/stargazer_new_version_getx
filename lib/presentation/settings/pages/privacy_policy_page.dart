import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app_getx/constands/constand.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          'Privacy Policy',
          style: GoogleFonts.inconsolata(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        toolbarHeight: 50,
        backgroundColor: bgAppBar,
      ),
      body: SafeArea(
        child: Padding(
          padding:const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Stargazer - AudioPlayer:',
                    style: GoogleFonts.inconsolata(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
               const SizedBox(
                  height: 10,
                ),
                Text(
                  'Stargazer - AudioPlayer.("us", "we", or "our") is an audio player application designed to provide a seamless audio listening experience. This privacy policy explains how we collect, use, and protect the personal information of users of our app. ',
                  style: GoogleFonts.inconsolata(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
               const SizedBox(
                  height: 20,
                ),
                Text(
                  'Collection of Personal Information:',
                  style: GoogleFonts.inconsolata(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
               const SizedBox(
                  height: 10,
                ),
                Text(
                    'Stargazer Audio Player App does not collect any personal information from its users. We do not collect, store, or share any information from your device or your online activity. Our app only requires access to your internal storage to play audio files stored on your device.',
                    style: GoogleFonts.inconsolata(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
               const SizedBox(
                  height: 20,
                ),
                Text('Use of Personal Information:',
                    style: GoogleFonts.inconsolata(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
               const SizedBox(
                  height: 10,
                ),
                Text(
                    'As we do not collect any personal information from our users, we do not use any personal information for any purposes. We respect your privacy and do not engage in any practices that may compromise your privacy.',
                    style: GoogleFonts.inconsolata(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
               const SizedBox(
                  height: 20,
                ),
                Text('Data Security:',
                    style: GoogleFonts.inconsolata(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
               const SizedBox(
                  height: 10,
                ),
                Text(
                    'We take appropriate security measures to protect the personal information of our users from unauthorized access, alteration, or destruction. We store all information locally on the device and do not transmit any information to external servers.',
                    style: GoogleFonts.inconsolata(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
               const SizedBox(
                  height: 20,
                ),
                Text('Changes to the Privacy Policy:',
                    style: GoogleFonts.inconsolata(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
               const SizedBox(
                  height: 10,
                ),
                Text(
                    'We may update this privacy policy from time to time to reflect changes to our app, industry standards, or legal requirements. We encourage you to review this policy periodically to stay informed of our privacy practices.',
                    style: GoogleFonts.inconsolata(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
