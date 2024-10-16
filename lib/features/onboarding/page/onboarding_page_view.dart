import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/onboarding/bloc/onboarding_event.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/onboarding/bloc/onboarding_state.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/onboarding/models/onboarding_models.dart';

class OnboardingView extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (_) => OnboardingBloc(),
      child: Scaffold(
        body: BlocBuilder<OnboardingBloc, OnboardingState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      context.read<OnboardingBloc>().add(NextSlideEvent(index));
                    },
                    itemCount: onboardingSlides.length,
                    itemBuilder: (context, index) {
                      return OnboardingSlide(
                        index: index,
                        pageController: _pageController,
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                      );
                    },
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(onboardingSlides.length, (index) {
                    return DotIndicator(
                      isActive: index == state.currentIndex,
                      width: index == state.currentIndex ? 40 : 8,
                    );
                  }),
                ),
                SizedBox(height: screenHeight * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          context.goNamed('login_page');
                        },
                        child: Text(
                          "Skip",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (state.currentIndex < onboardingSlides.length - 1) {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                            context.read<OnboardingBloc>().add(NextSlideEvent(state.currentIndex + 1));
                          } else {
                            context.goNamed('login_page');
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(screenWidth * 0.03),
                          decoration: BoxDecoration(
                            color: Color(0xFF62C0A1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: screenWidth * 0.06,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
              ],
            );
          },
        ),
      ),
    );
  }
}

class OnboardingSlide extends StatelessWidget {
  final int index;
  final double screenHeight;
  final double screenWidth;

  const OnboardingSlide({
    Key? key,
    required this.index,
    required PageController pageController,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final slide = onboardingSlides[index];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: screenWidth * 0.6,
            maxHeight: screenHeight * 0.2,
          ),
          child: Image.asset(
            slide.imagePath,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        Text(
          slide.title,
          style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
        ),
        SizedBox(height: screenHeight * 0.01),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
          child: Text(
            slide.description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: screenWidth * 0.04, color: Color(0xFF666666)),
          ),
        ),
      ],
    );
  }
}


class DotIndicator extends StatelessWidget {
  final bool isActive;
  final double width;

  const DotIndicator({Key? key, required this.isActive, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? width : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFF767676) : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
