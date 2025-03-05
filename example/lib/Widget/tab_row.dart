import 'package:flutter/material.dart';

class TabUtil {
  static Widget myTab({
    required String text,
    required int count,
    required bool isSelected,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(text), // Use the passed text
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.red
                : Colors.grey[300], // Badge color change
            shape: BoxShape.circle,
          ),
          constraints: const BoxConstraints(
            minWidth: 16,
            minHeight: 16,
          ),
          child: Center(
            child: Text(
              count.toString(), // Convert num to string
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
