import 'package:flutter/material.dart';

class MovieListError extends StatelessWidget {
  final String? message;
  final VoidCallback onRetry;

  const MovieListError({required this.onRetry, this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.redAccent, size: 40),
            const SizedBox(height: 8),
            Text(
              message ?? 'Erro ao carregar filmes.',
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
