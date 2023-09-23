import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app_getx/constands/constand.dart';
import 'package:music_app_getx/controller/playlist_page_controller.dart';
import 'package:music_app_getx/presentation/widgets/snackbar_widget.dart';

addPlaylistDialog(
  PlayListPageController playlistController,
) {
  List checkName =
      playlistController.playListTitle.map((e) => e.playlistName).toList();
  TextEditingController playlistNameController = TextEditingController();
  return Get.dialog(
    AlertDialog(
      title: Text(
        'Enter Playlist name',
        style: GoogleFonts.inconsolata(
            color: const Color.fromARGB(255, 0, 0, 0), fontSize: 20),
      ),
      backgroundColor: const Color.fromARGB(255, 218, 215, 215),
      content: SizedBox(
        height: 50,
        child: Center(
          child: TextFormField(
            controller: playlistNameController,
            validator: (value) {
              if (playlistNameController.text.trim().isEmpty) {
                return 'Name required';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8),
                hintText: 'Enter playlist name...,',
                hintStyle: GoogleFonts.inconsolata(
                  color: const Color.fromARGB(153, 35, 28, 28),
                  fontSize: 16,
                ),
                border: const OutlineInputBorder()),
            style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            if (checkName.contains(playlistNameController.text)) {
              snackBarWidget(
                  message:
                      'playlist with name "${playlistNameController.text}" already exists',
                  title: 'Exists');
            } else if (playlistNameController.text.trim().isEmpty) {
              Get.showSnackbar(const GetSnackBar(
                title: 'Please enter a name',
              ));
            } else {
              playlistController
                  .addPlaylist(playlistNameController.text.trim());
              playlistNameController.clear();
              Get.back();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: bgAppBar,
          ),
          child: Text(
            'create',
            style: GoogleFonts.inconsolata(),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            playlistNameController.clear();
            Get.back();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: bgAppBar,
          ),
          child: Text(
            'cancel',
            style: GoogleFonts.inconsolata(),
          ),
        ),
      ],
    ),
  );
}
