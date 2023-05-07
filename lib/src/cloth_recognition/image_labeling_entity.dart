import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_labeling_entity.freezed.dart';

@freezed
class ImageLabelingEntity with _$ImageLabelingEntity {
  const ImageLabelingEntity._();

  factory ImageLabelingEntity({String? label, double? confidence, String? filePath}) = _ImageLabelingEntity;
}
