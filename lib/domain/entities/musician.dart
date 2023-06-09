class Musician {
  Musician(
      {required this.name,
      required this.skills,
      required this.imageUrl,
      required this.rate,
      required this.value});

  final String name;
  final List<String> skills;
  final String imageUrl;
  final int rate;
  final double value;
}
