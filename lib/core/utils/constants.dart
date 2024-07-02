import 'package:flutter/material.dart';

const kDuration = Duration(seconds: 2);

const String STORAGE_USER_SEE_KEY = 'userSee';

/// convert to color
Color hexToColor(String hexString, {String alphaChannel = 'FF'}) {
  return Color(int.parse(hexString.replaceFirst('#', '0x$alphaChannel')));
}