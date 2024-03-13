
import 'package:flutter/material.dart';
import 'package:rmk_note/src/screen/UI_editor/editor_screen.dart';
import 'package:rmk_note/src/screen/ui_note.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   brightness: Brightness.dark,
      // ),
      home: const EditorScreen(),
    );
  }
}
