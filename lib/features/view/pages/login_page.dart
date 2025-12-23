import 'package:flutter/material.dart' as material;
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:client/core/theme/app_pallete.dart' as app_pallete;
import 'package:client/core/utils.dart' as utils;
import 'package:client/core/widgets/loader.dart' as loader;
import 'package:client/features/viewmodel/auth_viewmodel.dart'
    as auth_viewmodel;
import 'package:client/features/view/widgets/custom_field.dart'
    as custom_field;
import 'package:client/features/view/widgets/auth_gradient_btn.dart'
    as auth_gradient_btn;
import 'package:client/features/view/pages/signup_page.dart'
    as signup_page;

class LoginPage extends riverpod.ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  riverpod.ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends riverpod.ConsumerState<LoginPage> {
  final emailController = material.TextEditingController();
  final passwordController = material.TextEditingController();
  final formKey = material.GlobalKey<material.FormState>();

  @override
  void dispose() {
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
          utils.showSnackBar(context, 'login successful');
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
                      'Sign In.',
                      style: material.TextStyle(
                        fontSize: 50,
                        fontWeight: material.FontWeight.bold,
                      ),
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
                      buttonText: 'Sign In',
                      onTap: () async {
                        ref
                            .read(auth_viewmodel.authViewModelProvider.notifier)
                            .loginUser(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                      },
                    ),
                    const material.SizedBox(height: 15),
                    material.GestureDetector(
                      onTap: () => material.Navigator.push(
                        context,
                        material.MaterialPageRoute(
                          builder: (context) => const signup_page.SignupPage(),
                        ),
                      ),
                      child: material.RichText(
                        text: material.TextSpan(
                          text: 'Don\'t have an account? ',
                          style: material.Theme.of(
                            context,
                          ).textTheme.titleMedium,
                          children: const [
                            material.TextSpan(
                              text: 'Sign Up',
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
