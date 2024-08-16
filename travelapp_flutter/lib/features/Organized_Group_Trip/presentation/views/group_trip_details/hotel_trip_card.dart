import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/helpers/api_service.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/hotel_model.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/hotel_details_page_widgets/stars_list.dart';

class HotelTripCard extends StatelessWidget {
  const HotelTripCard({
    super.key,
    required this.hotel,
  });

  final HotelModel hotel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hotel.name,
          style: Styles.content.copyWith(
            color: Themes.primary,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: Image.network(
                  '${getIt.get<ApiService>().baseUrl}${hotel.images[0]}',
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                '${hotel.location.country} - ${hotel.location.city} - ${hotel.location.name}',
                style: Styles.subtitle,
                overflow: TextOverflow.clip,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                '\$${hotel.startsFrom.toString()}',
                style: Styles.content.copyWith(fontSize: 24),
              ),
            ),
            const SizedBox(width: 16),
            StarsList(stars: hotel.stars),
          ],
        ),
      ],
    );
  }
}
