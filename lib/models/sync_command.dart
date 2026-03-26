import 'package:hive/hive.dart';

part 'sync_command.g.dart';

@HiveType(typeId: 4)
enum SyncAction {
  @HiveField(0)
  create,
  @HiveField(1)
  update,
  @HiveField(2)
  delete,
}

@HiveType(typeId: 5)
class SyncCommand extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String endpoint; // e.g., '/expenses'

  @HiveField(2)
  final SyncAction action;

  @HiveField(3)
  final Map<String, dynamic>? data;

  @HiveField(4)
  final DateTime timestamp;

  SyncCommand({
    required this.id,
    required this.endpoint,
    required this.action,
    this.data,
    required this.timestamp,
  });
}
