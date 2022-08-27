import 'package:flutter/material.dart';

class ImageAssets {
  static String imgPath = 'assets/img/';
  static String imgCreateNote = 'img_create_note';
  static String imgInvest = 'img_invest';
  static String imgPhone = 'img_phone';
  static String imgReminder = 'img_reminder';
  static String imgAtas = 'img_atas';
  static String imgBawah = 'img_bawah';
  static String imgNoDataNote = 'img_no_data_note';
  static String imgNoDataReminders = 'img_no_data_reminders';

  static String get(String path) => '$imgPath$path.png';
}

class IconAssets {
  static String iconPath = 'assets/icon/';

  ///get
  static String get(String path) => '$iconPath$path.svg';
}

class FontApp {
  static TextStyle primaryStyle =
      const TextStyle(fontFamily: 'Inter', color: Colors.black);
}
