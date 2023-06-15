import 'package:book_reader/screens/details_screen.dart';
import 'package:book_reader/screens/home_screen.dart';
import 'package:book_reader/screens/library_screen.dart';
import 'package:book_reader/screens/login_screen.dart';
import 'package:book_reader/size_data.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    configSizeData(context);

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        title: 'BookReader',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme:
              const AppBarTheme(color: Colors.transparent, elevation: 0),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          useMaterial3: true,
        ),
        home: const LibraryScreen(),
      ),
    );
  }
}
