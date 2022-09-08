import 'package:flutter/material.dart';
import 'package:resource/resource.dart';
import 'package:u_note_apps/features/u_note_apps/presentation/pages/authentication/authentication_page.dart';
import 'package:u_note_apps/features/u_note_apps/presentation/pages/onboarding/widgets/widgets.dart';
import 'package:u_note_apps/shared/shared.dart';
part 'components/body_intro_pages.dart';
part 'components/content_intro_pages.dart';

class IntroPages extends StatelessWidget {
  const IntroPages({Key? key}) : super(key: key);
  static Page page() => const MaterialPage(child: IntroPages());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: const Scaffold(
        body: SafeArea(child: BodyIntroPages()),
      ),
    );
  }
}
