import 'package:flutter/material.dart';

import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/all_Hotels_page_widgets/all_hotels_page_body.dart';

class AllHotelsPage extends StatelessWidget {
  const AllHotelsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: 
           AllHotelsPageBody(),
        
      ),
    );
  }
}
