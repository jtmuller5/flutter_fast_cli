import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterfast/app/config.dart';
import 'package:flutterfast/app/constants.dart';
import 'package:flutterfast/app/router.dart';
import 'package:flutterfast/app/services.dart';
import 'package:flutterfast/app/text_theme.dart';
import 'package:flutterfast/app/theme.dart';
import 'package:flutterfast/features/authentication/ui/widgets/social_login_button.dart';
import 'package:flutterfast/features/shared/ui/app_logo.dart';

@RoutePage()
class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool loading = false;
  bool obscureText = true;

  Future<void> runWithLoading(Future<void> Function() future) async {
    setState(() => loading = true);

    try {
      await future();
    } catch (e) {
      rethrow;
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(24),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppLogo(sideLength: 100),
                    gap16,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Config.appName,
                            style: context.headlineSmall.bold,
                          ),
                          gap8,
                          Text(
                            Config.appSubtitle,
                            style: context.bodyMedium.italic,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                gap32,
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
                gap8,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        router.push(ForgotPasswordRoute(email: emailController.text));
                      },
                      child: const Text('Forgot Password?'),
                    ),
                  ],
                ),
                gap8,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
                  onPressed: () async {
                    await runWithLoading(() async {
                      try {
                        await authenticationService.signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      } catch (e) {
                        if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                      }
                    });
                  },
                  child: loading
                      ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          'Sign In',
                          style: context.bodyLarge.bold.copyWith(color: Colors.white),
                        ),
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
                //* Social Login *//
                gap24,
                Row(
                  children: [
                    Expanded(
                      child: Divider(color: context.primary),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('or', style: context.bodyMedium),
                    ),
                    Expanded(
                      child: Divider(
                        color: context.primary,
                      ),
                    )
                  ],
                ),
                gap32,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialLoginButton.wide(
                      image: 'assets/images/google.png',
                      provider: 'Google',
                      onPressed: () async {
                        await runWithLoading(() async {
                          try {
                            await authenticationService.signInWithGoogle();
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(e.toString()),
                              ),
                            );
                          }
                        });
                      },
                    ),
                    gap8,
                    SocialLoginButton.wide(
                      image: 'assets/images/apple.png',
                      provider: 'Apple',
                      onPressed: () async {
                        await runWithLoading(() async {
                          try {
                            await authenticationService.signInWithApple();
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(e.toString()),
                              ),
                            );
                          }
                        });
                      },
                    ),
                  ],
                )
                //* Social Login *//
              ],
            ),
          ),
        );
      }),
    );
  }
}
