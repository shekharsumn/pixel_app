import 'package:equatable/equatable.dart';

class TastingNotesState extends Equatable {
  final String nose;
  final String palate;
  final String finish;

  const TastingNotesState({
    this.nose = '',
    this.palate = '',
    this.finish = '',
  });

  TastingNotesState copyWith({
    String? nose,
    String? palate,
    String? finish,
  }) {
    return TastingNotesState(
      nose: nose ?? this.nose,
      palate: palate ?? this.palate,
      finish: finish ?? this.finish,
    );
  }

  @override
  List<Object?> get props => [nose, palate, finish];
}