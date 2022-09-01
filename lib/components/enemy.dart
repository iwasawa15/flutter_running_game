import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';

import '../game/constants.dart';

class Enemy extends SpriteAnimationComponent {
  final double _animationSpeed = 0.15;
  final double speed = 200;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    final spriteSheet = SpriteSheet.fromColumnsAndRows(
        image: await Images().load('enemies/Snake/Snake_walk.png'),
        columns: 4,
        rows: 1);
    animation = spriteSheet.createAnimation(
        row: 0, stepTime: _animationSpeed, from: 0, to: 4);
  }

  @override
  void update(double dt) {
    super.update(dt);

    x -= speed * dt;
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    height = width = size.x / numberOfTilesAlongWidth;
    x = size.x - width;
    y = size.y - height - groundHeight;
  }
}
