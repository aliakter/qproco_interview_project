import 'dart:io';

final kTestMode = Platform.environment.containsKey('FLUTTER_TEST');
const String USER_LOCAL_STORAGE_KEY = 'user';
String JWT_TOKEN = '';
String FCM_TOKEN = '';
String IS_POST = "false";