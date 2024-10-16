import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/themes/colors.dart';
import '../../../home/presentation/page/home_page_view.dart';
import '../../../profile_user/page/profile_view.dart';
import '../bloc/navbar_bloc.dart';

List<Widget> _bodyItems = [const HomePageView(), ProfilePage()];

class NavbarView extends StatelessWidget {
  const NavbarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavbarBloc(),
      child: BlocBuilder<NavbarBloc, NavbarState>(
        builder: (context, state) {
          return Scaffold(
            body: state is NavbarLoading
                ? const Center(child: CircularProgressIndicator())
                : _bodyItems[state.tabIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      AnimatedIndicator(
                        index: 0,
                        currentIndex: state.tabIndex,
                      ),
                      const SizedBox(height: 10),
                      SvgPicture.asset(
                        'assets/icons/home.svg',
                        colorFilter: state.tabIndex == 0
                            ? const ColorFilter.mode(
                                ColorsResources.primaryButton,
                                BlendMode.srcIn,
                              )
                            : const ColorFilter.mode(
                                Colors.grey,
                                BlendMode.srcIn,
                              ),
                        width: 26,
                        height: 26,
                      ),
                    ],
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      AnimatedIndicator(
                        index: 1,
                        currentIndex: state.tabIndex,
                      ),
                      const SizedBox(height: 10),
                      SvgPicture.asset(
                        'assets/icons/person.svg',
                        colorFilter: state.tabIndex == 1
                            ? const ColorFilter.mode(
                                ColorsResources.primaryButton,
                                BlendMode.srcIn,
                              )
                            : const ColorFilter.mode(
                                Colors.grey,
                                BlendMode.srcIn,
                              ),
                        width: 26,
                        height: 26,
                      ),
                    ],
                  ),
                  label: 'Profile',
                ),
              ],
              currentIndex: state.tabIndex,
              selectedLabelStyle: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelStyle: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
              selectedItemColor: ColorsResources.primaryButton,
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.white,
              elevation: 0,
              iconSize: 24,
              onTap: (index) => BlocProvider.of<NavbarBloc>(context)
                  .add(ChangeTabEvent(index)),
              type: BottomNavigationBarType.fixed,
            ),
          );
        },
      ),
    );
  }
}

class AnimatedIndicator extends StatelessWidget {
  const AnimatedIndicator({
    super.key,
    required this.index,
    required this.currentIndex,
  });

  final int index;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: currentIndex == index ? 20 : 0,
      height: 2,
      margin: const EdgeInsets.only(top: 4),
      decoration: BoxDecoration(
        color: ColorsResources.primaryButton,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
