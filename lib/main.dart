import 'package:flutter/material.dart';
import 'package:learn_2_work/core/theme/app_theme.dart';
import 'package:learn_2_work/features/home/home_view.dart';
import 'package:learn_2_work/features/onboarding/views/onboarding_view.dart';
import 'package:learn_2_work/features/splash/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (_) => const SplashView(),
        OnboardingView.routeName: (_) => const OnboardingView(),
        HomeView.routeName: (_) => const HomeView(),
      },
    );
  }
}
