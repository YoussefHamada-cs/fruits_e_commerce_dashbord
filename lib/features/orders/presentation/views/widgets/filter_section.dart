import 'package:flutter/material.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Row(
        children: [
          SizedBox(width: 20),
          Icon(Icons.filter),
          SizedBox(width: 10),
          Text('Filter', style: const TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}
