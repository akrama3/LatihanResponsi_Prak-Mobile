import 'package:get/get.dart';
import '../models/character.dart';
import '../services/character_service.dart';

class CharacterController extends GetxController {
  // Dependency
  final CharacterService _characterService = CharacterService();

  // State (variabel reaktif)
  final RxList<Character> _characters = <Character>[].obs;
  final RxBool _isLoading = false.obs;
  final RxString _errorMessage = ''.obs;

  // Getter
  List<Character> get characters => _characters;
  bool get isLoading => _isLoading.value;
  String get errorMessage => _errorMessage.value;

  // Lifecycle
  @override
  void onInit() {
    _retrieveData();
    super.onInit();
  }

  // Logika: mengambil data dari API
  Future<void> _retrieveData() async {
    try {
      _isLoading.value = true;
      final data = await _characterService.fetchCharacters();
      _characters.assignAll(data);
    } catch (e) {
      _errorMessage.value = 'Failed to load characters';
    } finally {
      _isLoading.value = false;
    }
  }
}
