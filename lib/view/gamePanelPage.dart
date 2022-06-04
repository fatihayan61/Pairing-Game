import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:pairing/model/itemModel.dart';
import 'package:pairing/view/homePage.dart';

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
            icon: const Icon(Icons.workspace_premium),
          ),
          IconButton(
            onPressed: () {
              resaultDialog(context);
            },
            icon: const Icon(Icons.open_with_rounded),
          ),
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

  Future<dynamic> resaultDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog(context);
        }).then((value) => {aletrDialogControlResult(value)});
  }

  void aletrDialogControlResult(value) {
    if (value) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => GamePanelPage(item: widget.item),
        ),
        ModalRoute.withName('/'),
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
        ModalRoute.withName('/'),
      );
    }
  }

  AlertDialog alertDialog(BuildContext context) {
    return AlertDialog(
      buttonPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      backgroundColor: const Color(0xFF48cae4),
      title: Container(
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Center(child: Text("END GAME")),
        ),
        color: const Color(0xFF0077b6),
      ),
      content: Expanded(
        child: alertDialogTimeState(context),
      ),
      actions: [
        alertDialogActioState(context),
      ],
    );
  }

  Container alertDialogActioState(BuildContext context) {
    return Container(
      decoration: alertDialogBoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(flex: 2, child: actionButton("Again", true)),
            const Spacer(
              flex: 1,
            ),
            Expanded(flex: 2, child: actionButton("Cancel", false)),
          ],
        ),
      ),
    );
  }

  BoxDecoration alertDialogBoxDecoration() {
    return const BoxDecoration(
      border: Border(
        left: BorderSide(
          color: Color(0xFF0077b6),
          width: 3.0,
        ),
        bottom: BorderSide(
          color: Color(0xFF0077b6),
          width: 3.0,
        ),
        right: BorderSide(
          color: Color(0xFF0077b6),
          width: 3.0,
        ),
      ),
    );
  }

  ElevatedButton actionButton(String title, bool durum) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xFF0077b6)),
      ),
      onPressed: () {
        Navigator.pop(context, durum);
      },
      child: Text(title),
    );
  }

  Container alertDialogTimeState(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: const BoxDecoration(
        border: Border.symmetric(
          vertical: BorderSide(
            color: Color(0xFF0077b6),
            width: 3.0,
          ),
        ),
      ),
      child: Text(
        "Your Time : 00.00.00",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline6,
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
    return FlipCard(
      front: Card(
        elevation: 10,
        shadowColor: Colors.black,
        margin: const EdgeInsets.all(2),
        color: widget.item.color,
      ),
      back: const Card(
        margin: EdgeInsets.all(2),
        color: Colors.blue,
      ),
    );
  }
}
