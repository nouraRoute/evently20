import 'package:evently/common/app_text_styles.dart';
import 'package:evently/common/widgets/custom_text_form_field.dart';
import 'package:evently/gen/assets.gen.dart';
import 'package:evently/theme/app_colors.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routeName = "/registerScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")), //TODO:localization
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formState,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Assets.images.logo.path, width: 136, height: 186),
                  CustomTextFormField(
                    label: "Name", //TODO:localization
                    prefixIcon: Assets.icons.nameIcon,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return "name is required!!"; //TODO:localization
                      }
                    },
                  ),
                  CustomTextFormField(
                    label: "Email", //TODO:localization
                    prefixIcon: Assets.icons.emailIcon,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return "email is required!!"; //TODO:localization
                      }
                    },
                  ),
                  CustomTextFormField(
                    label: "Password", //TODO:localization
                    prefixIcon: Assets.icons.passwordIcon,
                    isPassword: true,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return "password is required!!"; //TODO:localization
                      } else if (p0.length < 4) {
                        return "password must be atleast 6 characters";
                      }
                    },
                  ),
                  CustomTextFormField(
                    label: "Re Password", //TODO:localization
                    prefixIcon: Assets.icons.passwordIcon,
                    isPassword: true,
                    validator: (p0) {
                      //TODO:add validation
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Forget Password?",
                          style: AppTextStyles.styleS16W700(color: AppColors.mainColors).copyWith(
                            decoration: TextDecoration.underline,
                            fontStyle: FontStyle.italic,
                            decorationColor: AppColors.mainColors,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 24),
                    width: double.infinity,
                    height: 56,
                    child: FilledButton(
                      onPressed: () {
                        bool isValid = _formState.currentState!.validate();
                        if (isValid) {
                          //
                        }
                      },
                      child: Text("Create account"),
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.mainColors,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                  ),
                  //Don’t Have Account ? Create Account
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: "Already Have Account ? "),
                        TextSpan(
                          text: "Login",
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 16,
                            color: AppColors.mainColors,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.mainColors,
                            fontStyle: FontStyle.italic,
                          ),
                          //TODO:ontap
                        ),
                      ],
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 16),
                    ),
                  ),

                  SizedBox(height: 24),
                  Switch(
                    value: false,
                    inactiveTrackColor: AppColors.mainColors.withValues(alpha: .2),
                    inactiveThumbColor: AppColors.mainColors,
                    activeThumbColor: AppColors.mainColors,
                    activeTrackColor: AppColors.mainColors,
                    activeColor: AppColors.mainColors,
                    onChanged: (value) {},
                    inactiveThumbImage: AssetImage(Assets.icons.lr.path),
                    activeThumbImage: AssetImage(Assets.icons.eg.path),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
