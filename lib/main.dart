import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:penny_go/routes/app_router.dart';
import 'package:penny_go/services/local_database_service.dart';
import 'package:penny_go/providers/global_providers.dart';
import 'utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Offline Storage
  await LocalDatabaseService.init();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Start Sync Manager
    ref.read(syncManagerProvider).init();

    final router = ref.watch(appRouterProvider); // Assuming appRouterProvider is the correct provider name

    return MaterialApp.router(
      title: 'Penny Go', // Changed from AppConstants.appName
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.indigo, // Added primarySwatch
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          primary: Colors.indigo, // Changed from brightness: Brightness.light
        ),
        appBarTheme: const AppBarTheme( // Retained from original
          centerTitle: true,
          elevation: 0,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      routerConfig: AppRouter.router,
    );
  }
}
