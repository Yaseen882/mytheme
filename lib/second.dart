import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider_flutter/theme_provider.dart';

class SecondHome extends StatelessWidget {
  const SecondHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShowTheme>(
      create: (context) {
        return ShowTheme();
      },
      child: const Second(),
    );
  }
}

class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    ShowTheme themeModel = Provider.of<ShowTheme>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text('Second'),),
      body: Center(
          child: Container(
        width: 100,
        height: 100,
        color: themeModel.cyan,
      )),
    );
  }
}
