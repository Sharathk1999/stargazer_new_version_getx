import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app_getx/constands/constand.dart';
import 'package:music_app_getx/controller/playlist_page_controller.dart';
import 'package:music_app_getx/controller/playlist_songs_list_controller.dart';
import 'package:music_app_getx/presentation/playlsitPage/playlist_page.dart';

playlistDialogue(int id) {
  final playlistController = Get.find<PlayListPageController>();
  final playlistSongController = Get.find<PlaylistSongsController>();
  return Get.dialog(
    Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: bgColor),
          height: 400,
          width: 400,
          child: GetBuilder<PlayListPageController>(
            builder: (controller) {
              if (controller.playListTitle.isEmpty) {
                return SizedBox(
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text(
                        'No Playlists Yet.',
                        style: GoogleFonts.inconsolata(color: Colors.black, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 248, 131, 131),
                          ),
                          onPressed: () {
                            Get.back();
                            Get.to(() => PlayListPage());
                          },
                          child:  Text('Go to Playlist',style: GoogleFonts.inconsolata(),))
                    ],
                  ),
                );
              }
              // for (var song in controller.playlistList) {
              //   playListName.add(song.playlistName!);
              //   playlistSongDetails.add(song);
              //   playListIds.add(song.playListId);
              // }
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      child: Column(
                        children: [
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: playlistController.playListTitle.length,
                            itemBuilder: (context, index) {
                              return ElevatedButton(
                                style:  ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 248, 131, 131),),
                                child: Text(
                                  playlistController
                                      .playListTitle[index].playlistName,
                                      style: GoogleFonts.inconsolata(),
                                ),
                                onPressed: () {
                                  playlistSongController.addToPlaylist(
                                      id,
                                      playlistController
                                          .playListTitle[index].id);
                                },
                              );
                            },
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 235, 112, 103)),
                        onPressed: () {
                          Get.back();
                        },
                        child:  Text('Cancel',style: GoogleFonts.inconsolata(),),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    ),
  );
}
