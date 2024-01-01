import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterfast/app/constants.dart';
import 'package:flutterfast/app/router.dart';
import 'package:flutterfast/app/services.dart';
import 'package:flutterfast/app/text_theme.dart';
import 'package:flutterfast/features/shared/ui/app_logo.dart';

@RoutePage()
class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    bool loading = false;
    bool obscureText = true;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(builder: (context) {
        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(24),
              children: [
                const AppLogo(sideLength: 200),
                gap16,
                Center(
                    child: Text(
                  'Healthy Pet Connect',
                  style: context.headlineSmall.bold,
                )),
                gap8,
                Center(
                    child: Text(
                  'Build apps faster',
                  style: context.bodyMedium.italic,
                )),
                gap24,
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                ),
                gap16,
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
                      onPressed: obscureText
                          ? () {
                              setState(() {
                                obscureText = false;
                              });
                            }
                          : () {
                              setState(() {
                                obscureText = true;
                              });
                            },
                    ),
                    border: const OutlineInputBorder(),
                  ),
                  obscureText: obscureText,
                ),
                gap24,
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      loading = true;
                    });
                    try {
                      await authenticationService.signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      setState(() {
                        loading = false;
                      });
                      router.pushAndPopUntil(const HomeRoute(), predicate: (route) => false);
                    } catch (e) {
                      setState(() {
                        loading = false;
                      });
                      if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                    }
                  },
                  child: loading ? const SizedBox(height: 24, width: 24, child: CircularProgressIndicator()) : const Text('Sign In'),
                ),
                gap8,
                TextButton(
                  onPressed: () {
                    router.pushAndPopUntil(
                        RegisterRoute(
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                        predicate: (route) => false);
                  },
                  child: const Text('Don\'t have an account? Sign Up'),
                ),
                TextButton(
                  onPressed: () {
                    router.push(ForgotPasswordRoute(email: emailController.text));
                  },
                  child: const Text('Forgot Password?'),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
