import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/base/base.dart';
import 'package:food_delivery/controllers/controllers.dart';
import 'package:food_delivery/pages/pages.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/utils.dart';
import 'package:food_delivery/widgets/widgets.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    var passwordController = TextEditingController();
    void _login(AuthController authController) {
      String phone = phoneController.text.trim();
      String password = passwordController.text.trim();

      if (phone.isEmpty) {
        showCustomSnackBar('Type in your phone number',
            title: 'Your phone number');
      } else if (!GetUtils.isPhoneNumber(phone)) {
        showCustomSnackBar('Type in valid phone number',
            title: 'Valid phone number');
      } else if (password.isEmpty) {
        showCustomSnackBar('Type in your password', title: 'Password');
      } else if (password.length < 6) {
        showCustomSnackBar('Password can not be less than 6 characters',
            title: 'Password length');
      } else {
        authController.login(phone, password).then((status) {
          if (status.isSuccess) {
            Get.toNamed(RouteHelper.getInitial());
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(
        builder: (authController) {
          return !authController.isLoading
              ? SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: Dimensions.screenHeight * 0.05),
                      //app logo
                      Container(
                        height: Dimensions.screenHeight * 0.25,
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 80,
                            backgroundImage:
                                AssetImage('assets/image/logo part 1.png'),
                          ),
                        ),
                      ),
                      //welcome
                      Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.width20,
                        ),
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello',
                              style: TextStyle(
                                fontSize: Dimensions.font30 * 2 +
                                    Dimensions.font20 / 2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Sign in to your account',
                              style: TextStyle(
                                fontSize: Dimensions.font20,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Dimensions.height20),
                      //your email
                      AppTextField(
                        textController: phoneController,
                        hintText: 'Phone',
                        icon: Icons.mobile_friendly,
                      ),
                      SizedBox(height: Dimensions.height20),
                      //your password
                      AppTextField(
                        isObscure: true,
                        textController: passwordController,
                        hintText: 'Password',
                        icon: Icons.password_sharp,
                      ),
                      SizedBox(height: Dimensions.height20),
                      //tag line
                      Row(
                        children: [
                          Expanded(child: Container()),
                          RichText(
                            text: TextSpan(
                              text: 'Sign in to your account',
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: Dimensions.font20,
                              ),
                            ),
                          ),
                          SizedBox(width: Dimensions.width20),
                        ],
                      ),
                      SizedBox(height: Dimensions.screenHeight * 0.05),
                      //sign in button
                      GestureDetector(
                        onTap: () {
                          _login(authController);
                        },
                        child: Container(
                          width: Dimensions.screenWidth / 2,
                          height: Dimensions.screenHeight / 13,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius30),
                            color: AppColors.mainColor,
                          ),
                          child: Center(
                            child: BigText(
                              text: 'Sign in',
                              size: Dimensions.font30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Dimensions.screenHeight * 0.05),
                      //sign up options
                      RichText(
                        text: TextSpan(
                          text: "Don't have an account?",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimensions.font20,
                          ),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.to(
                                      () => SignUpPage(),
                                      transition: Transition.fade,
                                    ),
                              text: ' Create',
                              style: TextStyle(
                                color: AppColors.mainBlackColor,
                                fontSize: Dimensions.font20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : CustomLoader();
        },
      ),
    );
  }
}
