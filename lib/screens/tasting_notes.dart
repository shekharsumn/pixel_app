import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_cask/blocs/detailscreen/tasting_notes_cubit.dart';
import 'package:one_cask/model/tasting_notes_model.dart';

import 'package:one_cask/styles/ebgaramond.dart';

class TastingNotesScreen extends StatelessWidget {
  const TastingNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TastingNotesCubit(),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        controller: ScrollController(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Video Player Placeholder
              Container(
                height: 200, // Adjust as needed
                color: Colors.grey[300], // Placeholder color
                child: Center(child: Icon(Icons.play_arrow, size: 50)),
              ),
              SizedBox(height: 20),

              // Tasting Notes (Charles MacLean MBE)
              Text('Tasting notes by Charles MacLean MBE',
                  style:
                      ebGaramondTitleStyle(fontSize: 18, color: Colors.white)),
              _buildTastingNotesSection(
                  title: 'Nose',
                  notes: ['Description', 'Description', 'Description']),
              _buildTastingNotesSection(
                  title: 'Palate',
                  notes: ['Description', 'Description', 'Description']),
              _buildTastingNotesSection(
                  title: 'Finish',
                  notes: ['Description', 'Description', 'Description']),

              SizedBox(height: 20),

              // Your Notes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Your notes',
                      style: ebGaramondTitleStyle(
                          fontSize: 18, color: Colors.white)),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )), // History button placeholder
                ],
              ),
              BlocBuilder<TastingNotesCubit, TastingNotesState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      _buildUserNotesSection(
                          title: 'Nose',
                          notes: ['Description', 'Description', 'Description']),
                      _buildUserNotesSection(
                          title: 'Palate',
                          notes: ['Description', 'Description', 'Description']),
                      _buildUserNotesSection(
                          title: 'Finish',
                          notes: ['Description', 'Description', 'Description']),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTastingNotesSection(
      {required String title, required List<String> notes}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text(title,
            style: ebGaramondTitleStyle(fontSize: 18, color: Colors.white)),
        ...notes.map((note) => Text(
              '- $note',
              style: ebGaramondBodyStyle(fontSize: 16, color: Colors.white),
            )),
      ],
    );
  }

  Widget _buildUserNotesSection(
      {required String title, required List<String> notes}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text(title,
            style: ebGaramondTitleStyle(fontSize: 18, color: Colors.white)),
        ...notes.map((note) => Text(
              '- $note',
              style: ebGaramondBodyStyle(fontSize: 16, color: Colors.white),
            )),
      ],
    );
  }
}
