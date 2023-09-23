import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app_getx/controller/playlist_songs_list_controller.dart';

removefromPlaylist(int id, int playlistId) {
  final playlistSongsController = Get.find<PlaylistSongsController>();
  return Padding(
    padding: const EdgeInsets.only(left: 18.0, right: 18, top: 8),
    child: SizedBox(
      height: 40,
      width: double.infinity,
      child: ElevatedButton(
        style:
            ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 243, 159, 159)),
        onPressed: () {
          Get.back();
          playlistSongsController.removeFromPlaylist(id, playlistId);
        },
        child:  Text(
          'Remove from playlist',
          style:GoogleFonts.inconsolata( fontSize: 18, color: Colors.white),
        ),
      ),
    ),
  );
}
