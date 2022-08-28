import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';

class Player extends SpriteAnimationComponent {
  final double _playerSpeed = 300.0;
  final double _animationSpeed = 0.15;
  late final SpriteAnimation _idleAnimation;
  late final SpriteAnimation _runAnimation;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    _loadAnimations().then((_) => {animation = _idleAnimation});
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
  }
}
