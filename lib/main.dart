import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'xylophone.dart';

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

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: const Text('Audio'),
            backgroundColor: Colors.red[800],
          ),
          body: const XylophoneApp()),
    ),
  );
}
