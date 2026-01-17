import 'package:flutter/material.dart';
import 'package:learn_2_work/features/onboarding/widgets/onboarding_page.dart';
import '../../../core/constants/app_constants.dart';
import '../../home/home_view.dart';
import '../models/onboarding_model.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});
  static const routeName = '/onboarding';

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final PageController _controller;
  int _index = 0;

  final List<OnboardingModel> _pages = const [
    OnboardingModel(
      title: 'Welcome to Learn 2 Work',
      subtitle:
          'Embark on your journey from learning to gaining\nreal-world skills.',
      illustrationAsset: AppAssets.onb1,
      buttonText: 'Next',
    ),
    OnboardingModel(
      title: 'Earn Rewards & Level Up',
      subtitle:
          'Complete lessons to earn coins, unlock exclusive\ncontent, and climb the leaderboard.',
      illustrationAsset: AppAssets.onb2,
      buttonText: 'Next',
    ),
    OnboardingModel(
      title: 'Quick & Easy Learning',
      subtitle:
          'Unlock practical lessons carefully designed to\nhelp you succeed in the real world.',
      illustrationAsset: AppAssets.onb3,
      buttonText: 'Get Started',
    ),
  ];

  bool get _isLast => _index == _pages.length - 1;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _goHome() => Navigator.pushReplacementNamed(context, HomeView.routeName);

  void _next() {
    if (!_isLast) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOut,
      );
    } else {
      _goHome();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.06,
                vertical: 8,
              ),
              child: Row(
                children: [
                  const Spacer(),
                  if (!_isLast)
                    GestureDetector(
                      onTap: _goHome,
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                ],
              ),
            ),

            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: (i) => setState(() => _index = i),
                itemBuilder: (context, i) {
                  final p = _pages[i];
                  return OnboardingPage(
                    title: p.title,
                    subtitle: p.subtitle,
                    illustrationAsset: p.illustrationAsset,
                    length: _pages.length,
                    index: _index,
                  );
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(
                size.width * 0.08,
                0,
                size.width * 0.08,
                size.height * 0.035,
              ),
              child: Column(
                children: [

                  const SizedBox(height: 8),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _next,
                      child: Text(_pages[_index].buttonText),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
