import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';

part 'cloth_recognition_state.freezed.dart';

@freezed
class ClothRecognitionState with _$ClothRecognitionState {
  const factory ClothRecognitionState.initial() = _Initial;

  const factory ClothRecognitionState.loading() = _Loading;

  const factory ClothRecognitionState.success({required List<ImageLabel> labels}) = _Success;

  const factory ClothRecognitionState.noInternet() = _Internet;

  const factory ClothRecognitionState.error({
    required String message,
  }) = _Error;
}
