import 'dart:async';

import 'package:drum/2_beat_game/beat_game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Beat extends SpriteComponent
    with CollisionCallbacks, HasGameReference<BeatGame> {
  // static const beatSize = [80.0, 30.0];

  //Vector2 size = Vector2(beatSize[0], beatSize[1]);

  Beat(
    position,
    this.level,
  ) : super(
          position: position,
          anchor: Anchor.bottomCenter,
          // size: Vector2(
          //   beatSize[0],
          //   beatSize[1],
          // ),
          // children: {
          //   RectangleHitbox(size: Vector2(beatSize[0], beatSize[1])),
          // },
        );
  final int level;
  @override
  Future<void> onLoad() async {
    size =
        Vector2(game.canvasSize.x * 19 / 200, game.canvasSize.x * 19 / 200 / 3);
    add(RectangleHitbox(size: size));
    super.onLoad();
    sprite = await Sprite.load('game/beat.png');
    print("비트생김=======================");
  }

  @override
  void update(double dt) {
    super.update(dt);
    // if (position.y - size.y < 250) {
    //   position.y += 500 * dt;
    // }
    position.y += 200 * dt * level;
    // position.y += 200 * dt;
    // else {
    //   removeFromParent();
    // }
  }

  @override
  void onRemove() {
    print("비트 삭제");
    super.onRemove();
  }
}
