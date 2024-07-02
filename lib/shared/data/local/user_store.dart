import 'package:get/get.dart';
import 'package:qproco_interview_project/core/utils/constants.dart';
import 'storage_service.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();
  String oneTimeSee = '';

  Future<void> setToken(String value) async {
    await StorageService.to.setString(STORAGE_USER_SEE_KEY, value);
    oneTimeSee = value;
  }

  Future<void> saveProfile(value) async {
    await setToken(value);
  }
}
