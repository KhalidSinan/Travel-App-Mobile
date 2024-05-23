import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class HotelsPagination extends StatelessWidget {
  const HotelsPagination({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: NumberPaginator(
        numberPages: 5,
        initialPage: 1,
        // onPageChange: (index) async {
        //   await BlocProvider.of<AllFlightsCubit>(context).changePage(index + 1);
        // },
        config: NumberPaginatorUIConfig(
          buttonSelectedBackgroundColor: Themes.primary,
          buttonUnselectedForegroundColor: Themes.third,
        ),
      ),
    );
  }
}
