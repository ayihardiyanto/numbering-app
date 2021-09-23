import 'package:flutter/material.dart';

class ResultBox extends StatelessWidget {
  final List<String>? results;
  const ResultBox({Key? key, this.results}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          style: BorderStyle.solid,
          color: Colors.lightBlue,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(5),
            child: const Text('Result'),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                  color: Colors.lightBlue,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          if (results != null)
            Wrap(
              children: List.generate(
                results!.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    results!.elementAt(index).toString(),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
