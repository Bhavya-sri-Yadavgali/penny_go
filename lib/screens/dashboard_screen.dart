import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth/auth_provider.dart';
import '../providers/budget/budget_provider.dart';
import '../widgets/summary_card.dart';
import '../widgets/budget_progress_tile.dart';
import '../widgets/add_expense_sheet.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).value;
    final budgetState = ref.watch(budgetProvider);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, ${user?.name ?? 'Guest'}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Here's your finance summary",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => ref.read(authProvider.notifier).logout(),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => ref.read(budgetProvider.notifier), // Fixed to notifier later
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Main Summary Card
              budgetState.when(
                data: (budgets) {
                  // Separate 'Total' budget from category-specific ones
                  final totalBudget = budgets.firstWhere((b) => b.categoryId == null, orElse: () => budgets.first);
                  final categoryBudgets = budgets.where((b) => b.categoryId != null).toList();

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SummaryCard(
                        limit: totalBudget.limitAmount,
                        spent: totalBudget.spentAmount ?? 0,
                      ),
                      if (categoryBudgets.isNotEmpty) ...[
                        const SizedBox(height: 32),
                        const Text(
                          'Category Budgets',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                        ...categoryBudgets.map((b) => BudgetProgressTile(budget: b)),
                      ],
                    ],
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text('Error: $e')),
              ),
              const SizedBox(height: 32),
              
              const Text(
                'Quick Actions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildQuickActions(context),
              
              const SizedBox(height: 32),
              const Text(
                'Recent Transactions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // Placeholder for recent expenses
              const Center(child: Text('No recent expenses found.')),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildActionItem(context, Icons.add_shopping_cart, 'Add Expense', Colors.orange),
        _buildActionItem(context, Icons.category, 'New Category', Colors.blue),
        _buildActionItem(context, Icons.account_balance_wallet, 'Set Budget', Colors.green),
      ],
    );
  }

  Widget _buildActionItem(BuildContext context, IconData icon, String label, Color color) {
    return GestureDetector(
      onTap: () {
        if (label == 'Add Expense') {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            builder: (context) => const AddExpenseSheet(),
          );
        }
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
