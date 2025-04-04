import 'dart:async';
import 'package:flame/game.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:practice_game/player.dart';
import 'package:practice_game/trash.dart';

class GamePage extends FlameGame with TapCallbacks {
  late Player player;

  @override
  Future<void> onLoad() async {
    player = Player(position: Vector2(size.x / 2, 0));
    final trash = Trash(position: Vector2(size.x / 2, size.y - 100));

    add(player);
    add(trash);
  }

  @override
  void onTapDown(TapDownEvent event) {
    // Move left or right based on tap position
    if (event.localPosition.x < size.x / 2) {
      player.moveLeft = true;
      player.moveRight = false;
    } else {
      player.moveRight = true;
      player.moveLeft = false;
    }
  }

  @override
  void onTapUp(TapUpEvent event) {
    // Stop movement when finger is lifted
    player.moveLeft = false;
    player.moveRight = false;
  }

  @override
  Color backgroundColor() {
    // TODO: implement backgroundColor
    return Color(0xffd0d0d0);
  }
}
