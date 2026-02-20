import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_v2/components/add_note_bottom_sheet.dart';
import 'package:notes_app_v2/components/appbar.dart';
import 'package:notes_app_v2/components/notes_listview.dart';
import 'package:notes_app_v2/cubits/notes_cubit.dart/notes_cubit.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  context: context,
                  builder: (context) {
                    return AddNoteBottomSheet();
                  });
            },
          ),
          body: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              children: [
                CustomAppBar(title: "Notes", icon: Icons.search),
                Expanded(child: NotesListView()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class notesViewBody extends StatefulWidget {
//   const notesViewBody({
//     super.key,
//   });

//   @override
//   State<notesViewBody> createState() => _notesViewBodyState();
// }

// class _notesViewBodyState extends State<notesViewBody> {
//   @override
//   void initState() {
//     // BlocProvider.of<NotesCubit>(context).featchAllNotes();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Padding(
//       padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//       child: Column(
//         children: [
//           CustomAppBar(title: "Notes", icon: Icons.search),
//           Expanded(child: NotesListView()),
//         ],
//       ),
//     );
//   }
// }
