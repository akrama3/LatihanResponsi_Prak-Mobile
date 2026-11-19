import 'dart:convert';
import 'package:http/http.dart' as http;
import '../API/api_endpoints.dart';
import '../models/character.dart';

class CharacterService {
  final Uri _url = Uri.parse(ApiEndpoints.characters);

  Future<List<Character>> fetchCharacters() async {
    final response = await http.get(_url);
    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);
      return result.map((item) => Character.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
