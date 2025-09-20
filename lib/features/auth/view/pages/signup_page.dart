import 'package:client/core/theme/app_pallete.dart' as app_pallete;
import 'package:client/features/auth/view/pages/login_page.dart'
    as auth_login_page;
import 'package:client/features/auth/view/widgets/auth_gradient_btn.dart'
    as auth_gradient_btn;
import 'package:client/features/auth/view/widgets/custom_field.dart'
    as custom_field;
import 'package:client/features/auth/viewmodel/auth_viewmodel.dart'
    as auth_viewmodel;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart' as widgets;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
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
    return material.Scaffold(
      appBar: material.AppBar(),
      body: material.Padding(
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
                        .read(auth_viewmodel.authViewModelProvider.notifier)
                        .signupUser(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                        );
                  }
                },
              ),
              const material.SizedBox(height: 15),
              material.GestureDetector(
                onTap: () => widgets.Navigator.push(
                  context,
                  material.MaterialPageRoute(
                    builder: (context) => const auth_login_page.LoginPage(),
                  ),
                ),
                child: material.RichText(
                  text: material.TextSpan(
                    text: 'Already have an account? ',
                    style: material.Theme.of(context).textTheme.titleMedium,
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
