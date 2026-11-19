import 'package:flutter/material.dart';
import '../models/character.dart';

class DetailScreen extends StatelessWidget {
  final Character character;
  const DetailScreen({super.key, required this.character});

  Widget _info(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 13, color: Colors.grey)),
          Text(
            value.isEmpty ? '-' : value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(character.fullName)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                character.image,
                height: 320,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.person, size: 120),
              ),
            ),
            const SizedBox(height: 16),
            _info('Full Name', character.fullName),
            _info('Nickname', character.nickname),
            _info('Hogwarts House', character.hogwartsHouse),
            _info('Interpreted By', character.interpretedBy),
            _info('Birthdate', character.birthdate),
            _info(
              'Children',
              character.children.isEmpty ? '' : character.children.join(', '),
            ),
            _info('Index', character.index.toString()),
          ],
        ),
      ),
    );
  }
}
