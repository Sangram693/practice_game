import 'dart:async';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:practice_game/player.dart';

class GamePage extends FlameGame {
  @override
  FutureOr<void> onLoad() async {
    final player = Player(position: Vector2(size.x / 2, size.y / 2));
    add(player);
  }

  @override
  Color backgroundColor() {
    return const Color(0xff8ac565);
  }
}
