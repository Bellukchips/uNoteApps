import 'package:flutter/cupertino.dart';
import 'package:u_note_apps/core/enum/enum.dart';
import 'package:u_note_apps/features/u_note_apps/presentation/pages/features/home_page.dart';
import 'package:u_note_apps/features/u_note_apps/presentation/pages/pages.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [IntroPages.page()];
  }
}
