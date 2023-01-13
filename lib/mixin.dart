import 'dart:math';
//Exemplo de sistema de EC usado em jogos

abstract class Entity {
  void update();
  void draw();
}

//classes normais podem ser usadas como mixin, mas podem correr o risco de ser instanciadas
mixin Tag on Entity {
  String tag = "";

  void generateTag() {
    final random = Random();
    const allChars =
        'AaBbCcDdlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1EeFfGgHhIiJjKkL234567890'; // below statement will generate a random string of length using the characters
    // and length provided to it
    final randomString =
        List.generate(10, (index) => allChars[random.nextInt(allChars.length)])
            .join();
    tag = randomString; // return the generated string
  }
}

//tupla
class Tuple<T, V> {
  T a;
  V b;

  Tuple(this.a, this.b);
}

mixin Transform {
  Tuple<double, double> position = Tuple<double, double>(0, 0);
  double rotation = 0;
}

//Um mixin não pode ser instanciado
mixin HPSystem {
  int hp = 0;
  bool isDead = false;

  void updateHealth() {
    if (hp <= 0) {
      isDead = true;
      hp = 0;
    }
  }

  void takeDamage(int source) {
    hp -= source;
    updateHealth();
  }
}

mixin PlayerControlledEntity on Entity {
  void handleInput();

  @override
  void update() {
    print("Controlado pelo um player");
  }

  @override
  void draw() {
    print("Controlado pelo um player");
  }
}

mixin NPC on Entity {
  @override
  void update() {
    print("NPC");
  }

  @override
  void draw() {
    print("NPC");
  }
}
