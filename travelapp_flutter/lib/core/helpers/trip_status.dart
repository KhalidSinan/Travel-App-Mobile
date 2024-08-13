enum TripStatus {
  onGoing("On Going", "assets/animations/active.json"),
  waiting("Waiting", "assets/animations/time.json"),
  finished("Finished", "assets/animations/check.json");

  final String value;
  final String animation;

  const TripStatus(this.value, this.animation);
}
