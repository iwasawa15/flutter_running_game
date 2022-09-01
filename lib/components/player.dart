import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:run_game/game/constants.dart';

class Player extends SpriteAnimationComponent {
  double yMax = 0;
  double ySpeed = 0;
  final double _animationSpeed = 0.15;
  int jumpCount = 0;
  late final SpriteAnimation _idleAnimation;
  late final SpriteAnimation _runAnimation;
  late final SpriteAnimation _jumpAnimation;
  late final SpriteAnimation _hitAnimation;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    _loadAnimations().then((_) => {animation = _idleAnimation});
  }

  @override
  void update(double dt) {
    super.update(dt);

    ySpeed += gravity * dt;
    y += 0.5 * ySpeed * dt;

    if (isOnGround()) {
      y = yMax;
      ySpeed = 0.0;
      jumpCount = 0;
    }
  }

  Future<void> _loadAnimations() async {
    final spriteSheet = SpriteSheet.fromColumnsAndRows(
        image: await Images().load('doux_spritesheet.png'),
        rows: 1,
        columns: 24);

    _idleAnimation = spriteSheet.createAnimation(
        row: 0, stepTime: _animationSpeed, from: 0, to: 4);

    _runAnimation = spriteSheet.createAnimation(
        row: 0, stepTime: _animationSpeed, from: 4, to: 10);

    _jumpAnimation = spriteSheet.createAnimation(
        row: 0, stepTime: _animationSpeed, from: 12, to: 14);

    _hitAnimation = spriteSheet.createAnimation(
        row: 0, stepTime: _animationSpeed, from: 15, to: 17);
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    height = width = size.x / numberOfTilesAlongWidth;
    x = width;
    y = size.y - height - groundHeight;
    yMax = y;
  }

  bool isOnGround() {
    return (y >= yMax);
  }

  void run() {
    animation = _runAnimation;
  }

  void hit() {
    animation = _hitAnimation;
  }

  void jump() {
    if (jumpCount > 1) {
      return;
    }
    animation = _jumpAnimation;
    ySpeed = -1000;
    jumpCount += 1;
  }
}
