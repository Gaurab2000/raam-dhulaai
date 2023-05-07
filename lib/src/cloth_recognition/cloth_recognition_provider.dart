import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:raam_dhulaai/src/cloth_recognition/image_labeling_entity.dart';
import 'package:raam_dhulaai/src/core/state/app_form_state.dart';

class ClothRecognitionNotifier extends StateNotifier<AppFormState<List<ImageLabelingEntity>>> {
  ClothRecognitionNotifier() : super(AppFormState([]));

  void addImageLabel(String label, double confidence, String filePath) {
    final _state = state;
    List<ImageLabelingEntity> labelList = state.form;
    labelList.add(ImageLabelingEntity(filePath: filePath, label: label, confidence: confidence));
    state = _state.copyWith(form: labelList);
  }
}

final clothRecognitionNotifierProvider =
    StateNotifierProvider.autoDispose<ClothRecognitionNotifier, AppFormState<ImageLabelingEntity>>(
        (ref) => ClothRecognitionNotifier());
