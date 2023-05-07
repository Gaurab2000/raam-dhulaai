import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';

class ImageLabelAlgorithm {
  static ImageLabelAlgorithm _imageLabelSingleton = ImageLabelAlgorithm._internal();
  final ImageLabelerOptions _options = ImageLabelerOptions(confidenceThreshold: 0.5);
  static ImageLabeler? _imageLabeler;

  ImageLabelAlgorithm._internal() {
    if (_imageLabeler == null) _imageLabeler = ImageLabeler(options: _options);
  }

  static ImageLabelAlgorithm get instance => _imageLabelSingleton;

  Future<List<ImageLabel>> getImageLabels({required InputImage inputImage}) async {
    final List<ImageLabel> labels = await _imageLabeler!.processImage(inputImage);

    for (ImageLabel label in labels) {
      final String text = label.label;
      final int index = label.index;
      final double confidence = label.confidence;
    }
    return labels;
  }

  void disposeImageLabeler() {
    _imageLabeler!.close();
  }
}
