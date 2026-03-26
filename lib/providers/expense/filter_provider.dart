import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterState {
  final String? categoryId;
  final String? startDate;
  final String? endDate;
  final String sortBy;
  final String order;

  FilterState({
    this.categoryId,
    this.startDate,
    this.endDate,
    this.sortBy = 'date',
    this.order = 'DESC',
  });

  FilterState copyWith({
    String? categoryId,
    String? startDate,
    String? endDate,
    String? sortBy,
    String? order,
  }) {
    return FilterState(
      categoryId: categoryId ?? this.categoryId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      sortBy: sortBy ?? this.sortBy,
      order: order ?? this.order,
    );
  }
}

class FilterNotifier extends StateNotifier<FilterState> {
  FilterNotifier() : super(FilterState());

  void setCategory(String? id) => state = state.copyWith(categoryId: id);
  void setDateRange(String? start, String? end) => state = state.copyWith(startDate: start, endDate: end);
  void setSorting(String sortBy, String order) => state = state.copyWith(sortBy: sortBy, order: order);
  void reset() => state = FilterState();
}

final filterProvider = StateNotifierProvider<FilterNotifier, FilterState>((ref) {
  return FilterNotifier();
});
