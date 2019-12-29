class Estabelecimento{
   String _nome;
   int _distancia;
   int _tempoMedio;

   Estabelecimento(String nome, int distancia, int tempoMedio){
      _nome = nome;
      _distancia = distancia;
      _tempoMedio = tempoMedio;
   }



get nome => _nome;
get distancia => _distancia;
get tempoMedio => _tempoMedio;

set nome(String nome){nome =_nome;}
set distancia(int distancia){distancia = _distancia;}
set tempoMedio(int tempoMedio){tempoMedio = _tempoMedio;}


    @override
    String toString() {
        return "nome = $_nome, distancia = $_distancia, tempoMedio = $_tempoMedio";
    }
}