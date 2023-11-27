import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/components/custom_app_bar.dart';
import 'package:notes_app/components/custom_text_field.dart';
import 'package:notes_app/components/edit_note_colors_list_view.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';

class EditNotePage extends StatefulWidget {
  const EditNotePage({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            CustomAppBar(
              onTap: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = content ?? widget.note.subTitle;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
              title: 'Edit Note',
              icon: Icons.check,
            ),
            const SizedBox(height: 30),
            CustomTextFormField(
              onChanged: (value) {
                title = value;
              },
              label: widget.note.title,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              onChanged: (value) {
                content = value;
              },
              label: widget.note.subTitle,
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            EditNoteColorsListView(note: widget.note),
          ],
        ),
      ),
    );
  }
}
