import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/components/custom_app_bar.dart';
import 'package:notes_app/components/notes_list_view.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({
    super.key,
  });

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        children: [
          CustomAppBar(
            onTap: () {},
            title: 'Notes',
            icon: Icons.search,
          ),
          const SizedBox(height: 20),
          const Expanded(
            child: NotesListView(),
          ),
        ],
      ),
    );
  }
}
