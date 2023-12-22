import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patuhfy/blocs/pelaporan_kerusakan_alat/pelaporan_kerusakan_alat_list/pelaporan_kerusakan_alat_list_cubit.dart';
import 'package:patuhfy/utils/common_colors.dart';

class FilterMenuKerusakanAlat extends StatefulWidget {
  const FilterMenuKerusakanAlat({super.key});

  @override
  State<FilterMenuKerusakanAlat> createState() =>
      _FilterMenuKerusakanAlatState();
}

class _FilterMenuKerusakanAlatState extends State<FilterMenuKerusakanAlat> {
  bool _inProgress = true;
  bool _inDone = false;
  refreshData(){
    if (!_inProgress) {
      BlocProvider.of<PelaporanKerusakanAlatListCubit>(context).getData('OPEN');
    } else {
      BlocProvider.of<PelaporanKerusakanAlatListCubit>(context).getData('CLOSE');
    }
  }

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
            label: const Text('In Progress'),
            labelStyle:
                const TextStyle(color: false ? Colors.white : Colors.black),
            selected: _inProgress,
            onSelected: (bool selected) {
              refreshData();
              setState(() {
                _inProgress = true;
                _inDone = false;
              });
            },
            elevation: 0,
            pressElevation: 0,
            backgroundColor: Colors.grey[200],
            selectedColor: CommonColors.containerTextB,
            checkmarkColor: Colors.white,
          ),
          const SizedBox(width: 12),
          FilterChip(
            label: const Text('Done'),
            labelStyle:
                const TextStyle(color: false ? Colors.white : Colors.black),
            selected: _inDone,
            onSelected: (bool selected) {
              refreshData();
              setState(() {
                _inProgress = false;
                _inDone = true;
              });
            },
            elevation: 0,
            pressElevation: 0,
            backgroundColor: Colors.grey[200],
            selectedColor: CommonColors.containerTextB,
            checkmarkColor: Colors.white,
          ),
          // const SizedBox(width: 12),
          // FilterChip(
          //   label: const Text('Tebu'),
          //   labelStyle:
          //       const TextStyle(color: false ? Colors.white : Colors.black),
          //   selected: false,
          //   onSelected: (bool selected) {},
          //   elevation: 0,
          //   pressElevation: 0,
          //   backgroundColor: Colors.grey[200],
          //   selectedColor: CommonColors.containerTextB,
          //   checkmarkColor: Colors.white,
          // ),
          // const SizedBox(width: 12),
          // FilterChip(
          //   label: const Text('Teh'),
          //   labelStyle:
          //       const TextStyle(color: false ? Colors.white : Colors.black),
          //   selected: false,
          //   onSelected: (bool selected) {},
          //   elevation: 0,
          //   pressElevation: 0,
          //   backgroundColor: Colors.grey[200],
          //   selectedColor: CommonColors.containerTextB,
          //   checkmarkColor: Colors.white,
          // ),
        ],
      ),
    );
  }
}
