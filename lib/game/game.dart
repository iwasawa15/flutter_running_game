import 'package:flame/game.dart';
import 'package:run_game/components/player.dart';

class RunGame extends FlameGame {
  final _player = Player();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(_player);

    _player.position = Vector2(100, 50);
  }
}
