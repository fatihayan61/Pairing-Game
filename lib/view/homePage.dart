import 'package:flutter/material.dart';
import 'package:pairing/model/itemModel.dart';
import 'package:pairing/view/gamePanelPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _items = [
    ItemModel(
      id: 2,
      title: " 2 * 2 ",
      time: "00.00.02",
      color: const Color(0xFFFF0000),
    ),
    ItemModel(
      id: 4,
      title: " 4 * 4 ",
      time: "00.00.04",
      color: const Color(0xFF0077B6),
    ),
    ItemModel(
      id: 6,
      title: " 6 * 6 ",
      time: "00.00.06",
      color: const Color(0xFFFFE600),
    ),
    ItemModel(
      id: 8,
      title: " 8 * 8 ",
      time: "00.00.08",
      color: const Color(0XFF00FF0A),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF48cae4),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: gameNameText(),
            ),
          ),
          Expanded(
            flex: 2,
            child: gridViewBuilder(),
          )
        ],
      )),
    );
  }

  Text gameNameText() {
    return Text(
      "PAİRİNG",
      style: Theme.of(context).textTheme.headline2!.copyWith(
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
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return item(cardDetails: _items[index]);
      },
    );
  }

  InkWell item({required ItemModel cardDetails}) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => GamePanelPage(item: cardDetails),
          ),
        );
      },
      child: cardItem(cardDetails),
    );
  }

  Card cardItem(ItemModel cardDetails) {
    return Card(
      elevation: 10,
      shadowColor: Colors.black,
      color: cardDetails.color,
      child: cardItemDetails(cardDetails),
    );
  }

  Column cardItemDetails(ItemModel cardDetails) {
    return Column(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: cardItemDetailsTitle(cardDetails.title),
          ),
        ),
        Expanded(
          child: Center(
            child: cardItemDetailsIcon(),
          ),
        ),
        Expanded(
          child: cardItemDetailsTime(cardDetails.time),
        ),
      ],
    );
  }

  Text cardItemDetailsTime(String time) {
    return Text(
      time,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  Icon cardItemDetailsIcon() {
    return const Icon(
      Icons.workspace_premium_outlined,
      size: 30,
    );
  }

  Text cardItemDetailsTitle(String title) {
    return Text(
      title,
      style:
          Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black),
    );
  }
}
