import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app_getx/constands/constand.dart';
import 'package:music_app_getx/presentation/homepage/homepageWidgets/playlist_add_dialogue.dart';

addToPlaylistbutton(int id) {
  return Padding(
    padding: const EdgeInsets.only(left: 18.0, right: 18, top: 8),
    child: SizedBox(
      height: 40,
      width: double.infinity,
      child: ElevatedButton(
        
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor2,
        ),
        onPressed: () {
          Get.back();
          playlistDialogue(id);
        },
        child:  Text(
          'Add to playlist',
          style: GoogleFonts.inconsolata(fontSize: 18, color: Colors.black),
        ),
      ),
    ),
  );
}
