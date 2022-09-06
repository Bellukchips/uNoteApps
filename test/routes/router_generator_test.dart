import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:u_note_apps/core/enum/enum.dart';
import 'package:u_note_apps/features/u_note_apps/presentation/pages/features/home_page.dart';
import 'package:u_note_apps/features/u_note_apps/presentation/pages/onboarding/intro_pages.dart';
import 'package:u_note_apps/routes/router_generator.dart';

void main() {
  group('onGenerateAppViewPages', () {
    test('should return [HomePage] when authenticated', () {
      //!arrange
      expect(onGenerateAppViewPages(AppStatus.authenticated, []), [
        isA<MaterialPage<void>>()
            .having((p) => p.child, 'child', isA<HomePage>())
      ]);
      //!act

      //!assert
    });
    test('should return [IntroPages] when unauthenticated', () {
      //!arrange
      expect(onGenerateAppViewPages(AppStatus.unauthenticated, []), [
        isA<MaterialPage<void>>()
            .having((p) => p.child, 'child', isA<IntroPages>())
      ]);
      //!act

      //!assert
    });
  });
}
