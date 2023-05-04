import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:raam_dhulaai/src/cloth_recognition/cloth_recognition_state.dart';

class ClothRecognitionNotifier extends StateNotifier<ClothRecognitionState> {
  ClothRecognitionNotifier(ClothRecognitionState state) : super(ClothRecognitionState.initial());
}
