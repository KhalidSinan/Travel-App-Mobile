import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';

class DropSelectClass extends StatefulWidget {
  const DropSelectClass({super.key});

  @override
  State<DropSelectClass> createState() => _DropState();
}

class _DropState extends State<DropSelectClass> {
  String? selectedclass;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              'class',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(radius)),
              child: SizedBox(
                width: 170,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: DropdownButtonFormField(
                    // hint: const Text('select class'),
                    items: ["First", "Economy", "Vip"]
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    validator: (value) =>
                        value == null ? 'field required' : null,
                    onChanged: (val) {
                      setState(() {
                        selectedclass = val;
                        print(selectedclass);
                      });
                    },
                    value: selectedclass,
                  ),
                ),
              ))
        ]));
  }
}
