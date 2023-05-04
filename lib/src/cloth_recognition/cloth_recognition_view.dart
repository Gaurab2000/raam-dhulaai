import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:raam_dhulaai/src/core/widgets/scaffold_wrapper.dart';

class ClothRecognitionView extends ConsumerStatefulWidget {
  const ClothRecognitionView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ClothRecognitionViewState();
}

class _ClothRecognitionViewState extends ConsumerState<ClothRecognitionView> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      appBar: AppBar(
        title: const Text(
          'AI cloth recognition',
          // style: AppSt,
        ),
      ),
      body: Container(),
    );
  }
}
