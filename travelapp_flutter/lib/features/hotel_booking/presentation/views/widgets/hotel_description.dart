import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_button.dart';

class HotelDescription extends StatefulWidget {
  const HotelDescription({
    super.key,
    required this.description,
  });

  final String description;

  @override
  State<HotelDescription> createState() => _HotelDescriptionState();
}

class _HotelDescriptionState extends State<HotelDescription> {
  bool isReadMore = false, readMoreExist = true;
  int? maxLines = 2;
  @override
  void initState() {
    super.initState();
    readMoreExist = widget.description.length > 100;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'About Hotel',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          widget.description,
          overflow: isReadMore && readMoreExist ? null : TextOverflow.ellipsis,
          maxLines: maxLines,
          style: Styles.content.copyWith(
            color: Colors.grey[400],
            fontSize: 16,
          ),
        ),
        readMoreExist
            ? CustomTextButton(
                onPressed: toggleReadMore,
                label: isReadMore ? 'Read Less' : 'Read More',
                color: Themes.primary,
                size: 16,
              )
            : const SizedBox(),
      ],
    );
  }

  void toggleReadMore() {
    setState(() {
      isReadMore = !isReadMore;
      maxLines = isReadMore ? null : 2;
    });
  }
}
