import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class OrganizedTripPagination extends StatelessWidget {
  const OrganizedTripPagination({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NumberPaginator(
      numberPages: 5,
      initialPage: 0,
      onPageChange: (index) async {},
      config: NumberPaginatorUIConfig(
        buttonSelectedBackgroundColor: Themes.primary,
        buttonUnselectedForegroundColor: Themes.third,
      ),
    );
  }
}
