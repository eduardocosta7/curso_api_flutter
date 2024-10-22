import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/models/journal.dart';
import 'package:flutter_webapi_first_course/screens/journal/add_journal_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Journal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        appBarTheme: const AppBarTheme(
          color: Colors.blueGrey,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        textTheme: GoogleFonts.bitterTextTheme(),
        iconButtonTheme: const IconButtonThemeData(
            style:
                ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.white))),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      initialRoute: "home",
      routes: {"home": (context) => const HomeScreen()},
      onGenerateRoute: (settings) {
        if (settings.name == "add-journal") {
          final Journal journal = settings.arguments as Journal;
          return MaterialPageRoute(builder: (context) {
            return AddJournalScreen(journal: journal);
          });
        }
        return null;
      },
    );
  }
}
