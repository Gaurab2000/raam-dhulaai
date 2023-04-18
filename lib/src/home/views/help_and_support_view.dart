import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raam_dhulaai/src/core/constant/app_constant.dart';
import 'package:raam_dhulaai/src/core/utility/contact_utility.dart';
import 'package:raam_dhulaai/src/core/widgets/widgets.dart';
import 'package:raam_dhulaai/src/home/widgets/widgets.dart';

class HelpAndSupportView extends StatelessWidget {
  const HelpAndSupportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      appBar: AppBar(
        title: const Text('Help and Support'),
      ),
      body: Column(
        children: List.generate(AppConstant.helpAndSupport.length, (index) {
          final helpAndSupport = AppConstant.helpAndSupport[index];
          return CardListTile(
            title: helpAndSupport.name,
            onPressed: () async {
              await launchType(helpAndSupport.type, helpAndSupport.content);
            },
          );
        }),
      ),
    );
  }
}
