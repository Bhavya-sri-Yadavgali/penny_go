import 'package:flutter/material.dart';

class CategoryIconWidget extends StatelessWidget {
  final String? iconName;
  final String? colorHex;
  final double size;

  const CategoryIconWidget({
    super.key,
    this.iconName,
    this.colorHex,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    final IconData icon = _getIconData(iconName);
    final Color color = _getColor(colorHex);

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        icon,
        color: color,
        size: size,
      ),
    );
  }

  IconData _getIconData(String? name) {
    switch (name?.toLowerCase()) {
      case 'fastfood':
      case 'food':
        return Icons.fastfood;
      case 'directions_car':
      case 'transport':
        return Icons.directions_car;
      case 'shopping_cart':
      case 'shopping':
        return Icons.shopping_cart;
      case 'home':
      case 'rent':
        return Icons.home;
      case 'movie':
      case 'entertainment':
        return Icons.movie;
      case 'medical_services':
      case 'health':
        return Icons.medical_services;
      case 'electric_bolt':
      case 'bills':
        return Icons.electric_bolt;
      case 'school':
      case 'education':
        return Icons.school;
      default:
        return Icons.category;
    }
  }

  Color _getColor(String? hex) {
    if (hex == null || hex.isEmpty) return Colors.indigo;
    try {
      final String buffer = hex.replaceFirst('#', '');
      return Color(int.parse('FF$buffer', radix: 16));
    } catch (_) {
      return Colors.indigo;
    }
  }
}
