import 'package:bookly_app/Core/utils/assets.dart';
import 'package:bookly_app/Features/Home/Presentation/View/home_view.dart';
import 'package:bookly_app/Features/Splash/Presentation/View/Widgets/sliding_text.dart';
import 'package:bookly_app/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();
    initSlideAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SvgPicture.asset(
            height: 100,
            AssetsUse.logo,
          ),
        ),
        SlidingText(
          slideAnimation: slideAnimation,
          text: "Reading Free",
        ),
      ],
    );
  }

  void initSlideAnimation() {
    animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    slideAnimation = Tween<Offset>(begin: Offset(0, 12), end: Offset(0, 0))
        .animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 1), () {
      Get.to(() => const HomeView(),
          transition: Transition.fade, duration: kTransitionDuration);
    });
  }
}
