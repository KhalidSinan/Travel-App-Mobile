import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';

class SourceInfo extends StatelessWidget {
  const SourceInfo({
    super.key,
    required this.source,
  });

  final String source;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            source,
            style: Styles.heading,
            overflow: TextOverflow.clip,
          ),
        ),
        //const JoinChatButton(),
      ],
    );
  }
}
