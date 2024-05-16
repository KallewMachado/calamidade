import 'package:flutter/material.dart';

class SplashPageAnimation extends StatefulWidget {
  const SplashPageAnimation({
    super.key,
    required this.onAnimationCompleted,
  });

  final Function onAnimationCompleted;

  @override
  State<SplashPageAnimation> createState() => _SplashPageAnimation();
}

class _SplashPageAnimation extends State<SplashPageAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  static const duration = Duration(milliseconds: 2000);
  static const initialOpacity = 0.0;
  static const finalOpacity = 1.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: duration)
      ..forward()
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.onAnimationCompleted();
        }
      });
    _animation =
        Tween<double>(begin: initialOpacity, end: finalOpacity).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.linearToEaseOut,
          ),
        );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Opacity(
          opacity: _animation.value,
          child: Center(
            child: Image.asset('assets/splash/logo_splash.png'),
          ),
        );
      },
    );
  }
}