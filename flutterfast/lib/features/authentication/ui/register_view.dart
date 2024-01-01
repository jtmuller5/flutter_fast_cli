import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterfast/app/constants.dart';
import 'package:flutterfast/app/router.dart';
import 'package:flutterfast/app/services.dart';
import 'package:flutterfast/app/text_theme.dart';
import 'package:flutterfast/features/shared/ui/app_logo.dart';

@RoutePage()
class RegisterView extends StatefulWidget {
  const RegisterView({Key? key, this.email, this.password}) : super(key: key);

  final String? email;
  final String? password;

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  bool loading = false;

  @override
  void initState() {
    emailController = TextEditingController(text: widget.email);
    passwordController = TextEditingController(text: widget.password);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  'flutterfast',
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
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                gap24,
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      loading = true;
                    });
                    try {
                      await authenticationService.registerWithEmailAndPassword(email: emailController.text, password: passwordController.text);
                      await userService.createUser();
                      router.pushAndPopUntil(const OnboardingRoute(), predicate: (route) => false);
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('An unknown error occurred')));
                      }
                    } finally {
                      setState(() {
                        loading = false;
                      });
                    }
                  },
                  child: loading
                      ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(),
                        )
                      : const Text('Register'),
                ),
                TextButton(
                  onPressed: () async {
                    router.replace(const SignInRoute());
                  },
                  child: const Text('Already have an account? Sign In'),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
