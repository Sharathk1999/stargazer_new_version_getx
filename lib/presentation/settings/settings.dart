import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app_getx/constands/constand.dart';
import 'package:music_app_getx/presentation/settings/pages/about_us.dart';
import 'package:music_app_getx/presentation/settings/pages/privacy_policy_page.dart';
import 'package:share_plus/share_plus.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    // var reset = ResetApp();

    return Scaffold(
      backgroundColor: bgColor2,
      appBar: AppBar(
        title:  Text('Settings',style: GoogleFonts.inconsolata(),),
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
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutUsPage(),
                  ),
                );
              },
              child: ListTile(
                title: Text(
                  'About Us',
                  style: GoogleFonts.inconsolata(color: Colors.black,),
                ),
              ),
            ),
          ),
          ListTile(
            title:  Text(
              'Privacy Policy',
              style: GoogleFonts.inconsolata(color: Colors.black,),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PrivacyPage(),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Version',
              style: GoogleFonts.inconsolata(color: Colors.black,),
            ),
            subtitle: Text(
              '0.0.1',
              style: GoogleFonts.inconsolata(color: Colors.black),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: InkWell(
          //     child: Container(
          //       decoration: BoxDecoration(
          //           border: Border.all(color: Colors.black),
          //           borderRadius: BorderRadius.circular(10)),
          //       child:  ListTile(
          //         title: Text(
          //           'Reset',
          //           style: GoogleFonts.inconsolata(color: Colors.black, fontSize: 20),
          //         ),
          //       ),
          //     ),
          //     onTap: () {
          //       showDialog(
          //         context: context,
          //         builder: (context) => AlertDialog(
          //             title:
          //                 const Text('Are you sure you want to reset the app?'),
          //             actions: [
          //               ElevatedButton(
          //                 onPressed: () {
          //                   reset.resetAppFunction();
          //                   Get.offAll(()=>SplashScreenPage());
          //                 },
          //                 style: ElevatedButton.styleFrom(
          //                     backgroundColor: Colors.red),
          //                 child: const Text('Yes'),
          //               ),
          //               ElevatedButton(
          //                   style: ElevatedButton.styleFrom(
          //                       backgroundColor:
          //                           const Color.fromARGB(255, 119, 109, 234)),
          //                   onPressed: () {
          //                     Navigator.pop(context);
          //                   },
          //                   child: const Text('No')),
          //             ]),
          //       );
          //     },
          //   ),
          // ),
          ListTile(
            title: Text(
              'Share App',
              style: GoogleFonts.inconsolata(),
            ),
            trailing: IconButton(
              onPressed: () async {
                try {
                  const appUrl =
                      'https://play.google.com/store/apps/details?id=in.sharath.stargazer_audio';
                  await Share.share(appUrl, subject: "stargazer app");
                } on Exception catch (e) {
                  log(
                    e.toString(),
                  );
                }
              },
              icon: const Icon(Icons.share),
            ),
          ),
        ],
      )),
    );
  }
}
