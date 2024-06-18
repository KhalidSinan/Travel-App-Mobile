import 'package:travelapp_flutter/core/helpers/api_service.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/repos/organizing_trip_repo.dart';

class OrganizingTripImpl extends OrganizingTripRepo {
  final ApiService apiService;
  
  OrganizingTripImpl(this.apiService);
}
