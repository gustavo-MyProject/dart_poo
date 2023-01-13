import 'package:poo/poo_exemplo.dart';

//Demonstrar encapsulamento

const int x = 9;
const int y = 5;
const String gritoDeGuerra = "não é uma fase!"; //Teste de string UTF8

class Pai {
  int x;
  int y;
  String segredo =
      "Eu trai a minha mulher"; //varivel não acessivel fora desta classe
  Pai(this.x, this.y);
  //Não pode se fazer "overload" de construtores de forma "classica"
  //como um construtor vazio e um com argumentos
  //EX: Pai();

  void falar() {
    print("Sou o pai \n");
  }

  //Nota: dart não tem suporte para overload de funções
  /*
  void falar(int p) {
    print(p);
  }*/

  void printSegredo() {
    print(segredo);
  }
}

class Filho extends Pai {
  String frase;
  Filho(super.x, super.y,
      this.frase); //Super se refere a classe no qual ele extende

  Filho.rebelde(super.x, super.y)
      : frase =
            gritoDeGuerra; //Construtores nomeados para multiplos construtores

  //Nota: dart não deixa overrides tirarem a assinatura(argumentos) de um metodo
  @override
  void falar() {
    print(frase);
  }

  @override
  void printSegredo() {
    print("Eu sei que o meu pai traiu a minha mãe...");
  }
}

void main() {
  //Como estanciar uma classe
  Pai pai = Pai(3, 5);
  Filho filho = Filho.rebelde(x, y);
  Filho filhoProdigo = Filho(0, 0, "Não sei de nada...");

  //Se prefere a interpolação à concatenação
  print("{${pai.x}, ${pai.y},}");

  pai.falar();
  pai.printSegredo();

  filho.falar();
  filho.printSegredo();

  filhoProdigo.falar();
  filhoProdigo.printSegredo();

  Pessoa pessoa = Pessoa(32, "José");

  pessoa.programador.cracha(pessoa);

  Player p1 = Player(50);
  p1.update();
  print("player one tag: ${p1.tag}");

  Orc orc = Orc(10);
  orc.update();
}
