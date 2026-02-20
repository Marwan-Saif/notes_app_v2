import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_v2/components/custom_note_card.dart';
import 'package:notes_app_v2/cubits/notes_cubit.dart/notes_cubit.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).featchAllNotes;
    // print("BlocProvider.of<NotesCubit>(context).notes");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        BlocProvider.of<NotesCubit>(context).featchAllNotes;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: NoteItem(),
              );
            },
            itemCount: state is NotesSuccess ? state.notes.length : 1,
          ),
        );
      },
    );
  }
}
