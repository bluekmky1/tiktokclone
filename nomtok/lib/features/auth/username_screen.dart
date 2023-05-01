import 'package:flutter/material.dart';
import 'package:nomtok/constants/Sizes.dart';
import 'package:nomtok/constants/gaps.dart';
import 'package:nomtok/features/auth/email_screen.dart';
import 'package:nomtok/features/auth/widgets/form_button.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({super.key});

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  final TextEditingController _usernameController = TextEditingController();
  String _username = "";

// 앱의 메모리를 절약하기 위해서 수동으로 컨트롤러를 dispose 해주는 작업이 필요함
  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() {
      setState(() {
        _username = _usernameController.text;
      });
    });
  }

/*
 dispose() 함수
 이 개체가 트리에서 영구적으로 제거될 때 호출됩니다.
 마무리로 super.dispose()를 항상 포함해 줘야한다.

*/
  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

// stateful 위젯 안에서는 context를 어디서든 사용할 수 있다.
  void _onNextTap() {
    if (_username.isEmpty) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const EmailScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "Create username",
              style: TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v12,
            const Text(
              "Create username",
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w700,
                color: Colors.black54,
              ),
            ),
            Gaps.v10,
            TextField(
              controller: _usernameController,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                hintText: "Username",
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
            Gaps.v16,
            GestureDetector(
              child: FormButton(disabled: _username.isEmpty),
              onTap: () => _onNextTap(),
            ),
          ],
        ),
      ),
    );
  }
}
