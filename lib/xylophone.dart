import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

// final logger = Logger();
final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 50,
    colors: true,
    printEmojis: true,
    printTime: false,
  ),
);

class XylophoneApp extends StatelessWidget {
  //final player = AudioPlayer();

  const XylophoneApp({super.key});

  static const soundCount = 7;

  static const List<MaterialColor> colorMap = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.teal,
    Colors.purple
  ];

  Future<Map> getSoundsMap() async {
    //load up all the players into a map
    var sounds = {};
    logger.d("Load audio assets.");
    for (var i = 1; i <= soundCount; i++) {
      sounds[i] = AudioPlayer();
      logger.d("Loading note$i...");
      await sounds[i].setSource(AssetSource('note$i.wav'));
    }
    return sounds;
  }

  @override
  Widget build(BuildContext context) {
    void playSound(int soundIndex) {
      AudioPlayer().play(AssetSource('note$soundIndex.wav'));
    }

    Widget buildKey(int keyIndex) {
      return Expanded(
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: colorMap[keyIndex - 1],
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0.0)),
            ),
          ),
          onPressed: () {
            playSound(keyIndex);
          },
          child: const Text(""),
        ),
      );
    }

    List<Widget> soundKeys() {
      //Create all the children keys
      List<Widget> soundList = [];
      for (int i = 1; i <= soundCount; i++) {
        logger.d("Creating key for $i");
        soundList.add(buildKey(i));
      }
      return soundList;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: soundKeys(),
    );
  }
}
