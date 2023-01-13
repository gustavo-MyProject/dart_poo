import 'package:poo/poo_exemplo.dart';

abstract class Trabalho {
  //Metodos abstratos não necessitam de corpo, e tambem podem ser feitos em classes não abstratas!
  int trabalhar(); //"?" Aqui indica que a função pode retornar um valor nulo
  void cracha(Pessoa pessoa);
  int calcularSalario(int horasTrabalhadas); //"Metodo privado"
}

//Classes podem ser implicitamente interfaces, onde todos o metodos da
//classe que esta sendo extendida são automaticamente marcados implicitamente com @override
class Humano {
  //Dart não term modificadores de acesso como java, mas pode ser usado o simbolo "_" para limitar o acesso por arquivo
  final String _nome;
  final int _idade;

  Humano(this._nome, this._idade);

  String qualNome() {
    return _nome;
  }

  int qualIdade() {
    return _idade;
  }
}

class Programador extends Trabalho {
  int salario; //"?" indica que a variavel pode ser nula

  Programador(
      [this.salario =
          0]); //O parentese no construtor indica que o argumento é opcional

  //Quando um metodo abstrato é herdado, é obrigatorio a implementção por override
  @override
  int trabalhar() {
    print("Trabalhando...");
    return salario;
  }

  @override
  void cracha(Pessoa pessoa) {
    print(pessoa.qualIdade());
    print(pessoa.qualNome());
  }

  @override
  int calcularSalario(int horasTrabalhadas) {
    int a = trabalhar();
    int salarioFinal = a * horasTrabalhadas;

    return salarioFinal;
  }
}
