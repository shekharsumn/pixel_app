// --- Cubit State ---
import 'package:one_cask/model/whisky_model.dart';

class WhiskyState {
  final List<Whisky> whiskies;
  final Whisky? selectedWhisky;

  WhiskyState({
    required this.whiskies,
    this.selectedWhisky,
  });

  WhiskyState copyWith({
    List<Whisky>? whiskies,
    Whisky? selectedWhisky,
  }) {
    return WhiskyState(
      whiskies: whiskies ?? this.whiskies,
      selectedWhisky: selectedWhisky ?? this.selectedWhisky,
    );
  }
}