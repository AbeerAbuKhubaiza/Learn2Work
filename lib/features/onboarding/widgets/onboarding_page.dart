import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:learn_2_work/features/onboarding/widgets/onboarding_dots.dart';
import '../../../core/constants/app_constants.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({
    super.key,
    required this.title,
    required this.length,
    required this.index,
    required this.subtitle,
    required this.illustrationAsset,
  });

  final String title;
  final int length;
  final int index;

  final String subtitle;
  final String illustrationAsset;

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _floatCtrl;

  @override
  void initState() {
    super.initState();
    _floatCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _floatCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final imgH = size.height * 0.45; 

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.03),

          SizedBox(
            height: imgH,
            width: double.infinity,
            child: AnimatedBuilder(
              animation: _floatCtrl,
              builder: (context, child) {
                final t = _floatCtrl.value;
                final wave = math.sin(t * 2 * math.pi);
                return Transform.translate(
                  offset: Offset(0, -6 * wave),
                  child: child,
                );
              },
              child: TweenAnimationBuilder<double>(
                duration: AppDurations.pageAnim,
                tween: Tween(begin: 0.0, end: 1.0),
                curve: Curves.easeOut,
                builder: (context, v, child) {
                  final dy = (1 - v) * 18;
                  return Opacity(
                    opacity: v,
                    child: Transform.translate(
                      offset: Offset(0, dy),
                      child: child,
                    ),
                  );
                },
                child: Image.asset(
                  widget.illustrationAsset,
                  height: imgH,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          SizedBox(height: size.height * 0.015),
          OnboardingDots(count: widget.length, activeIndex: widget.index),

          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18.5,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            widget.subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13.5,
              height: 1.45,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
