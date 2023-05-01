import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomtok/constants/Sizes.dart';
import 'package:nomtok/constants/gaps.dart';
import 'package:nomtok/features/auth/birthday_screen.dart';
import 'package:nomtok/features/auth/widgets/form_button.dart';

class PaswordScreen extends StatefulWidget {
  const PaswordScreen({super.key});

  @override
  State<PaswordScreen> createState() => _PasswordState();
}

class _PasswordState extends State<PaswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  String _password = "";
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

/* 사용된 정규 표현식 규칙
 1. It must be longer than 8 alphanumeric characters
2. It must include both alphabet and numbers
3. It must include at least one special character
*/
  bool _ispasswordValid() {
    if (_password.isEmpty) return false;
    final regExp = RegExp("");
    // r"^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[@$!%*#?&\^])[A-Za-z0-9@$!%*#?&\^]{9,}$");
    if (!regExp.hasMatch(_password)) {
      return false;
    }
    return true;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onClearTap() {
    _passwordController.clear();
  }

  void _toggleObscureText() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  void _onSubmit() {
    if (!_ispasswordValid()) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BirthdayScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "sign Up",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              const Text(
                "make your password",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v10,
              TextField(
                controller: _passwordController,
                obscureText: _obscureText,
                onEditingComplete: _onSubmit,
                autocorrect: false,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _onClearTap,
                        child: FaIcon(
                          FontAwesomeIcons.circleXmark,
                          color: Colors.grey.shade400,
                          size: Sizes.size16,
                        ),
                      ),
                      Gaps.h16,
                      GestureDetector(
                        onTap: _toggleObscureText,
                        child: FaIcon(
                          _obscureText
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          color: Colors.grey.shade400,
                          size: Sizes.size16,
                        ),
                      ),
                    ],
                  ),
                  hintText: "password",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              Gaps.v8,
              Text(
                "your password must have:",
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w100,
                ),
              ),
              Gaps.v10,
              Row(
                children: [
                  FaIcon(
                    _ispasswordValid()
                        ? FontAwesomeIcons.circleCheck
                        : FontAwesomeIcons.circleXmark,
                    size: Sizes.size14,
                    color: _ispasswordValid() ? Colors.green : Colors.red,
                  ),
                  Gaps.h7,
                  Text(
                    "1. use more than 8 alphanumeric characters",
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: Sizes.size12,
                    ),
                  ),
                  // Text(
                  //   "2. It must include both alphabet and numbers",
                  //   style: TextStyle(
                  //     color: Colors.grey.shade400,
                  //     fontSize: Sizes.size16,
                  //     fontWeight: FontWeight.w100,
                  //   ),
                  // ),
                  // Text(
                  //   "3. It must include at least one special character",
                  //   style: TextStyle(
                  //     color: Colors.grey.shade400,
                  //     fontSize: Sizes.size16,
                  //     fontWeight: FontWeight.w100,
                  //   ),
                  // ),
                ],
              ),
              Gaps.v16,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(disabled: !_ispasswordValid()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
