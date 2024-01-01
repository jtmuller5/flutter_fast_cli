import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterfast/app/constants.dart';
import 'package:flutterfast/app/router.dart';
import 'package:flutterfast/app/services.dart';
import 'package:flutterfast/app/text_theme.dart';
import 'package:flutterfast/app/theme.dart';
import 'package:flutterfast/features/authentication/models/fast_user.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

@RoutePage()
class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  var maskFormatter = MaskTextInputFormatter(mask: '(###) ###-####', filter: {"#": RegExp(r'[0-9]')}, type: MaskAutoCompletionType.lazy);

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
              onPressed: () async {
                await authenticationService.signOut();
                subscriptionService.setPremium(false);

                if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Signed out')));
                router.pushAndPopUntil(const SignInRoute(), predicate: (route) => false);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: context.primary,
                  ),
                  gap8,
                  Text(
                    'Personal Information',
                    style: context.bodyMedium.bold,
                  ),
                ],
              ),
              gap16,
              TextField(
                controller: firstNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'First Name',
                  isDense: true,
                ),
                textInputAction: TextInputAction.next,
              ),
              gap8,
              TextField(
                controller: lastNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last Name',
                  isDense: true,
                ),
                textInputAction: TextInputAction.next,
              ),
              gap24,
              Row(
                children: [
                  const Icon(
                    Icons.phone,
                    color: Colors.blue,
                  ),
                  gap8,
                  Text(
                    'Contact Information',
                    style: context.bodyMedium.bold,
                  ),
                ],
              ),
              gap16,
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                  hintText: '(555) 555-5555',
                  isDense: true,
                ),
                inputFormatters: [maskFormatter],
                textInputAction: TextInputAction.next,
              ),
              gap8,
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  isDense: true,
                ),
                textInputAction: TextInputAction.done,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            if (firstNameController.text.isEmpty || lastNameController.text.isEmpty || emailController.text.isEmpty || phoneController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please fill out all fields')));
              return;
            }

            await userService.updateUser(FastUser(
              id: authenticationService.id!,
              firstName: firstNameController.text,
              lastName: lastNameController.text,
              email: emailController.text,
              phone: phoneController.text,
              onboarded: true,
            ));

            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile updated')));
              // unfocus
              FocusScope.of(context).unfocus();
            }
          },
          label: const Text('Save')),
    );
  }
}
