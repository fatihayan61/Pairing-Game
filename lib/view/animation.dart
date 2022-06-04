import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FlipCard(
      key: cardKey,
      flipOnTouch: false,
      front: Container(
        color: Colors.red,
        child: ElevatedButton(
          onPressed: () => cardKey.currentState!.toggleCard(),
          child: const Text('Toggle'),
        ),
      ),
      back: Container(
        color: Colors.red,
        child: const Text('Back'),
      ),
    ));
  }
}

class ItemGame extends StatefulWidget {
  const ItemGame({Key? key, required this.onfront, required this.onback})
      : super(key: key);
  final Widget onfront;
  final Widget onback;
  @override
  State<ItemGame> createState() => _ItemGameState();
}

class _ItemGameState extends State<ItemGame> {
  bool isSelected = false;
  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() {
      opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.onback,
        InkWell(
          onTap: () {
            _changeOpacity();
          },
          child: AnimatedOpacity(
            opacity: opacityLevel,
            duration: const Duration(milliseconds: 200),
            child: widget.onfront,
          ),
        ),
      ],
    );
  }
}
