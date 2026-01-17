import 'package:flutter/material.dart';
import 'package:learn_2_work/features/onboarding/views/onboarding_view.dart';
import '../../core/constants/app_constants.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const routeName = '/';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(AppDurations.splash, () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, OnboardingView.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final cornerW = size.width * 0.65;
    final cornerH = size.height * 0.22;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: _Cornerimg(
                asset: AppAssets.topCorner,
                width: cornerW,
                height: cornerH,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: _Cornerimg(
                asset: AppAssets.bottomCorner,
                width: cornerW,
                height: cornerH,
              ),
            ),
            Center(
              child: TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 650),
                tween: Tween(begin: 0.85, end: 1),
                curve: Curves.easeOutBack,
                builder: (context, v, child) => Transform.scale(
                  scale: v,
                  child: Opacity(opacity: v.clamp(0.0, 1.0), child: child),
                ),
                child: Image.asset(
                  AppAssets.logo,
                  width: size.width * 0.55,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Cornerimg extends StatelessWidget {
  const _Cornerimg({
    required this.asset,
    required this.width,
    required this.height,
  });

  final String asset;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Image.asset(
        asset,
        width: width,
        height: height,
        fit: BoxFit.contain,
      ),
    );
  }
}
