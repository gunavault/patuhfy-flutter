import 'package:flutter/material.dart';
import 'package:patuhfy/utils/common_colors.dart';

class FilterMenutaskSheet extends StatelessWidget {
  const FilterMenutaskSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
          color: Colors.grey[100]!,
          width: 1.0,
        )),
      ),
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 5),
      height: kToolbarHeight,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          FilterChip(
            label: const Text('Kelapa Sawit'),
            labelStyle:
                const TextStyle(color: true ? Colors.white : Colors.black),
            selected: true,
            onSelected: (bool selected) {
              // refreshData();
              // setState(() {
              //   _isNewComers = !_isNewComers;
              // });
            },
            elevation: 0,
            pressElevation: 0,
            backgroundColor: Colors.grey[200],
            selectedColor: CommonColors.containerTextB,
            checkmarkColor: Colors.white,
          ),
          const SizedBox(width: 12),
          FilterChip(
            label: const Text('Karet'),
            labelStyle:
                const TextStyle(color: false ? Colors.white : Colors.black),
            selected: false,
            onSelected: (bool selected) {},
            elevation: 0,
            pressElevation: 0,
            backgroundColor: Colors.grey[200],
            selectedColor: CommonColors.containerTextB,
            checkmarkColor: Colors.white,
          ),
          const SizedBox(width: 12),
          FilterChip(
            label: const Text('Tebu'),
            labelStyle:
                const TextStyle(color: false ? Colors.white : Colors.black),
            selected: false,
            onSelected: (bool selected) {},
            elevation: 0,
            pressElevation: 0,
            backgroundColor: Colors.grey[200],
            selectedColor: CommonColors.containerTextB,
            checkmarkColor: Colors.white,
          ),
          const SizedBox(width: 12),
          FilterChip(
            label: const Text('Teh'),
            labelStyle:
                const TextStyle(color: false ? Colors.white : Colors.black),
            selected: false,
            onSelected: (bool selected) {},
            elevation: 0,
            pressElevation: 0,
            backgroundColor: Colors.grey[200],
            selectedColor: CommonColors.containerTextB,
            checkmarkColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
