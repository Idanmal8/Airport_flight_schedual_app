import 'package:flutter/material.dart';

class FontSizeButtons extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const FontSizeButtons({
    required this.onTap,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0,
        color: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          side: BorderSide(
              color: Color(0xff191966), width: 2), // This removes the border
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
          child: SizedBox(
            width: 10,
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
