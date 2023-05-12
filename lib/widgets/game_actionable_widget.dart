import 'package:expononet_energy/utils/color_utils.dart';
import 'package:expononet_energy/widgets/button_widget.dart';
import 'package:expononet_energy/widgets/score_board_widget.dart';
import 'package:flutter/material.dart';

class GameActionableWidget extends StatefulWidget {
  final VoidCallback onUndoPressed;
  final VoidCallback onNewGamePressed;
  final int score;
  final bool isGameOver;

  const GameActionableWidget(
      {Key? key,
      required this.onUndoPressed,
      required this.onNewGamePressed,
      required this.score,
      required this.isGameOver})
      : super(key: key);

  @override
  State<GameActionableWidget> createState() => _GameActionableWidgetState();
}

class _GameActionableWidgetState extends State<GameActionableWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonWidget(
          text: "UNDO",
          onPressed: () {
            //Undo the round.
            widget.onUndoPressed();
          },
          backgroundColor: const Color.fromRGBO(143, 122, 102, 1),
        ),
        const SizedBox(width: 18),
        Score(label: 'Score', score: widget.score.toString()),
        const SizedBox(width: 18),
        ButtonWidget(
          text: "NEW GAME",
          onPressed: () {
            //Restart the game
            widget.onNewGamePressed();
          },
          backgroundColor: widget.isGameOver
              ? const Color.fromRGBO(143, 122, 102, 1)
              : scoreBackground,
        ),
      ],
    );
  }
}
