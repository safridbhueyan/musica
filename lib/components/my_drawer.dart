import 'package:flutter/material.dart';
import 'package:musica/pages/faq.dart';
import 'package:musica/pages/setting_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // logo
          Container(
            margin: const EdgeInsets.only(bottom: 2.0),
            padding: const EdgeInsets.fromLTRB(25.0, 100.0, 25.0, 25.0),
            child: Icon(
              Icons.music_note_outlined,
              size: 60,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Divider(
              color: Theme.of(context).colorScheme.surface,
              thickness: 1,
            ),
          ),
          //home page
          Padding(
            padding: EdgeInsets.only(top: 25.0, left: 25.0),
            child: ListTile(
              title: Text("H O M E"),
              leading: Icon(
                Icons.home,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          //setting page
          Padding(
            padding: EdgeInsets.only(top: 0.0, left: 25.0),
            child: ListTile(
              title: Text("S E T T I N G"),
              leading: Icon(
                Icons.settings,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingPage()));
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 0.0, left: 25.0),
            child: ListTile(
              title: Text("F A Q"),
              leading: Icon(
                Icons.question_mark_rounded,
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Faq()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
