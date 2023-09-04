import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "Can not be embty";
  }
  if (val.length < min) {
    return "Can not be lesst han $min";
  }
  if (val.length > max) {
    return "Can not be larger than $max";
  }
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "not valid username";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "not valid email";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Not valid phone number";
    }
  }
}
