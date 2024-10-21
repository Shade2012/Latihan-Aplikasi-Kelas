import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/themes/colors.dart';
import '../bloc/home_page_bloc.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  Widget _buildItem(
      BuildContext context, String name, int index, int selectedIndex) {
    return Expanded(
      child: GestureDetector(
        onTap: () => context.read<HomePageBloc>().add(GetScheduleEvent(index)),
        child: Container(
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: selectedIndex == index
                ? ColorsResources.primaryButton
                : Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              width: selectedIndex == index ? 0 : 1.5,
              color: Colors.grey[300]!,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: Center(
              child: FittedBox(
                child: Text(
                  name,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: selectedIndex == index ? Colors.white : Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        final selectedIndex =
            state is HomePageLoaded ? state.selectedIndex : -1;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildItem(context, 'Sen', 0, selectedIndex),
            _buildItem(context, 'Sel', 1, selectedIndex),
            _buildItem(context, 'Rab', 2, selectedIndex),
            _buildItem(context, 'Kam', 3, selectedIndex),
            _buildItem(context, 'Jum', 4, selectedIndex),
            _buildItem(context, 'Sab', 5, selectedIndex),
          ],
        );
      },
    );
  }
}
