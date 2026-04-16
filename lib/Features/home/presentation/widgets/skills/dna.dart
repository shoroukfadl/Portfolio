// ملاحظة: دي فكرة برمجية تعتمد على محرك Forge2D
import 'package:flame/game.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';

class MyPortfolioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("My Technical Skills", style: TextStyle(fontSize: 24)),
          // هنا بنعرض صندوق الفيزياء
          Container(
            height: 400, // حددي المساحة اللي اللعبة هتظهر فيها
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: GameWidget(
                game: PhysicsSkillsGame(), // الكود اللي كتبناه قبل كدة
              ),
            ),
          ),
          const Text("Drag skills to interact!"),
        ],
      ),
    );
  }
}

// 1. اللعبة الأساسية
class PhysicsSkillsGame extends Forge2DGame {
  PhysicsSkillsGame() : super(gravity: Vector2(0, 15)); // جاذبية لتحت

  @override
  Future<void> onLoad() async {
    // إضافة الأرضية
    add(Ground(size));

    // إضافة عينة من المهارات
    add(SkillBody(Vector2(size.x / 2, 0), "Flutter", Colors.blue));
    add(SkillBody(Vector2(size.x / 2 + 20, -50), "Dart", Colors.cyan));
    add(SkillBody(Vector2(size.x / 2 - 20, -100), "Firebase", Colors.orange));
  }
}

// 2. تعريف المهارة كجسم فيزيائي
class SkillBody extends BodyComponent with ContactCallbacks {
  final Vector2 position;
  final String label;
  final Color color;

  SkillBody(this.position, this.label, this.color);

  @override
  Body createBody() {
    final shape = CircleShape()..radius = 4; // حجم الدائرة

    final fixtureDef = FixtureDef(shape)
      ..restitution = 0.7 // نسبة الارتداد (تخليها تنط)
      ..density = 1.0 // الوزن
      ..friction = 0.2; // الاحتكاك

    final bodyDef = BodyDef()
      ..type = BodyType.dynamic
      ..position = position;

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void render(Canvas canvas) {
    // رسم شكل جمالي فوق الجسم الفيزيائي
    final paint = Paint()..color = color;
    canvas.drawCircle(Offset.zero, 4, paint);
  }
}

// 3. الأرضية عشان المهارات متقعش في الفراغ
class Ground extends BodyComponent {
  final Vector2 gameSize;

  Ground(this.gameSize);

  @override
  Body createBody() {
    final shape = EdgeShape()
      ..set(Vector2(0, gameSize.y - 10), Vector2(gameSize.x, gameSize.y - 10));
    final bodyDef = BodyDef()..type = BodyType.static;
    return world.createBody(bodyDef)..createFixture(FixtureDef(shape));
  }
}
