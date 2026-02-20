import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app_v2/bloc_observer.dart';
import 'package:notes_app_v2/constant.dart';
import 'package:notes_app_v2/models/note_model.dart';
import 'package:notes_app_v2/views/notes_view.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox(kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesView(),
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
    );
  }
}
