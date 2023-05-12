// ignore_for_file: avoid_print, must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:confetti/confetti.dart';
import 'package:expononet_energy/controller/game_controller.dart';
import 'package:expononet_energy/widgets/board_widget.dart';
import 'package:expononet_energy/widgets/celebration_widget.dart';
import 'package:expononet_energy/widgets/game_actionable_widget.dart';
import 'package:expononet_energy/widgets/game_over_widget.dart';
import 'package:expononet_energy/widgets/score_board_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'package:get/get.dart';

class GameScreen extends GetView<GameController> {
  late ConfettiController _animationController;
  int lastKeyStrokeTime = 0;

  GameScreen({Key? key}) : super(key: key) {
    _animationController =
        ConfettiController(duration: const Duration(seconds: 10));
    lastKeyStrokeTime = DateTime.now().millisecondsSinceEpoch;
  }

  @override
  Widget build(BuildContext context) {
    var commentWidgets = <Widget>[];
    if (controller.isGameWon.value == true) {
      print("is Game over? ${controller.isGameWon.value}");
      commentWidgets
          .add(CelebrationWidget(animationController: _animationController));
      _animationController.play();
    } else {
      commentWidgets.clear();
    }

    return RawKeyboardListener(
        autofocus: true,
        focusNode: FocusNode(),
        onKey: (event) {
          handleKeyEvent(event);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 80.0, bottom: 50.0),
                    child: Text(
                      '2048',
                      style: TextStyle(
                        color: Color.fromRGBO(119, 110, 109, 1),
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "2048 is a popular single-player puzzle game that is played on a 4x4 grid. The objective of the game\nis to slide numbered tiles on the grid and combine them to create a tile with the number 2048.",
                    style: TextStyle(
                      color: const Color.fromRGBO(143, 122, 102, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    "Here are the basic rules of the game:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    "1. The game starts with two tiles with the number 2 on the grid.\n2. Use the arrow keys (up, down, left, right) to move the tiles in the desired direction.\n3. When two tiles with the same number touch, they merge into a new tile with twice the value.\n4. Every time you move a tile, a new tile with the number 2 or 4 appears on the grid.\n5. The game ends when there are no more moves available, i.e. the grid is full and no adjacent tiles have the same value.",
                    style: TextStyle(
                      color: const Color.fromRGBO(143, 122, 102, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 1.1,
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    "Here are some tips to help you play the game:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    "1. Start by focusing on one corner of the grid, and try to build up a large number there. This will help you create more\nopportunities to merge tiles.\n2. Always look ahead and plan your moves in advance. Try to anticipate where new tiles will appear and how they will affect the board.\n3. Be careful not to block yourself in by creating rows or columns that cannot be merged.\n4. Try to keep your largest number in the corner, as it is less likely to interfere with other tiles.\n5. Remember that the key to winning the game is to create a tile with the number 2048. Don't get too caught up in merging smaller tiles\nat the expense of your ultimate goal.",
                    style: TextStyle(
                      color: const Color.fromRGBO(143, 122, 102, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 1.1,
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    "GOOD LUCK!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            Obx(
                              () => ScoreBoardWidget(
                                highestScore:
                                    controller.highScore.value.toString(),
                                key: null,
                              ),
                            ),
                            const SizedBox(height: 15),
                            SwipeDetector(
                                onSwipe: (direction, offset) {
                                  onSwipedDetected(direction);
                                },
                                child: GameBoardWidget(
                                  tiles: controller.reactiveBoardCells,
                                )),
                            const SizedBox(height: 15),
                            Obx(
                              () => (GameActionableWidget(
                                onUndoPressed: () {
                                  _animationController.stop();
                                  controller.undo();
                                },
                                onNewGamePressed: () {
                                  _animationController.stop();
                                  controller.reset();
                                },
                                score: controller.score.value,
                                isGameOver: controller.isGameOver.value,
                              )),
                            ),
                          ],
                        ),
                        Obx(() => GameOverWidget(
                            shouldShow: controller.isGameOver.value,
                            callback: () {
                              controller.reset();
                            })),
                        ...commentWidgets
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }

  void onSwipedDetected(SwipeDirection direction) {
    switch (direction) {
      case SwipeDirection.up:
        controller.moveUp();
        break;
      case SwipeDirection.down:
        controller.moveDown();
        break;
      case SwipeDirection.left:
        controller.moveLeft();
        break;
      case SwipeDirection.right:
        controller.moveRight();
        break;
    }
  }

  void handleKeyEvent(RawKeyEvent event) {
    var currentKeyStrokeTime = DateTime.now().millisecondsSinceEpoch;
    if (currentKeyStrokeTime - lastKeyStrokeTime < 5) {
      lastKeyStrokeTime = currentKeyStrokeTime;
      return;
    }
    lastKeyStrokeTime = currentKeyStrokeTime;
    SwipeDirection? direction;
    if (event.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
      direction = SwipeDirection.up;
    } else if (event.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
      direction = SwipeDirection.down;
    } else if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
      direction = SwipeDirection.left;
    } else if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
      direction = SwipeDirection.right;
    }
    if (direction != null) {
      onSwipedDetected(direction);
    }
  }
}
