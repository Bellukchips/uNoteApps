import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:u_note_apps/core/enum/enum.dart';
import 'package:u_note_apps/features/u_note_apps/presentation/pages/features/home_page.dart';
import 'package:u_note_apps/features/u_note_apps/presentation/pages/pages.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  var logger = Logger();
  switch (state) {
    case AppStatus.authenticated:
      logger.d('authenticated');
      return [HomePage.page()];
    case AppStatus.unauthenticated:
    default:
      logger.d('unauthenticated');
      return [IntroPages.page()];
  }
}
