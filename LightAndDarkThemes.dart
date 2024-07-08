import 'package:flutter/material.dart';

// Define light and dark themes
final ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.light(
    primary: Colors.deepPurple,
    primaryContainer: Colors.deepPurpleAccent,
    secondary: Colors.amber,
    secondaryContainer: Colors.amberAccent,
    surface: Colors.white,
    background: Colors.white,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.black,
    onBackground: Colors.black,
    onError: Colors.white,
  ),
  hoverColor: Colors.red,
  hintColor: Colors.grey,
  cardColor: Colors.white,
  focusColor: Colors.deepPurpleAccent,
  shadowColor: Colors.grey,
  splashColor: Colors.deepPurple.withOpacity(0.3),
  canvasColor: Colors.white,
  dividerColor: Colors.grey,
  primaryColor: Colors.deepPurple,
  highlightColor: Colors.deepPurple.withOpacity(0.3),
  disabledColor: Colors.grey,
  primaryColorDark: Colors.deepPurple[700],
  primaryColorLight: Colors.deepPurple[200],
  indicatorColor: Colors.amber,
  secondaryHeaderColor: Colors.amber,
  cupertinoOverrideTheme: null,
  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.all(Colors.deepPurple),
  ),
  dialogBackgroundColor: Colors.white,
  unselectedWidgetColor: Colors.grey,
  scaffoldBackgroundColor: Colors.white,
  applyElevationOverlayColor: false,
  useMaterial3: true,
);

final ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.dark(
    primary: Colors.deepPurple,
    primaryContainer: Colors.deepPurpleAccent,
    secondary: Colors.amber,
    secondaryContainer: Colors.amberAccent,
    surface: Colors.grey[800],
    background: Colors.black,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.white,
    onBackground: Colors.white,
    onError: Colors.black,
  ),
  hoverColor: Colors.red,
  hintColor: Colors.grey[600],
  cardColor: Colors.grey[850],
  focusColor: Colors.deepPurpleAccent,
  shadowColor: Colors.black,
  splashColor: Colors.deepPurple.withOpacity(0.3),
  canvasColor: Colors.black,
  dividerColor: Colors.grey[700],
  primaryColor: Colors.deepPurple,
  highlightColor: Colors.deepPurple.withOpacity(0.3),
  disabledColor: Colors.grey[600],
  primaryColorDark: Colors.deepPurple[700],
  primaryColorLight: Colors.deepPurple[200],
  indicatorColor: Colors.amber,
  secondaryHeaderColor: Colors.amber,
  cupertinoOverrideTheme: null,
  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.all(Colors.deepPurple),
  ),
  dialogBackgroundColor: Colors.grey[850],
  unselectedWidgetColor: Colors.grey[600],
  scaffoldBackgroundColor: Colors.black,
  applyElevationOverlayColor: true,
  useMaterial3: true,
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IET Control',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Color Checker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ColorDisplay(title: 'Primary', color: colorScheme.primary),
              ColorDisplay(
                  title: 'Primary Container',
                  color: colorScheme.primaryContainer),
              ColorDisplay(title: 'Secondary', color: colorScheme.secondary),
              ColorDisplay(
                  title: 'Secondary Container',
                  color: colorScheme.secondaryContainer),
              ColorDisplay(title: 'Surface', color: colorScheme.surface),
              ColorDisplay(title: 'Background', color: colorScheme.background),
              ColorDisplay(title: 'Error', color: colorScheme.error),
              ColorDisplay(title: 'On Primary', color: colorScheme.onPrimary),
              ColorDisplay(
                  title: 'On Secondary', color: colorScheme.onSecondary),
              ColorDisplay(title: 'On Surface', color: colorScheme.onSurface),
              ColorDisplay(
                  title: 'On Background', color: colorScheme.onBackground),
              ColorDisplay(title: 'On Error', color: colorScheme.onError),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorDisplay extends StatelessWidget {
  final String title;
  final Color color;

  const ColorDisplay({
    required this.title,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(title,
            style: TextStyle(
                color: color.computeLuminance() > 0.5
                    ? Colors.black
                    : Colors.white)),
      ),
    );
  }
}
