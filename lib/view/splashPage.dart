import 'package:flutter/material.dart';

import 'homePage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    //goHomePage();
  }

  goHomePage() {
    Future.delayed(const Duration(seconds: 1), (() {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute<void>(
            builder: (BuildContext context) => const HomePage()),
        ModalRoute.withName('/'),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF2A9D8F),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 1,
                  child: Center(child: gameNameText()),
                ),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          rowItem(),
                          rowItem(),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ));
  }

  Row rowItem() {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.red,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.red,
          ),
        ),
      ],
    );
  }

  Text gameNameText() {
    return Text(
      "GAME NAME",
      style: Theme.of(context).textTheme.headline3!.copyWith(
        color: Colors.amber,
        shadows: [
          const Shadow(
            color: Colors.black,
            offset: Offset(0, 3),
            blurRadius: 8,
          ),
        ],
      ),
    );
  }

  GridView gridViewBuilder() {
    return GridView.builder(
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        return const ItemGridView();
      },
    );
  }
}

class ItemGridView extends StatefulWidget {
  const ItemGridView({Key? key}) : super(key: key);

  @override
  State<ItemGridView> createState() => _ItemGridViewState();
}

class _ItemGridViewState extends State<ItemGridView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        color: Color(0xFFD90429),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
    );
  }
}
