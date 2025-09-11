import 'package:client/core/theme/app_pallete.dart' as app_pallete;
import 'package:client/features/auth/repositories/auth_remote_repository.dart'
    as auth_remote_repository;
import 'package:client/features/auth/view/pages/signup_page.dart'
    as signup_page;
import 'package:client/features/auth/view/widgets/auth_gradient_btn.dart'
    as auth_gradient_btn;
import 'package:client/features/auth/view/widgets/custom_field.dart'
    as custom_field;
import 'package:flutter/material.dart' as material;

class LoginPage extends material.StatefulWidget {
  const LoginPage({super.key});

  @override
  material.State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends material.State<LoginPage> {
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
                  await auth_remote_repository.AuthRemoteRepository.login(
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
                    style: material.Theme.of(context).textTheme.titleMedium,
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
