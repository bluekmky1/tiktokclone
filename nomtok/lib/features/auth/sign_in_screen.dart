import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomtok/constants/gaps.dart';
import 'package:nomtok/constants/Sizes.dart';
import 'package:nomtok/features/auth/login_form_screen.dart';
import 'package:nomtok/features/auth/widgets/auth_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  void onSignupTap(BuildContext context) {
    /*
     .push를 사용하게 되면 화면 위에 다른 화면을 쌓는것과 같은 효과를 가져온다.
     따라서 .pop 과 같은 다른 행동을 곁들여서 사용하자 
     .pop은 최상단의 스택을 빼주는 행동이다. 뒤로가기 행동이라고 이해하자
    */
    Navigator.of(context).pop();
  }

  void _onLoginTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginFormScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea는 앱에서 맨 위 상태줄 빼고부터 시작되게 해준다.
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Gaps.v80,
              const Text(
                "Log in to tiktok",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v20,
              const Text(
                "Log in to Tiktok",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v32,
              GestureDetector(
                onTap: () => _onLoginTap(context),
                child: const AuthButton(
                    icon: FaIcon(FontAwesomeIcons.user),
                    text: "Use Phone or Email"),
              ),
              Gaps.v12,
              const AuthButton(
                  icon: FaIcon(FontAwesomeIcons.apple),
                  text: "Continue with apple"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade100,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.size32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("don't have an accounts"),
              Gaps.h5,
              GestureDetector(
                onTap: () => onSignupTap(context),
                child: Text(
                  "sign up",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
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
