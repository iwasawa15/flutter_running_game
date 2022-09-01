import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:run_game/components/enemy.dart';
import 'package:run_game/components/parallax.dart';
import 'package:run_game/components/player.dart';

class RunGame extends FlameGame with HasTappableComponents, TapCallbacks {
  final _player = Player();
  final _parallax = Parallax();
  final _enemy = Enemy();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(_parallax);

    add(_player);
    add(_enemy);
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    _player.jump();
  }
}
