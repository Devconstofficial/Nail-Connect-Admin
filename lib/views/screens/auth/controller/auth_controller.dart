import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  TextEditingController emailLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();
  RxBool isPasswordLoginVisible = true.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  var isObscureNewPass = true.obs;
  var isObscureConfirmPass = true.obs;
  var code = "".obs;
}