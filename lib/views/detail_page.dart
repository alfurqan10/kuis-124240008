// TODO Implement this library.import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../models/pokemon.dart';

class PokemonDetailPage extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail ${pokemon.name}'),
        backgroundColor: Color.fromARGB(255, 11, 109, 239),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                pokemon.image,
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 220,
                    color: const Color(0xFFEAF6EE),
                    child: const Center(
                      child: Icon(Icons.diamond, size: 60, color: Color(0xFF1F6F4F)),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              pokemon.name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            _DetailSection(title: 'Berat dan Tinggi Pokemon', children: [
              _DetailRow(label: 'Berat', value: '${pokemon.weight} kg'),
              _DetailRow(label: 'Tinggi', value: '${pokemon.height} cm'),
            ]),
             const SizedBox(height: 20),
            _DetailSection(title: 'Tipe Pokemon', children: [
              _DetailRow(label: 'Tipe', value: '${pokemon.types.join(', ')}'),
              _DetailRow(label: 'Ability', value: '${pokemon.ability}'),
            ]),
          ],
        ),
      ),
    );
  }
}

class _DetailSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _DetailSection({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE1E8E4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.black54),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: unused_element
class _Tag extends StatelessWidget {
  final String label;
  final bool filled;

  const _Tag({required this.label}) : filled = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: filled ? const Color(0xFFEAF6EE) : Colors.white,
        border: filled ? null : Border.all(color: const Color(0xFFDFE7E1)),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          color: filled ? const Color.fromARGB(255, 4, 131, 204) : Colors.black54,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}