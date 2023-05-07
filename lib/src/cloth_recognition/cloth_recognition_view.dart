import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:raam_dhulaai/src/chat/image_label.dart';
import 'package:raam_dhulaai/src/core/routes/app_router.dart';
import 'package:raam_dhulaai/src/core/theme/app_colors.dart';
import 'package:raam_dhulaai/src/core/theme/app_styles.dart';
import 'package:raam_dhulaai/src/core/widgets/custom_button.dart';
import 'package:raam_dhulaai/src/core/widgets/scaffold_wrapper.dart';
import 'package:velocity_x/velocity_x.dart';

class ClothRecognitionView extends ConsumerStatefulWidget {
  const ClothRecognitionView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ClothRecognitionViewState();
}

class _ClothRecognitionViewState extends ConsumerState<ClothRecognitionView> {
  List<ImageLabel> labels = [];
  String? imagePath;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      appBar: AppBar(
        title: const Text(
          'AI cloth recognition',
          // style: AppSt,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomButton(
                isDisabled: false,
                title: "Upload Image",
                onPressed: () async {
                  ImageSource? imageSource = await showDialog<ImageSource?>(
                      context: context,
                      builder: (context) {
                        ImageSource tempImgSource;
                        return AlertDialog(
                          title: Text("Pick image source"),
                          content: Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  title: "Camera",
                                  isDisabled: false,
                                  onPressed: () {
                                    tempImgSource = ImageSource.camera;
                                    context.router.pop(tempImgSource);
                                  },
                                ),
                              ),
                              10.horizontalSpace,
                              Expanded(
                                child: CustomButton(
                                  isDisabled: false,
                                  title: "Gallery",
                                  onPressed: () {
                                    tempImgSource = ImageSource.gallery;
                                    // context.popRoute(tempImgSource);
                                    context.router.pop(tempImgSource);
                                  },
                                ),
                              )
                            ],
                          ),
                        );
                      });
                  final picker = await ImagePicker().pickImage(source: imageSource!);
                  if (picker != null) {
                    final InputImage inputImage = InputImage.fromFilePath(picker.path);
                    final List<ImageLabel> labels =
                        await ImageLabelAlgorithm.instance.getImageLabels(inputImage: inputImage);

                    setState(() {
                      this.labels = labels;
                      imagePath = picker.path;
                    });

                    // labels.map((e) => ref
                    //     .read(clothRecognitionNotifierProvider.notifier)
                    //     .addImageLabel(e.label, e.confidence, picker.path));
                  }
                },
              ),
              20.verticalSpace,
              if (imagePath.isNotEmptyAndNotNull)
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    height: 250,
                    width: 250,
                    child: Image.file(
                      File(imagePath!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Label",
                        style: AppStyles.text18PxSemiBold.copyWith(color: AppColors.primaryColor),
                      ),
                      Text("Confidence", style: AppStyles.text18PxSemiBold.copyWith(color: AppColors.primaryColor)),
                    ],
                  ),
                  20.verticalSpace,
                  if (labels.isNotEmpty)
                    Container(
                      width: double.maxFinite,
                      // height: 400,
                      child: ListView.separated(
                          separatorBuilder: (BuildContext context, index) {
                            return Divider();
                          },
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: labels.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  labels[index].label,
                                  style: AppStyles.text18PxRegular,
                                ),
                                Text((labels[index].confidence * 100).toStringAsFixed(2) + "%",
                                    style: AppStyles.text18PxRegular),
                              ],
                            );
                          }),
                    )
                ],
              ).p(20)

              // Consumer(
              //   builder: (context, ref, _) {
              //
              //      ref.listen(clothRecognitionNotifierProvider, (previous, next) {
              //       if (next != previous) {
              //         return Container();
              //       } else
              //         return Container();
              //     });
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}
