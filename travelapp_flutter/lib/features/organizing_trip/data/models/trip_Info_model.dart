class TripOrgModel {
  String startDate;
  int numOfSeats;
  int numOfDays;

  String get getstartDate => startDate;
  set setstartDate(String value) => startDate = value;

  int get getnumOfSeats => numOfSeats;
  set setnumOfSeats(int value) => numOfSeats = value;

  int get getnumOfDays => numOfDays;
  set setnumOfDays(int value) => numOfDays = value;

  TripOrgModel(
      {required this.startDate,
      required this.numOfSeats,
      required this.numOfDays});
}
