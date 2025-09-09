// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AppColors {
  static const pink = Color(0xFFFF6C8D);
  static const pinkDark = Color(0xFFFE4D6D);
  static const bg = Color(0xFFF4F6F8);
  static const card = Colors.white;
  static const text = Color(0xFF1E1E1E);
  static const subtext = Color(0xFF8A8D93);
  static const stroke = Color(0xFFE6E8EB);
}

class AppTheme {
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.bg,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.pink),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
          fontWeight: FontWeight.w600, fontSize: 16, color: AppColors.text),
      bodyMedium: TextStyle(fontSize: 14, color: AppColors.text),
      bodySmall: TextStyle(fontSize: 12, color: AppColors.subtext),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.card,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.stroke),
        borderRadius: BorderRadius.circular(16),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.pink),
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  );
}

class G {
  static BorderRadius get r24 => BorderRadius.circular(24);
  static BorderRadius get r20 => BorderRadius.circular(20);
  static BorderRadius get r16 => BorderRadius.circular(16);
  static const double pad = 16;
}

class PinkButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const PinkButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: G.r24,
        gradient:
            const LinearGradient(colors: [AppColors.pink, AppColors.pinkDark]),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: G.r24,
          onTap: onPressed,
          child: Center(
            child: Text(text,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600)),
          ),
        ),
      ),
    );
  }
}

class CapsuleTabBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onChanged;
  const CapsuleTabBar(
      {super.key, required this.index, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
              color: Colors.black12.withOpacity(.03),
              blurRadius: 10,
              offset: const Offset(0, 4))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _item(Icons.explore, 'Explore', 0),
          _item(Icons.favorite_border, 'Liked', 1),
          _item(Icons.person_outline, 'Account', 2),
        ],
      ),
    );
  }

  Widget _item(IconData icon, String label, int i) {
    final selected = i == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => onChanged(i),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          decoration: BoxDecoration(
            color:
                selected ? AppColors.pink.withOpacity(.12) : Colors.transparent,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,
                  size: 20,
                  color: selected ? AppColors.pinkDark : AppColors.subtext),
              const SizedBox(width: 6),
              Text(label,
                  style: TextStyle(
                      color: selected ? AppColors.pinkDark : AppColors.subtext,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}

class CardTile extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  const CardTile({super.key, required this.child, this.padding});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: G.r20,
        border: Border.all(color: AppColors.stroke),
      ),
      child: child,
    );
  }
}
