import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';
import 'go_router_config.dart';
import 'size_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: BookReaderApp()));
}

class BookReaderApp extends ConsumerWidget {
  const BookReaderApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    configSizeData(context);

    //  Add GestureDetector to implement global 'unfocus'
    //  when tapping outside of widgets
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: MaterialApp.router(
        routerConfig: ref.watch(routerProvider),
        title: 'BookReader',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme:
              const AppBarTheme(color: Colors.transparent, elevation: 0),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          useMaterial3: true,
        ),
      ),
    );
  }
}
