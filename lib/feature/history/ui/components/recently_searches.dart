import 'package:flutter/material.dart';
import 'package:history_simple_app/core/theme/app_colors.dart';
import 'package:history_simple_app/feature/history/ui/components/custom_card.dart';

class RecentlySearches extends StatelessWidget {
  final List<String> searchs;
  final VoidCallback? onClear;
  const RecentlySearches({
    super.key,
    required this.searchs,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: searchs.isEmpty ? const _EmptySearchState() : _SearchHistoryList(searchs: searchs, onClear: onClear),
    );
  }
}

class _EmptySearchState extends StatelessWidget {
  const _EmptySearchState();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.access_time,
          size: 48,
          color: AppColors.primaryColor.withAlpha(85),
        ),
        const SizedBox(height: 16),
        const Text(
          'Nenhuma pesquisa ainda',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF7D6E5D),
            fontWeight: FontWeight.w500,
          ),
        ),
        const Text(
          'Suas buscas aparecerão aqui',
          style: TextStyle(fontSize: 14, color: Color(0xFFA89A8E)),
        ),
      ],
    );
  }
}

class _SearchHistoryList extends StatelessWidget {
  final List<String> searchs;
  final VoidCallback? onClear;

  const _SearchHistoryList({required this.searchs, this.onClear});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Icon(Icons.access_time, size: 20),
                SizedBox(width: 8),
                Text(
                  'Histórico',
                  style: TextStyle(
                    fontFamily: 'Serif',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            TextButton.icon(
              onPressed: onClear,
              icon: const Icon(Icons.delete_outline, size: 18, color: AppColors.primaryColor),
              label: const Text('Limpar', style: TextStyle(color: Color(0xFF7D6E5D))),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: searchs.map((ano) => _HistoryChip(label: ano)).toList(),
        ),
      ],
    );
  }
}

class _HistoryChip extends StatelessWidget {
  final String label;
  const _HistoryChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFEBE3D5),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(fontFamily: 'Serif', fontWeight: FontWeight.w500),
          ),
          const SizedBox(width: 6),
          const Icon(Icons.layers_outlined, size: 14, color: Color(0xFFB8860B)),
        ],
      ),
    );
  }
}
