import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF48cae4),
      appBar: AppBar(
        title: const Text("About"),
      ),
      body: Column(
        children: [
          Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "App",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.app_blocking),
                  title: Text("PAİRİNG GAME"),
                ),
                const ListTile(
                  leading: Icon(Icons.info),
                  title: Text("Version"),
                ),
                const ListTile(
                  leading: Icon(Icons.change_circle),
                  title: Text("Change Update"),
                ),
                ListTile(
                  onTap: () {
                    showAboutDialog(context: context);
                  },
                  leading: const Icon(Icons.description),
                  title: const Text("Licence"),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Author",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Fatih AYAN"),
                ),
                const ListTile(
                  leading: Icon(Icons.mail),
                  title: Text("fatihayan61@gmail.com"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
