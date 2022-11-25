
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../components/primary_button.dart';
import '../../components/onboarding_header.dart';
import '../../components/navigation_button.dart';
import '../../components/onboarding_subheader.dart';

import '/screens/sign_in/sign_in_screen.dart';
import '/screens/sign_up/sign_up_selection_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  State<SignUpScreen> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const NavigationButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const OnboardingHeader(heading: "Sign Up"),
            OnboardingSubheader(
              subHeading: "or ",
              tail: TextSpan(
                  text: "login to your account",
                  style: const TextStyle(
                    color: Color(0xffC73B27),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.3,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInScreen()),
                      );
                    }),
            ),
            const Expanded(child: SizedBox()),
            SafeArea(
              bottom: true,
              child: Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    // email button
                    Padding(
                        padding: const EdgeInsets.only(top: 358),
                        child: Row(
                          children: [
                            PrimaryButton(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          SignUpSelectionScreen(),
                                    ),
                                  );
                                },
                                text: "Use phone number or email",
                                buttonColor: const Color(0xffC73B27),
                                textColor: Colors.white),
                          ],
                        )),
                    //google button
                    Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            PrimaryButton(
                                onTap: () {},
                                text: "Sign up with Google",
                                buttonColor: const Color(0xff4286F5),
                                textColor: Colors.white),
                          ],
                        )),
                    // apple button
                    Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            PrimaryButton(
                                onTap: () {},
                                text: "Sign up with Apple",
                                buttonColor: const Color(0xff020202),
                                textColor: Colors.white),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
