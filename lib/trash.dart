import 'package:flame/components.dart';

class Trash extends SpriteComponent with HasGameRef {

  Trash({required Vector2 position})
      : super(position: position, size: Vector2(100, 200));

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('blue-bin_200x320.jpg');
    anchor = Anchor.center;
    position = Vector2(gameRef.size.x / 2, gameRef.size.y - size.y / 2);
  }

}
