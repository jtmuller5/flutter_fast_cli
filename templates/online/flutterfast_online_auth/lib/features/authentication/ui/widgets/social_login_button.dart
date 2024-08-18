import 'package:flutter/material.dart';
import 'package:flutterfast_online_auth/app/constants.dart';
import 'package:flutterfast_online_auth/app/text_theme.dart';
import 'package:flutterfast_online_auth/app/theme.dart';

class SocialLoginButton extends StatelessWidget {
  final String image;
  final String provider;
  final Function onPressed;
  final bool isWide;

  const SocialLoginButton({
    super.key,
    required this.image,
    required this.provider,
    required this.onPressed,
    this.isWide = false,
  });

  const SocialLoginButton.wide({
    Key? key,
    required this.image,
    required this.provider,
    required this.onPressed,
  })  : isWide = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: provider == 'Apple' ? Colors.black : Colors.transparent,
        borderRadius: BorderRadius.circular(isWide ? 4 : 40),
        border: Border.all(color: context.primary, width: 1),
      ),
      child: InkWell(
        onTap: () => onPressed(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  image,
                  width: 40,
                ),
              ),
              if (isWide) ...[
                gap8,
                Text(
                  'Continue with $provider',
                  style: context.bodyLarge.bold.copyWith(
                    color: Colors.white,
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
