import 'package:flutter/material.dart';
import 'package:meals_app/pages/tabs_page.dart';

import 'core/utils/util.dart';
import 'theme/theme.dart';

class MealsApp extends StatelessWidget {
  const MealsApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Tạo text theme với Google Fonts
    final textTheme = createTextTheme(context, "Roboto", "Roboto");

    // Tạo MaterialTheme custom
    final materialTheme = MaterialTheme(textTheme);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals App',
      theme: materialTheme.light(),
      darkTheme: materialTheme.dark(),
      themeMode: ThemeMode.system,
      home: const TabsPage(),
    );
  }
}
