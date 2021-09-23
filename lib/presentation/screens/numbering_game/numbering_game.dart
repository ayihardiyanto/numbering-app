import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numbering_app/presentation/widgets/widgets.dart';

class NumberingScreen extends StatefulWidget {
  const NumberingScreen({Key? key}) : super(key: key);

  @override
  State<NumberingScreen> createState() => _NumberingScreenState();
}

class _NumberingScreenState extends State<NumberingScreen> {
  late TextEditingController controller;
  List<String> results = List.generate(14, (index) => index.toString());

  @override
  void initState() {
    controller = TextEditingController()
      ..addListener(() {
        if (controller.text.isEmpty) {
          setState(() {
            results = List.generate(14, (index) => index.toString());
          });
        }
      });
    controller.clear();
    super.initState();
  }

  int get _iterator => int.parse(controller.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Numbering Game',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: controller,
                  decoration:
                      const InputDecoration(hintText: 'Type the value of N'),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number),
            ),
            const SizedBox(
              height: 10,
            ),
            if (results.isNotEmpty)
              ButtonGroup(onTaps: [
                () {
                  setState(() {
                    results = List.generate(
                        _iterator, (index) => (index + 1).toString());
                  });
                },
                () {
                  List<String> ascendingResult = List.generate(
                      _iterator, (index) => (index + 1).toString());
                  List<String> descendingResult = ascendingResult
                      .where((element) => element != ascendingResult.last)
                      .toList()
                      .reversed
                      .toList();
                  setState(() {
                    results = ascendingResult + descendingResult;
                  });
                },
                () {
                  List<String> firstDigitList = List.generate(
                      _iterator, (index) => (index + 1).toString());
                  List<String> addedSecondDigitList = firstDigitList
                      .asMap()
                      .map((index, number) =>
                          MapEntry(index, number + index.toString()))
                      .values
                      .toList();
                  setState(() {
                    results = addedSecondDigitList;
                  });
                },
                () {
                  List<String> mainList = List.generate(
                      _iterator, (index) => (index + 1).toString());

                  setState(() {
                    results = mainList.map((element) {
                      if (int.parse(element) % 5 == 0) {
                        return 'LIMA';
                      }
                      if (int.parse(element) % 7 == 0) {
                        return 'TUJUH';
                      }
                      return element;
                    }).toList();
                  });
                },
              ]),
            const SizedBox(height: 50),
            ResultBox(results: results),
          ],
        ),
      ),
    );
  }
}
