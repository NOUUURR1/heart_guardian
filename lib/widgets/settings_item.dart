import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const SettingsItem({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            Icon(icon, color: const Color(0XFF042D46)),
            const SizedBox(width: 16.0),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontFamily: 'Agbalumo', fontSize: 16.0),
              ),
            ),
            if (trailing != null)
              trailing!
            else if (title != 'Dark Mode')
              const Icon(Icons.arrow_forward_ios, color: Color(0XFF042D46)),
          ],
        ),
      ),
    );
  }
}
