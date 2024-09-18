import 'package:flutter/material.dart';

class DateCard extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const DateCard({
    required this.title,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0,
        color: isSelected ? const Color(0xffE9E9F0) : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          side: BorderSide(
              color: isSelected
                  ? const Color(0xff191966)
                  : Colors.grey[200] ?? Colors.grey,
              width: 2), // This removes the border
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
