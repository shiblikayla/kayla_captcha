library kayla_captcha;

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kayla_captcha/primary_button.dart';
import 'package:kayla_captcha/primary_textfield.dart';

class KaylaCaptcha extends StatefulWidget {
  final Function(bool value) onSubmit;
  final Color themeColor;
  final double? width;
  const KaylaCaptcha(
      {super.key,
      required this.onSubmit,
      required this.themeColor,
      this.width});

  @override
  State<KaylaCaptcha> createState() => _KaylaCaptchaState();
}

class _KaylaCaptchaState extends State<KaylaCaptcha> {
  String captchaText = generateRandomString(6);
  final _formKey = GlobalKey<FormState>();

  TextEditingController valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Captcha Verification",
              style: TextStyle(
                  color: widget.themeColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 50,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        'packages/kayla_captcha/lib/images/grungy-watercolor-texture-on-grey-paper-with-splatter-background-photo.jpeg',
                      ))),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: captchaText
                      .split('')
                      .map((letter) => Padding(
                            padding: const EdgeInsets.only(right: 3),
                            child: Text(
                              letter,
                              style: TextStyle(
                                  fontSize: 36,
                                  fontFamily: getRandomFontFamily()),
                            ),
                          ))
                      .toList()),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: PrimaryTextfield(
                    themeColor: widget.themeColor,
                    validator: (value) {
                      if (value != captchaText) {
                        return "Incorrect captcha";
                      }
                      return null;
                    },
                    controller: valueController,
                    isfilled: false,
                    filledColor: widget.themeColor,
                    onUserInteraction: false,
                    hintText: "Enter captcha here",
                  ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        captchaText = generateRandomString(6);
                      });
                    },
                    icon: Icon(
                      Icons.restart_alt_outlined,
                      color: widget.themeColor,
                    ))
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    onTap: () {
                      _formKey.currentState?.validate();
                      widget.onSubmit(valueController.text == captchaText);
                      // widget.onSubmit(true);
                    },
                    buttonPadding: const EdgeInsets.symmetric(vertical: 8),
                    borderRadius: 8,
                    buttonColor: widget.themeColor,
                    buttonText: const Text(
                      'Verify',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

String? getRandomFontFamily() {
  Random random = Random();

  List<String?> fontFamilies = [
    "MooLahLah",
    // "QwitcherGrypen",
    "DMSans",
    // "ReenieBeanie",
    "RubikBeastly",
    "SixtyfourConvergence"
  ];

  return fontFamilies[random.nextInt(3)];
}

String generateRandomString(int length) {
  const characters =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  Random random = Random();

  return String.fromCharCodes(Iterable.generate(
      length, (_) => characters.codeUnitAt(random.nextInt(characters.length))));
}
