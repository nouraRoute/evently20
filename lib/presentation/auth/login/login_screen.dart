import 'package:evently/presentation/auth/register/register_screen.dart';
import 'package:evently/common/app_text_styles.dart';
import 'package:evently/common/widgets/custom_text_form_field.dart';
import 'package:evently/gen/assets.gen.dart';
import 'package:evently/models/user_model.dart';
import 'package:evently/presentation/home/home_screen.dart';
import 'package:evently/services/firebase_auth_service.dart';
import 'package:evently/theme/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = "/loginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formState,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Assets.images.logo.path, width: 136, height: 186),
                  CustomTextFormField(
                    controller: emailController,
                    label: "Email", //TODO:localization
                    prefixIcon: Assets.icons.emailIcon,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return "email is required!!"; //TODO:localization
                      }
                    },
                  ),
                  CustomTextFormField(
                    controller: passwordController,
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
                      onPressed: isLoading
                          ? null
                          : () async {
                              bool isValid = _formState.currentState!.validate();
                              if (isValid) {
                                UserModel user = UserModel(
                                  email: emailController.text.trim(),
                                  password: passwordController.text,
                                );
                                setState(() {
                                  isLoading = true;
                                });
                                try {
                                  UserModel? userData = await FirebaseAuthService.login(user);

                                  if (userData != null) {
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            "success,you are logged in!",
                                            style: AppTextStyles.styleS16W600(color: Colors.white),
                                          ),
                                          backgroundColor: AppColors.mainColors.withValues(
                                            alpha: .6,
                                          ),
                                        ),
                                      );
                                      Navigator.of(
                                        context,
                                      ).pushReplacementNamed(HomeScreen.routeName);
                                    }
                                  }
                                } on String catch (errorMessage) {
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          errorMessage,
                                          style: AppTextStyles.styleS16W600(color: Colors.white),
                                        ),
                                        backgroundColor: AppColors.errorColor,
                                      ),
                                    );
                                  }
                                }
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            },
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.mainColors,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      child: isLoading ? CircularProgressIndicator() : Text("Login"),
                    ),
                  ),
                  //Don’t Have Account ? Create Account
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: "Don’t Have Account ? "),
                        TextSpan(
                          text: "Create Account",
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 16,
                            color: AppColors.mainColors,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.mainColors,
                            fontStyle: FontStyle.italic,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushNamed(RegisterScreen.routeName);
                            },
                          //TODO:ontap
                        ),
                      ],
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 16),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Row(
                      spacing: 16,
                      children: [
                        Expanded(child: Divider(color: AppColors.mainColors)),
                        Text("OR", style: AppTextStyles.styleS16W500(color: AppColors.mainColors)),
                        Expanded(child: Divider(color: AppColors.mainColors)),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 58,
                    child: OutlinedButton.icon(
                      icon: Image.asset(Assets.icons.google.path, width: 25, height: 25),
                      onPressed: () {},
                      label: Text(
                        "Login With Google",
                        style: AppTextStyles.styleS20W500(color: AppColors.mainColors),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: AppColors.mainColors),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
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

  //  void onRegister(){

  //   }
}
