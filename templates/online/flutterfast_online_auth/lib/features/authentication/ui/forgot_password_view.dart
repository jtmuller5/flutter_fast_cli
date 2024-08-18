import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterfast_online_auth/app/config.dart';
import 'package:flutterfast_online_auth/app/constants.dart';
import 'package:flutterfast_online_auth/app/services.dart';
import 'package:flutterfast_online_auth/app/text_theme.dart';
import 'package:flutterfast_online_auth/features/shared/ui/app_logo.dart';

@RoutePage()
class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key, this.email}) : super(key: key);

  final String? email;

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  late TextEditingController emailController;

  bool loading = false;

  @override
  void initState() {
    emailController = TextEditingController(text: widget.email);

    super.initState();
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
                const AppLogo(sideLength: 200),
                gap16,
                Center(
                    child: Text(
                  Config.appName,
                  style: context.headlineSmall.bold,
                )),
                gap8,
                Center(
                    child: Text(
                  Config.appSubtitle,
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
                gap24,
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      loading = true;
                    });
                    try {
                      await authenticationService.sendPasswordResetEmail(emailController.text);
                      if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Password reset email sent')));
                      router.pop();
                    } catch (e) {
                      if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('An unknown error occurred')));
                    } finally {
                      setState(() {
                        loading = false;
                      });
                    }
                  },
                  child: loading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(),
                        )
                      : const Text('Send password reset email'),
                ),
                gap16,
                TextButton(
                  onPressed: () {
                    router.pop();
                  },
                  child: const Text('Back to sign in'),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
