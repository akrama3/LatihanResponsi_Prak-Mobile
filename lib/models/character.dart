class Character {
  final int index;
  final String fullName;
  final String nickname;
  final String hogwartsHouse;
  final String interpretedBy;
  final String birthdate;
  final String image;
  final List<dynamic> children;

  Character({
    required this.index,
    required this.fullName,
    required this.nickname,
    required this.hogwartsHouse,
    required this.interpretedBy,
    required this.birthdate,
    required this.image,
    required this.children,
  });

  // factory constructor untuk membuat Character dari JSON
  factory Character.fromJson(Map<String, dynamic> jsonData) {
    return Character(
      index: jsonData['index'] ?? 0,
      fullName: jsonData['fullName'] ?? '',
      nickname: jsonData['nickname'] ?? '',
      hogwartsHouse: jsonData['hogwartsHouse'] ?? '',
      interpretedBy: jsonData['interpretedBy'] ?? '',
      birthdate: jsonData['birthdate'] ?? '',
      image: jsonData['image'] ?? '',
      children: jsonData['children'] ?? [],
    );
  }
}
