import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/model/login view/login view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _imageController;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

  late AnimationController _textController;
  late Animation<double> _textOpacity;

  @override
  void initState() {
    super.initState();

    _imageController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _imageController, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(parent: _imageController, curve: Curves.easeOut),
    );

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _textOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeInOut),
    );

    _imageController.forward();
    Future.delayed(const Duration(seconds: 1), () => _textController.forward());

    Timer(const Duration(seconds: 6), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 800),
          pageBuilder: (context, animation, secondaryAnimation) =>
          const LoginView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 1.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    _imageController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الخلفية
          AnimatedBuilder(
            animation: _imageController,
            builder: (context, child) {
              return Opacity(
                opacity: _opacityAnimation.value,
                child: Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF8292BB),
                    ),
                  ),
                ),
              );
            },
          ),

          // النصوص المتحركة - وسط الصفحة تمامًا
          Center(
            child: FadeTransition(
              opacity: _textOpacity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Welcome 👋',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.black45,
                          offset: Offset(1, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  AnimatedTextKit(
                    isRepeatingAnimation: false,
                    totalRepeatCount: 1,
                    animatedTexts: [
                      TyperAnimatedText(
                        'SIS',
                        textStyle: const TextStyle(
                          fontSize: 60.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        speed: Duration(milliseconds: 120),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  AnimatedTextKit(
                    isRepeatingAnimation: false,
                    totalRepeatCount: 1,
                    animatedTexts: [
                      TyperAnimatedText(
                        'Student Information System',
                        textStyle: const TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        speed: Duration(milliseconds: 80),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
