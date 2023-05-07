import 'package:flutter/material.dart';
import 'package:nomtok/constants/Sizes.dart';
import 'package:nomtok/constants/gaps.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  @override
  Widget build(BuildContext context) {
    // TabBarView와 TabPageSelector가 DefaultTabController를 부모로 두고 있어야 함
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Gaps.v32,
                    Text(
                      "Watch cool videos!",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: Sizes.size32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gaps.v12,
                    Text(
                      "I don't see the Exception has occurred box on my screen. Can you tell me what setting I need to do to see it?",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: Sizes.size16,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Gaps.v32,
                    Text(
                      "Watch cool videos!!",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: Sizes.size32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gaps.v12,
                    Text(
                      "I don't see the Exception has occurred box on my screen. Can you tell me what setting I need to do to see it?",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: Sizes.size16,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Gaps.v32,
                    Text(
                      "Watch cool videos!!!",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: Sizes.size32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gaps.v12,
                    Text(
                      "I don't see the Exception has occurred box on my screen. Can you tell me what setting I need to do to see it?",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: Sizes.size16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size32,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabPageSelector(
                  selectedColor: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
