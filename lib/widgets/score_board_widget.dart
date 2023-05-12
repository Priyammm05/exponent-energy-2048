import 'package:flutter/material.dart';

import '../utils/color_utils.dart';

class ScoreBoardWidget extends StatelessWidget {
  final String highestScore;

  const ScoreBoardWidget({required this.highestScore, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Score(
          label: 'Best',
          score: highestScore,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        ),
      ],
    );
  }
}

class Score extends StatelessWidget {
  const Score(
      {Key? key, required this.label, required this.score, this.padding})
      : super(key: key);

  final String label;
  final String score;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: padding ??
          const EdgeInsets.symmetric(horizontal: 15.0, vertical: 2.0),
      decoration: BoxDecoration(
          color: scoreBackground, borderRadius: BorderRadius.circular(5.0)),
      child: Column(children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(fontSize: 15.0, color: Color(0xFFEEE4DA)),
        ),
        const SizedBox(height: 5),
        Text(
          score,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0),
        )
      ]),
    );
  }
}
