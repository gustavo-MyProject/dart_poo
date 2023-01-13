import 'package:poo/mixin.dart'; //Importando direto
import 'package:poo/classe_abstrata.dart'
    as ca; //Importando com uma "alias"(utilisando um nome para a lib)

//A classe Humano esta sendo usada como interface
class Pessoa implements ca.Humano {
  int idade = 0;
  String nome;

  //Nota se nessesario colocar ca para acessar a classe Humano e Programador.
  ca.Programador programador = ca.Programador();

  //Não da para pegar as variveis de uma interface, logo há
  //a necessidade de criar novas
  Pessoa(this.idade, this.nome);

  @override
  int qualIdade() {
    return idade;
  }

  @override
  String qualNome() {
    return nome;
  }
}

//Não se pode extender uma classe e implementar uma interface como em    \\
//C# e java.                                                             \\
//EX: class PessoaMaisCapaz implements Humano extends Trabalho {}        \\
//                                                                       \\
//Mas pode implementar diversas interfaces em uma classe                 \\
//EX: class PessoaMaisCapaz implements Trabalho, Hobby, Cronograma {...} \\

//Exemplo de sistema de EC usado em jogos

class Player extends Entity
    with PlayerControlledEntity, Transform, HPSystem, Tag {
  Player(int hitPoints) {
    hp = hitPoints;
    generateTag();
  }

  @override
  void handleInput() {}

  @override
  void update() {
    updateHealth();
    print("HP: $hp");
    print("Is player dead: $isDead");
  }

  @override
  void draw() {}
}

class Orc extends Entity with NPC, Transform, HPSystem, Tag {
  Orc(int hitPoints) {
    hp = hitPoints;
    generateTag();
  }

  @override
  void draw() {}

  @override
  void update() {
    updateHealth();
    print("HP: $hp");
    print("Is orc $tag dead: $isDead");
  }
}
