import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class TeachersSelectWidget extends StatelessWidget {
  TeachersSelectWidget({super.key});

  final List<Map<String, dynamic>> _items = [
    {
      'title': 'Ganti Password',
      'icon': Icons.settings_rounded,
      'route': '/change_password_teacher_page'
    },
    {
      'title': 'About',
      'icon': Icons.info_rounded,
      'route': '/about_page'
    },
    {
      'title': 'Kebijakan Privasi',
      'icon': Icons.privacy_tip_rounded,
      'route': '/privacy_policy_teachers_page'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            children: [
              Divider(color: Colors.grey[300], thickness: 1, height: 1),
              const SizedBox(height: 10),
              _buildItemListView(
                context: context,
                icon: _items[index]['icon'],
                title: _items[index]['title'],
                route: _items[index]['route'],
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget _buildItemListView({
  required BuildContext context,
  required IconData icon,
  required String title,
  required String route,
}) {
  return InkWell(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onTap: () => context.push(route),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
    ),
  );
}
