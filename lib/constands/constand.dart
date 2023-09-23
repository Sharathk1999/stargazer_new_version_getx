import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

final OnAudioQuery audioQuery = OnAudioQuery();
ConcatenatingAudioSource? playing;
final player = AudioPlayer();
String allSongsDbName = 'songs_db';

late double displayHeight;
late double displayWight;


const Color bgColor =  Color.fromRGBO(255, 246, 246, 1);
const Color bgColor2 =  Color.fromRGBO(255, 220, 220, 1);
const Color bgAppBar =  Color.fromARGB(255, 248, 147, 147);

Color  favColor = Colors.black54;