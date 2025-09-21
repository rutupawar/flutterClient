import 'package:client/core/utils.dart' as utils;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart' as widgets;
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;

import 'package:client/core/theme/app_pallete.dart' as app_pallete;
import 'package:client/core/widgets/loader.dart' as loader;
import 'package:client/features/auth/view/pages/login_page.dart'
    as auth_login_page;
import 'package:client/features/auth/view/widgets/auth_gradient_btn.dart'
    as auth_gradient_btn;
import 'package:client/features/auth/view/widgets/custom_field.dart'
    as custom_field;
import 'package:client/features/auth/viewmodel/auth_viewmodel.dart'
    as auth_viewmodel;

class SignupPage extends riverpod.ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  riverpod.ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends riverpod.ConsumerState<SignupPage> {
  final nameController = material.TextEditingController();
  final emailController = material.TextEditingController();
  final passwordController = material.TextEditingController();
  final formKey = material.GlobalKey<material.FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  material.Widget build(material.BuildContext context) {
    final isLoading =
        ref.watch(auth_viewmodel.authViewModelProvider)?.isLoading == true;

    ref.listen(auth_viewmodel.authViewModelProvider, (_, next) {
      next?.when(
        data: (data) {
          utils.showSnackBar(
            context,
            'signup successful, verify the email and then login',
          );

          material.Navigator.push(
            context,
            material.MaterialPageRoute(
              builder: (context) => const auth_login_page.LoginPage(),
            ),
          );
        },
        error: (error, st) {
          utils.showSnackBar(context, error.toString());
        },
        loading: () {},
      );
    });

    return material.Scaffold(
      appBar: material.AppBar(),
      body: isLoading
          ? const loader.Loader()
          : material.Padding(
              padding: const material.EdgeInsets.all(15.0),
              child: material.Form(
                key: formKey,
                child: material.Column(
                  mainAxisAlignment: material.MainAxisAlignment.center,
                  children: [
                    const material.Text(
                      'Sign Up.',
                      style: material.TextStyle(
                        fontSize: 50,
                        fontWeight: material.FontWeight.bold,
                      ),
                    ),
                    const material.SizedBox(height: 30),
                    custom_field.CustomField(
                      hintText: 'Name',
                      controller: nameController,
                    ),
                    const material.SizedBox(height: 15),
                    custom_field.CustomField(
                      hintText: 'Email',
                      controller: emailController,
                    ),
                    const material.SizedBox(height: 15),
                    custom_field.CustomField(
                      hintText: 'Password',
                      controller: passwordController,
                      obscureText: true,
                    ),
                    const material.SizedBox(height: 20),
                    auth_gradient_btn.AuthGradientBtn(
                      buttonText: 'Sign Up',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          await ref
                              .read(
                                auth_viewmodel.authViewModelProvider.notifier,
                              )
                              .signUpUser(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                              );
                        } else {
                          // show some error
                          print('Validate all ui fields for signup');
                        }
                      },
                    ),
                    const material.SizedBox(height: 15),
                    material.GestureDetector(
                      onTap: () => widgets.Navigator.push(
                        context,
                        material.MaterialPageRoute(
                          builder: (context) =>
                              const auth_login_page.LoginPage(),
                        ),
                      ),
                      child: material.RichText(
                        text: material.TextSpan(
                          text: 'Already have an account? ',
                          style: material.Theme.of(
                            context,
                          ).textTheme.titleMedium,
                          children: [
                            material.TextSpan(
                              text: 'Sign In',
                              style: material.TextStyle(
                                color: app_pallete.Pallete.gradient2,
                                fontWeight: material.FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
