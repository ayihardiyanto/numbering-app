import 'package:flutter/material.dart';

class ButtonGroup extends StatelessWidget {
  final List<Function> onTaps;
  const ButtonGroup({Key? key, required this.onTaps}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: List.generate(
        onTaps.length,
        (index) => OutlinedButton(
          // style: ButtonStyle(backgroundColor:MaterialStateColor()),
          onPressed: () => onTaps.elementAt(index)(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              (index + 1).toString(),
            ),
          ),
        ),
      ),
    );
  }
}
