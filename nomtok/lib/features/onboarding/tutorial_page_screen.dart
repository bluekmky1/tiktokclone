import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nomtok/constants/gaps.dart';
import 'package:nomtok/constants/sizes.dart';
import 'package:nomtok/features/navigation/main_navigation_screen.dart';

enum Direction { left, right }

enum Page { firstPage, secondPage }

class TutorialPageScreen extends StatefulWidget {
  const TutorialPageScreen({super.key});

  @override
  State<TutorialPageScreen> createState() => _TutorialPageScreenState();
}

class _TutorialPageScreenState extends State<TutorialPageScreen> {
  Direction _direction = Direction.right;
  Page _showingPage = Page.firstPage;

  void _onEnterAppTap() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const MainNavigationScren(),
      ),
      (route) => false,
    );
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      // to the right
      setState(() {
        _direction = Direction.right;
      });
    } else {
      setState(() {
        _direction = Direction.left;
      });
    }
  }

  void _onPanEnd(DragEndDetails details) {
    if (_direction == Direction.left) {
      setState(() {
        _showingPage = Page.secondPage;
      });
    } else {
      setState(() {
        _showingPage = Page.firstPage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
            child: AnimatedCrossFade(
                firstChild: Column(
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
                secondChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Gaps.v32,
                    Text(
                      "follow the rules!",
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
                crossFadeState: _showingPage == Page.firstPage
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 300)),
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 0,
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size16,
              horizontal: Sizes.size24,
            ),
            child: AnimatedOpacity(
              opacity: _showingPage == Page.firstPage ? 0 : 1,
              duration: const Duration(milliseconds: 300),
              child: CupertinoButton(
                color: Theme.of(context).primaryColor,
                onPressed: _onEnterAppTap,
                child: const Text("Enter the app!"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
