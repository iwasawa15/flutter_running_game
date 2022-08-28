import 'package:flame/components.dart';
import 'package:flame/parallax.dart';

class Parallax extends ParallaxComponent {
  @override
  Future<void> onLoad() async {
    parallax = await gameRef.loadParallax([
      ParallaxImageData('parallax/parallax.png'),
    ],
		baseVelocity: Vector2(100, 0)
		);
  }
}