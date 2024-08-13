import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musica/pages/theme/themeProvider.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("S E T T I N G"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //dark mode text
            Text(
              "Dark Mode",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            //switch
            CupertinoSwitch(
              value:
                  Provider.of<Themeprovider>(context, listen: false).isDarkMode,
              onChanged: (value) =>
                  Provider.of<Themeprovider>(context, listen: false)
                      .toggleTheme(),
            ),
          ],
        ),
      ),
    );
  }
}
