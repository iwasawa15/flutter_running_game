import 'package:flame/game.dart';
import 'package:run_game/components/parallax.dart';
import 'package:run_game/components/player.dart';

class RunGame extends FlameGame {
  final _player = Player();
  final _parallax = Parallax();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(_parallax);

    add(_player);
    _player.position = Vector2(100, 50);
  }

  @override
  void onGameResize(Vector2 canvasSize) {
    super.onGameResize(canvasSize);

    _player.height = _player.width = canvasSize.x / 10;
    _player.x = _player.width;
  }
}
