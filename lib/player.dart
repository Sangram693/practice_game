import 'package:flame/components.dart';

class Player extends SpriteComponent {
  Player({required Vector2 position}) : super(position: position, size: Vector2(100, 200));

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('plastic-water-bottle-empty.jpg');
    anchor = Anchor.center;
  }
}
