import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:pairing/model/itemModel.dart';

class GamePanelPage extends StatefulWidget {
  const GamePanelPage({
    Key? key,
    required this.item,
  }) : super(key: key);
  final ItemModel item;
  @override
  State<GamePanelPage> createState() => _GamePanelPageState();
}

class _GamePanelPageState extends State<GamePanelPage> {
  List<bool> selectedItem = [true, true, true, true];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF48cae4),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("00.00.00"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.change_circle),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: cardItemBuilder(),
        ),
      ),
    );
  }

  GridView cardItemBuilder() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.item.id * widget.item.id,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.item.id,
      ),
      itemBuilder: (BuildContext context, int index) {
        return cardItem();
      },
    );
  }

  FlipCard cardItem() {
    return const FlipCard(
      front: Card(
        elevation: 10,
        shadowColor: Colors.black,
        margin: EdgeInsets.all(2),
        color: Colors.red,
      ),
      back: Card(
        margin: EdgeInsets.all(2),
        color: Colors.blue,
      ),
    );
  }
}
