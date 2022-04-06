import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_provider_flutter/second.dart';
import 'package:theme_provider_flutter/theme_provider.dart';

enum ThemeType { black, pink, orange }

void main() {
  runApp(ChangeNotifierProvider<ShowTheme>(
      create: (context) {
        return ShowTheme();
      },
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Flutter Demo',
        home: MyHomePage(title: 'Flutter Demo Home Page'));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ThemeType currentTheme = ThemeType.black;

  @override
  Widget build(BuildContext context) {
    ShowTheme themeModel = Provider.of<ShowTheme>(context, listen: false);

    return Scaffold(
      backgroundColor: themeModel.cyan,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                color: themeModel.black,
                width: 100,
                height: 100,
              ),
            ),
            RadioListTile<ThemeType>(
              title: const Text('Black'),
              value: ThemeType.black,
              groupValue: currentTheme,
              onChanged: (colorValue) async {
                var instance = await SharedPreferences.getInstance();
                instance.setInt(ShowTheme.CONTAINER_KEY, Colors.black.value);
                instance.setInt(ShowTheme.SCAFOLD_KEY, Colors.white.value);
                setState(
                  () {
                    debugPrint(
                        '.............Current Theme............$currentTheme');
                    currentTheme = colorValue!;

                    themeModel.toggleTheme();
                  },
                );
              },
            ),
            RadioListTile<ThemeType>(
              title: const Text('Pink'),
              value: ThemeType.pink,
              groupValue: currentTheme,
              onChanged: (colorValue) async {
                var instance = await SharedPreferences.getInstance();
                instance.setInt(ShowTheme.CONTAINER_KEY, Colors.pink.value);
                instance.setInt(ShowTheme.SCAFOLD_KEY, Colors.blue.value);
                setState(
                  () {
                    debugPrint(
                        '.............Current Theme............$currentTheme');
                    debugPrint(
                        '.............Color Value............$colorValue');
                    currentTheme = colorValue!;
                    debugPrint(
                        '.............After Current Theme............$currentTheme');
                    themeModel.toggleTheme();
                  },
                );
              },
            ),
            RadioListTile<ThemeType>(
              title: const Text('Orange'),
              value: ThemeType.orange,
              groupValue: currentTheme,
              onChanged: (colorValue) async {
                var instance = await SharedPreferences.getInstance();
                instance.setInt(ShowTheme.CONTAINER_KEY, Colors.orange.value);
                instance.setInt(ShowTheme.SCAFOLD_KEY, Colors.cyan.value);
                setState(
                  () {
                    debugPrint(
                        '.............Current Theme............$currentTheme');
                    debugPrint(
                        '.............Color Value............$colorValue');
                    currentTheme = colorValue!;
                    themeModel.toggleTheme();
                  },
                );
              },
            ),
            TextButton(
                onPressed: () {

                  setState(() {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const SecondHome();
                      },
                    ));
                  });
                },
                child: const Text('Second'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
