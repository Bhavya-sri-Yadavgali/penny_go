import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/budget_model.dart';

class BudgetProgressTile extends StatelessWidget {
  final BudgetModel budget;

  const BudgetProgressTile({super.key, required this.budget});

  @override
  Widget build(BuildContext context) {
    final percent = (budget.percentageUsed ?? 0) / 100;
    final remaining = budget.limitAmount - (budget.spentAmount ?? 0);
    final currencyFormat = NumberFormat.currency(symbol: '₹', decimalDigits: 0);

    Color statusColor = Colors.emerald;
    if (percent >= 0.9) {
      statusColor = Colors.redAccent;
    } else if (percent >= 0.7) {
      statusColor = Colors.orangeAccent;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[100]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                budget.categoryName ?? 'Total Budget',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                '${(percent * 100).toStringAsFixed(0)}%',
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: percent.clamp(0.0, 1.0),
              minHeight: 6,
              backgroundColor: Colors.grey[100],
              valueColor: AlwaysStoppedAnimation<Color>(statusColor),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Spent: ${currencyFormat.format(budget.spentAmount ?? 0)}',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
              Text(
                remaining < 0 
                  ? 'Over by ${currencyFormat.format(remaining.abs())}' 
                  : '${currencyFormat.format(remaining)} left',
                style: TextStyle(
                  color: remaining < 0 ? Colors.redAccent : Colors.grey[600],
                  fontSize: 12,
                  fontWeight: remaining < 0 ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
