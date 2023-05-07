import 'package:flutter/material.dart';
import 'package:nomtok/constants/Sizes.dart';
import 'package:nomtok/constants/gaps.dart';
import 'package:nomtok/features/auth/widgets/form_button.dart';
import 'package:nomtok/features/onboarding/interest_screen.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Map<String, String> fromData = {};

  void _onSubmitTap() {
    // .validate() 모든 필드에서 에러가 없다면 true 아니면 false를 반환
    // 조건문 통해서 확인하기
    if (_formkey.currentState != null) {
      if (_formkey.currentState!.validate()) {
        // .save()를 실행하면 onSaved 콜백이 실행되면서 각 필드의 onSaved: (newValue)에
        // 값이 저장된다. 콜백함수를 이용하여 다른 작업을 할 수 있다.
        _formkey.currentState!.save();
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const InterestsScreen(),
          ),
          // 이전 라우트를 유지할지 안할지 결정하는 함수
          (route) {
            return false;
          },
        );
      }
    }
    // 다트 문법 이용해서 확인하기
    // _formkey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log in"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
        child: Form(
          // GlobalKey 필요한 이유는 폼의 식별자역할을 하고 상태와 메소드에 접근할 때 사용하기 위해서이다.
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                onSaved: (newValue) {
                  if (newValue != null) {
                    fromData['email'] = newValue;
                  }
                },
                decoration: InputDecoration(
                  hintText: "Email",
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
                // validator 유효성 검사를 한 후 에러메세지(문자열)를 반환해 준다.
                // 문자열을 반환 할수도 안할 수도 있다.
                validator: (value) {
                  if (value == "") {
                    return "write Something";
                  }
                  return null;
                },
              ),
              Gaps.v16,
              TextFormField(
                // newValue 마지막으로 폼에 작성되어 저장된 값
                onSaved: (newValue) {
                  if (newValue != null) {
                    fromData['password'] = newValue;
                  }
                },
                decoration: InputDecoration(
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

                validator: (value) {
                  return null;
                },
              ),
              Gaps.v32,
              GestureDetector(
                  onTap: _onSubmitTap, child: const FormButton(disabled: false))
            ],
          ),
        ),
      ),
    );
  }
}
