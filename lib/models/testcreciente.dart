class TestCreciente{

  int aciertos = 0;
  int span = 0;
  int fallosEnItem = 0;
  int contEjemplo = 0;

  int _posDeGrupo = 0;
  int _posElemento = 0;


  static const _numeroOrdenCreciente = [
    [
      [3, 1],
      [8, 6]

    ],

    [
      [5, 2, 4],
      [4, 3, 2]

    ],

    [
      [4, 1],
      [3, 2]

    ],

    [
      [5, 2, 7],
      [1, 8, 6]

    ],

    [
      [7, 5, 8, 1],
      [4, 2, 9, 3]

    ],

    [
      [1, 5, 6, 2, 8],
      [2, 8, 4, 7, 9]

    ],

    [
      [3, 3, 6, 1, 5],
      [4, 9, 4, 6, 9]

    ],

    [
      [8, 5, 2, 5, 3, 7],
      [6, 1, 4, 7, 9, 1]

    ],

    [
      [9, 7, 9, 6, 2, 6, 8],
      [3, 1, 7, 5, 1, 8, 5]

    ],

    [
      [6, 9, 6, 2, 1, 3, 7, 9 ],
      [1, 4, 8, 5, 4, 8, 7, 4]

    ],

    [
      [2, 5, 7, 7, 4, 8, 7, 5, 2],
      [9, 1, 8, 3, 6, 3, 9, 2, 6]

    ],
  ];

  static get numeroOrdenCreciente => _numeroOrdenCreciente;

  String correto(){


    if (contEjemplo < 4){
      contEjemplo ++;
    }else{
      aciertos++;
      span = _numeroOrdenCreciente[_posDeGrupo][_posElemento].length;
    }

    if (_posElemento == 0){
      _posElemento++;
      return _numeroOrdenCreciente[_posDeGrupo][_posElemento].toString();
    }else{
      _posElemento = 0;
      _posDeGrupo++;
      if(_posDeGrupo < _numeroOrdenCreciente.length){
        return _numeroOrdenCreciente[_posDeGrupo][_posElemento].toString();
      }else{
        return 'terminado';
      }
    }
  }

  String incorrecto(){
    if (contEjemplo < 4){
      contEjemplo ++;
    }else{
      fallosEnItem++;
    }

    if (_posElemento == 0){
      _posElemento++;
      return _numeroOrdenCreciente[_posDeGrupo][_posElemento].toString();
    }else{

      if (fallosEnItem == 2){
        return'terminado';
      }else{
        fallosEnItem = 0;
        _posElemento = 0;
        _posDeGrupo++;
        if(_posDeGrupo < _numeroOrdenCreciente.length){
          return _numeroOrdenCreciente[_posDeGrupo][_posElemento].toString();
        }else{
          return 'terminado';
        }
      }

    }

  }
}