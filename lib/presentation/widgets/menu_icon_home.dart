import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app_getx/constands/constand.dart';
import 'package:music_app_getx/controller/all_songs_controller.dart';
import 'package:music_app_getx/models/models.dart';
import 'package:music_app_getx/presentation/homepage/homepageWidgets/add_to_playlist_button.dart';
import 'package:music_app_getx/presentation/playlsitPage/widgets/remove_playlist_button.dart';

menuIcon({
  required int id,
  required bool isPlaylist,
  int? playlistId
}) {
  final songController = Get.find<AllSongsController>();
  SongsListModel song =
      songController.songsList.firstWhere((element) => element.id == id);

  return IconButton(
    icon: const Icon(Icons.more_vert_outlined, size: 30),
    color: Color.fromARGB(255, 252, 142, 142),
    onPressed: () {
      Get.bottomSheet(
        BottomSheet(
          backgroundColor: bgColor,
          onClosing: () {},
          builder: (context) => Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 14.0, bottom: 14, right: 20, left: 20),
                      child: Text(
                        song.songTitle,
                        style:GoogleFonts.inconsolata(
                            color: Colors.black,
                        ),
                            overflow: TextOverflow.ellipsis

                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: Builder(
                    builder: (context) {
                      // var isFav = favouritesController.isInFav(id);
                      if (song.isfav == true) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: bgColor2),
                          child: const Text(
                            'REMOVE FROM FAVOURITE',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          onPressed: () {
                            songController.updateFavourites(song.id!);
                            Get.back();
                          },
                        );
                      } else {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: bgColor2),
                          child:  Text(
                            'Add to favorites',
                            style: GoogleFonts.inconsolata(fontSize: 18, color: Colors.black),
                          ),
                          onPressed: () {
                            songController.updateFavourites(song.id!);
                            Get.back();
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
              isPlaylist ==false?
              addToPlaylistbutton(song.id!):removefromPlaylist(song.id!,playlistId!)
              ,
              Padding(
                padding: const EdgeInsets.only(
                    left: 18.0, right: 18, bottom: 10, top: 10),
                child: SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 244, 134, 134),
                          ),
                    onPressed: () => Navigator.pop(context),
                    child:  Text(
                      'Cancel',
                      style: GoogleFonts.inconsolata(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

      // showModalBottomSheet(
      //   shape: const RoundedRectangleBorder(
      //       borderRadius: BorderRadius.only(
      //           topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      //   backgroundColor: const Color.fromARGB(255, 233, 233, 233),
      //   context: context,
      //   builder: (context) {
      //     return ;
      //   },
      // );
    },
  );
}
