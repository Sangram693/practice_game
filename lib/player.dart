import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flame/collisions.dart';
import 'package:flame/input.dart';

class Player extends SpriteComponent with HasGameRef, CollisionCallbacks {
  late Vector2 velocity;
  final double gravity = 100; // Gravity force
  final double speed = 150;   // Left-Right movement speed
  double groundY = 0;         // Bottom boundary
  bool moveLeft = false;
  bool moveRight = false;

  Player({required Vector2 position})
      : super(position: position, size: Vector2(100, 200));

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('plastic-water-bottle-empty.jpg');
    anchor = Anchor.center;
    velocity = Vector2(0, 0); // Initial velocity
    groundY = gameRef.size.y - size.y / 2; // Bottom limit

    // Add collision
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    velocity.y += gravity * dt; // Apply gravity
    position += velocity * dt;  // Move player down

    // Stop at the bottom
    if (position.y >= groundY) {
      position.y = groundY;
      velocity.y = 0; // Stop movement
    }

    // Move left or right based on input
    if (moveLeft) {
      position.x -= speed * dt;
    }
    if (moveRight) {
      position.x += speed * dt;
    }
  }

  // Handle collision with other objects
  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
   velocity = Vector2(0, 0);
  }
}
