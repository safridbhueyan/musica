import 'package:flutter/material.dart';
import 'package:musica/models/playlist_provider.dart';
import 'package:musica/pages/home_page.dart';
import 'package:musica/pages/theme/themeProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Themeprovider(),
      ),
      ChangeNotifierProvider(
        create: (context) => PlaylistProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: Provider.of<Themeprovider>(context).themeData,
    );
  }
}
