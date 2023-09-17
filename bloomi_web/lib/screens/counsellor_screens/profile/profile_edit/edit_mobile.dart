import 'package:bloomi_web/components/custom_text_link_web.dart';
import 'package:bloomi_web/components/form_button_web.dart';
import 'package:bloomi_web/components/form_input_web.dart';
import 'package:bloomi_web/providers/auth/signup_provider.dart';
import 'package:bloomi_web/screens/auth_screens/login/login.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class editMobile extends StatefulWidget {
  const editMobile({
    super.key,
  });

  @override
  State<editMobile> createState() => _editMobileState();
}

class _editMobileState extends State<editMobile> {
  List<String> listItems = [
    'Faculty of Engineering',
    'Faculty of Medicine',
    'Faculty of Dental Sciences',
    'Faculty of Veterinary Medicine and Animal Science',
    'Faculty of Science',
    'Faculty of Agriculture',
    'Faculty of Allied Health Sciences',
    'Faculty of Arts',
    'Faculty of Management',
  ];

  List<String> year = [
    '1st Year',
    '2nd Year',
    '3rd Year',
    '4th Year',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          height: 480,
          width: 300,
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
          decoration: BoxDecoration(
            color: UtilConstants.lightgreyColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              FormInputWeb(
                "Name",
                textEditingController:
                    Provider.of<SignupProvider>(context).name,
                fontSize: 12,
                height: 45,
                width: 280,
                lableFontSize: 12,
              ),
              const SizedBox(height: 6),
              FormInputWeb(
                "Email",
                textEditingController:
                    Provider.of<SignupProvider>(context).email,
                fontSize: 12,
                height: 45,
                width: 280,
                lableFontSize: 12,
              ),
              const SizedBox(height: 6),
              FormInputWeb(
                "Password",
                textEditingController:
                    Provider.of<SignupProvider>(context).password,
                obscure: true,
                fontSize: 12,
                height: 45,
                width: 280,
                lableFontSize: 12,
              ),
              const SizedBox(height: 6),
              FormInputWeb(
                "Phone Number",
                textEditingController:
                    Provider.of<SignupProvider>(context).phoneNumber,
                fontSize: 12,
                height: 45,
                width: 280,
                lableFontSize: 12,
              ),
              const SizedBox(height: 6),
              FormInputWeb(
                "Faculty",
                textEditingController:
                    Provider.of<SignupProvider>(context).faculty,
                fontSize: 12,
                height: 45,
                width: 280,
                lableFontSize: 12,
              ),
              const SizedBox(height: 6),
              FormInputWeb(
                "Department",
                textEditingController:
                    Provider.of<SignupProvider>(context).department,
                fontSize: 12,
                height: 45,
                width: 280,
                lableFontSize: 12,
              ),
              const SizedBox(height: 6),
              FormInputWeb(
                "Level of Study",
                textEditingController:
                    Provider.of<SignupProvider>(context).year,
                fontSize: 12,
                height: 45,
                width: 280,
                lableFontSize: 12,
              ),
              const SizedBox(height: 25),
              Consumer<SignupProvider>(
                builder: (context, value, child) {
                  return InkWell(
                    onTap: () {
                      Provider.of<SignupProvider>(context, listen: false)
                          .signUpUser(
                              value.email.text,
                              value.password.text,
                              value.name.text,
                              value.phoneNumber.text,
                              value.department.text,
                              value.faculty.text,
                              value.year.text,
                              context);
                    },
                    child: FormButtonWeb(
                      "Save",
                      isLoading: value.isLoading,
                      width: 280,
                      height: 45,
                      fontSize: 12,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
