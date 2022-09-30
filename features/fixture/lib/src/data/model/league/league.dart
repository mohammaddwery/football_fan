class League {
  final int id;
  final String name;
  final String logo;
  final String? flag;

  const League({
    required this.id,
    required this.name,
    required this.logo,
    this.flag,
  });
}