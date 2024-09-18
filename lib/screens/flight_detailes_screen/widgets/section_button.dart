import 'package:flutter/material.dart';

class SectionButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isSelected;

  const SectionButton({
    required this.title,
    required this.icon,
    required this.onPressed,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected
                ? const Color.fromARGB(255, 223, 223, 223)
                : Colors.blue,
          ),
          child: IconButton(
            icon: Icon(icon,
                color: !isSelected
                    ? const Color.fromARGB(255, 223, 223, 223)
                    : Colors.blue),
            onPressed: onPressed,
            iconSize: 70,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
