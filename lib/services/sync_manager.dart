import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/sync_command.dart';
import './api_service.dart';
import './local_database_service.dart';

class SyncManager {
  final ApiService _apiService;
  final LocalDatabaseService _localDb;
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  bool _isProcessing = false;

  SyncManager(this._apiService, this._localDb);

  void init() {
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((results) {
      if (results.any((r) => r != ConnectivityResult.none)) {
        _processQueue();
      }
    });
    // Initial check
    _processQueue();
  }

  void dispose() {
    _connectivitySubscription.cancel();
  }

  Future<void> _processQueue() async {
    if (_isProcessing) return;
    _isProcessing = true;

    final box = _localDb.getBox<SyncCommand>(LocalDatabaseService.syncBoxName);
    final commands = box.values.toList()
      ..sort((a, b) => a.timestamp.compareTo(b.timestamp));

    for (final command in commands) {
      bool success = false;
      try {
        switch (command.action) {
          case SyncAction.create:
            await _apiService.post(command.endpoint, data: command.data);
            success = true;
            break;
          case SyncAction.update:
            await _apiService.put('${command.endpoint}/${command.id}', data: command.data);
            success = true;
            break;
          case SyncAction.delete:
            await _apiService.delete('${command.endpoint}/${command.id}');
            success = true;
            break;
        }
      } on DioException catch (e) {
        // If it's a 4xx error (except 401), we might skip. 
        // If it's a 5xx or connection error, we stop processing the queue.
        if (e.response != null && e.response!.statusCode! < 500) {
          success = true; // Mark as "processed" to avoid blocking the queue if it's a client error (e.g. data validation)
          print('Sync failed due to client error: ${e.message}');
        } else {
          _isProcessing = false;
          return; // Stop processing and wait for better connectivity
        }
      }

      if (success) {
        await command.delete(); // Removes from Hive box
      }
    }

    _isProcessing = false;
  }

  Future<void> addCommand(SyncCommand command) async {
    final box = _localDb.getBox<SyncCommand>(LocalDatabaseService.syncBoxName);
    await box.add(command);
    _processQueue();
  }
}
