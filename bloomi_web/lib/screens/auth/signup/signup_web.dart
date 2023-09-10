import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bloomi_web/components/background_color_gradient.dart';
import 'package:bloomi_web/components/custom_image_column.dart';
import 'package:bloomi_web/components/custom_text_link_web.dart';
import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/components/form_button_web.dart';
import 'package:bloomi_web/components/form_heading.dart';
import 'package:bloomi_web/components/form_input_web.dart';
import 'package:bloomi_web/controllers/auth_controller.dart';
import 'package:bloomi_web/screens/auth/login/login.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class SignUpWeb extends StatelessWidget {
  SignUpWeb({
    super.key,
    required this.mediaQueryData,
  });

  final MediaQueryData mediaQueryData;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _conformFassword = TextEditingController();
  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          const BackgroundColorGradient(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mediaQueryData.size.width * 0.1),
                    child: Column(
                      children: [
                        SizedBox(height: mediaQueryData.size.height * 0.1),
                        Row(
                          children: [
                            CustomImageColumn(mediaQueryData: mediaQueryData),
                            SizedBox(width: mediaQueryData.size.width * 0.12),
                            Container(
                              padding: EdgeInsets.all(
                                  mediaQueryData.size.width * 0.03),
                              margin: EdgeInsets.only(
                                  top: mediaQueryData.size.height * 0.02),
                              decoration: BoxDecoration(
                                color: UtilConstants.lightgreyColor,
                                borderRadius: BorderRadius.circular(
                                    mediaQueryData.size.height * 0.03),
                              ),
                              child: Column(
                                children: [
                                  FormHeading("SignUp Here",
                                      mediaQueryData: mediaQueryData),
                                  SizedBox(
                                      height:
                                          mediaQueryData.size.height * 0.05),
                                  FormInputWeb("Name",
                                      textEditingController: _name,
                                      mediaQueryData: mediaQueryData),
                                  SizedBox(
                                      height:
                                          mediaQueryData.size.height * 0.02),
                                  FormInputWeb("Email",
                                      textEditingController: _email,
                                      mediaQueryData: mediaQueryData),
                                  SizedBox(
                                      height:
                                          mediaQueryData.size.height * 0.02),
                                  FormInputWeb("Password",
                                      textEditingController: _password,
                                      mediaQueryData: mediaQueryData),
                                  SizedBox(
                                      height:
                                          mediaQueryData.size.height * 0.02),
                                  FormInputWeb("Conform Password",
                                      textEditingController: _conformFassword,
                                      mediaQueryData: mediaQueryData),
                                  SizedBox(
                                      height:
                                          mediaQueryData.size.height * 0.10),
                                  InkWell(
                                    onTap: () {
                                      if (_email.text.isNotEmpty &&
                                          _password.text.isNotEmpty) {
                                        AuthController.signUpUser(
                                            _email.text, _password.text);
                                      } else {
                                        AwesomeDialog(
                                          width:
                                              mediaQueryData.size.width * 0.35,
                                          context: context,
                                          dialogType: DialogType.noHeader,
                                          animType: AnimType.scale,
                                          title: 'ERROR',
                                          desc:
                                              'Please file the all feilds properly',
                                          btnCancelOnPress: () {},
                                          btnOkOnPress: () {},
                                        ).show();
                                      }
                                    },
                                    child: FormButtonWeb(
                                      "Register",
                                      mediaQueryData: mediaQueryData,
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          mediaQueryData.size.height * 0.02),
                                  CustomTextLinkWeb("Already have an account?",
                                      mediaQueryData: mediaQueryData,
                                      route: const Login())
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: mediaQueryData.size.height * 0.1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Footer(mediaQueryData: mediaQueryData),
            ],
          ),
        ],
      ),
    );
  }
}
