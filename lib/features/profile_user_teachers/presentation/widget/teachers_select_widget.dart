import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeachersSelectWidget extends StatelessWidget {
  TeachersSelectWidget({super.key});

  final List<String> _itemData = [
    'Ganti Password',
    'About',
    'Kebijakan Privasi',
  ];

  final List<IconData> _itemRoute = [
    Icons.settings_rounded,
    Icons.info_rounded,
    Icons.privacy_tip_rounded
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
              Divider(color: Colors.grey[300], thickness: 1, height: 1),
              const SizedBox(height: 15),
              _buildItemListView(
                _itemRoute[index],
                _itemData[index],
                _itemData[index],
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget _buildItemListView(IconData icon, String title, String route) {
  return GestureDetector(
    onTap: () {},
    child: Row(
      children: [
        Icon(
          icon,
          size: 24,
          color: Colors.black87,
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.grey[800],
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.arrow_forward_ios_sharp,
          size: 18,
          color: Colors.black54,
        ),
      ],
    ),
  );
}
