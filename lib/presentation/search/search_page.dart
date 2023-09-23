import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app_getx/constands/constand.dart';
import 'package:music_app_getx/controller/all_songs_controller.dart';
import 'package:music_app_getx/presentation/musicPlayerPage/music_player_screen.dart';
import 'package:music_app_getx/presentation/widgets/menu_icon_home.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  @override
  State<SearchPage> createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  String search = '';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    List findList = [];
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
          title: Container(
            width: width * 70,
            alignment: Alignment.centerLeft,
            color: const Color.fromARGB(255, 247, 129, 129),
            child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration:  InputDecoration(
                  border: InputBorder.none,
                  hintStyle: GoogleFonts.inconsolata(color: Colors.white),
                  hintText: 'Search songs, artist or album',
                ),
                onChanged: (value) => setState(() {
                      search = value;
                    })),
          ),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          toolbarHeight: 50,
          backgroundColor: const Color.fromARGB(255, 247, 129, 129)),
      body: SafeArea(
        child: Stack(
          children: [
            GetBuilder<AllSongsController>(
              builder: (controller) {
                if (controller.songsList.isEmpty) {
                  return const Center(
                    child: Text(
                      'no audio files found with the name',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
                if (search.isEmpty) {
                  findList = controller.songsList.toList();
                } else {
                  findList = controller.songsList
                      .where((element) => element.songTitle
                          .toLowerCase()
                          .contains(search.toLowerCase()))
                      .toList();
                }
                if (findList.isEmpty) {
                  return const Center(
                    child: Text(
                      'no songs found',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: findList.length,
                  itemBuilder: (context, index) {
                    var title = findList[index].songTitle;
                    var artist = findList[index].songArtist!;
                    var image = findList[index].imageId;
                    var id = findList[index].id;
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 1,
                      shape:const RoundedRectangleBorder(
                        
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: ListTile(
                        tileColor: bgColor2,
                        onTap: () async {
                          int searchResultId = controller.songsList
                              .indexWhere((element) => element.id == findList[index].id);
                          Get.to(() => MusicPlayerScreen(index: searchResultId, songsIds: []));
                        },
                        title: Text(
                          title,
                          style: GoogleFonts.inconsolata(color: Colors.black),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          artist == "<unknown>" ? "Artist Unknown" :artist,
                          style: GoogleFonts.inconsolata(color: Colors.black),
                        ),
                        leading: QueryArtworkWidget(
                          id: image!,
                          type: ArtworkType.AUDIO,
                          nullArtworkWidget:const CircleAvatar(
                            radius: 25,
                            backgroundColor: bgColor,
                            child: Icon(Icons.music_note_rounded,color: bgAppBar,),
                            
                          ),
                        ),
                        trailing: menuIcon(id: id, isPlaylist: false),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
