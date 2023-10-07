import 'package:flutter/material.dart';

class RtlMenuWidget extends StatefulWidget {
  const RtlMenuWidget({super.key, required this.onChangeMenu});

  final Function onChangeMenu;

  @override
  State<RtlMenuWidget> createState() => _RtlMenuWidgetState();
}

enum RtlMenuState { OPEN, REJECT, DONE }

class _RtlMenuWidgetState extends State<RtlMenuWidget> {
  RtlMenuState menuRtlState = RtlMenuState.OPEN;

  @override
  void initState() {
    // TODO: implement initState
    widget.onChangeMenu(RtlMenuState.OPEN.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SegmentedButton<RtlMenuState>(
        segments: const <ButtonSegment<RtlMenuState>>[
          ButtonSegment<RtlMenuState>(
              value: RtlMenuState.OPEN,
              label: Text('Open'),
              icon: Icon(Icons.folder_open)),
          ButtonSegment<RtlMenuState>(
              value: RtlMenuState.REJECT,
              label: Text('Rejected'),
              icon: Icon(Icons.close)),
          ButtonSegment<RtlMenuState>(
              value: RtlMenuState.DONE,
              label: Text('Done'),
              icon: Icon(Icons.checklist)),
        ],
        selected: <RtlMenuState>{menuRtlState},
        onSelectionChanged: (Set<RtlMenuState> newSelection) {
          setState(() {
            print('newSelection ${newSelection.first.name}');
            widget.onChangeMenu(newSelection.first.name);
            menuRtlState = newSelection.first;
          });
        },
      ),
    );
  }
}
