import 'package:flutter/material.dart';
import '../model/Note.dart';
import '../API/NoteAPIService.dart';
import 'NoteForm.dart';


class EditNoteScreen extends StatelessWidget {
  final Note note;

  const EditNoteScreen({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NoteForm(
      note: note,

      onSave: (updatedNote) async {
        await NoteAPIService.instance.updateNote(updatedNote);
        Navigator.pop(context, true);
      },
    );
  }
}