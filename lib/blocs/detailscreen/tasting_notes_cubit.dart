import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_cask/model/tasting_notes_model.dart';


class TastingNotesCubit extends Cubit<TastingNotesState> {
  TastingNotesCubit() : super(TastingNotesState());

  void updateNose(String nose) {
    emit(state.copyWith(nose: nose));
  }

  void updatePalate(String palate) {
    emit(state.copyWith(palate: palate));
  }

  void updateFinish(String finish) {
    emit(state.copyWith(finish: finish));
  }
}