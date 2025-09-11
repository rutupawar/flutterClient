import 'package:client/core/theme/app_pallete.dart' as app_pallete;
import 'package:client/features/auth/view/pages/login_page.dart'
    as auth_login_page;
import 'package:client/features/auth/view/widgets/auth_gradient_btn.dart'
    as auth_gradient_btn;
import 'package:client/features/auth/view/widgets/custom_field.dart'
    as custom_field;
import 'package:flutter/material.dart' as material;
import 'package:client/features/auth/repositories/auth_remote_repository.dart'
    as auth_remote_repository;
import 'package:flutter/widgets.dart' as widgets;

class SignupPage extends material.StatefulWidget {
  const SignupPage({super.key});

  @override
  material.State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends material.State<SignupPage> {
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
                  await auth_remote_repository.AuthRemoteRepository.signup(
                    email: emailController.text,
                    password: passwordController.text,
                    name: nameController.text,
                  );
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
