import 'package:flutter/material.dart';
import 'package:resource/resource.dart';
import 'package:u_note_apps/shared/shared.dart';

class ButtonSkipAndNext extends StatelessWidget {
  const ButtonSkipAndNext({Key? key, this.onSkip, this.onNext})
      : super(key: key);
  final VoidCallback? onSkip;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: onSkip,
          child: Text(
            Strings.lewati,
            style: FontApp.primaryStyle.copyWith(
              color: ColorApp.primaryColor,
            ),
          ),
        ),
        CustomElevationButton(
          width: 182,
          style: FontApp.primaryStyle.copyWith(color: Colors.white),
          height: 52,
          text: Strings.lanjutkan,
          color: ColorApp.primaryColor,
          onTap: onNext,
          withIcon: true,
        )
      ],
    );
  }
}
