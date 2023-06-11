class TestInverso{

  int aciertos = 0;
  int span = 0;
  int fallosEnItem = 0;

  int contEjemplo = 0;

  int _posDeGrupo = 0;
  int _posElemento = 0;




  static const _numeroOrdenInverso = [
    [
      [9 , 4],
      [5 , 6]

    ],

    [
      [2 , 1],
      [1 , 3]

    ],

    [
      [3 , 9],
      [8 , 5]

    ],

    [
      [2, 3, 6],
      [5, 4, 1]

    ],

    [
      [4, 5, 8],
      [2, 7, 5]

    ],

    [
      [7, 4, 5, 2],
      [9, 3, 8, 7]

    ],

    [
      [2, 1, 7, 9, 4],
      [5, 6, 3, 8, 7]

    ],

    [
      [8, 1, 5, 2, 4, 3, 6],
      [4, 3, 7, 9, 2, 8, 1]

    ],

    [
      [3, 1, 7, 9, 4, 6, 8, 2],
      [9, 8, 1, 6, 3, 2, 4, 7]

    ],
  ];

  static get numeroOrdenInverso => _numeroOrdenInverso;

  String correto(){


    if (contEjemplo < 2){
      contEjemplo ++;
    }else{
      aciertos++;
      span = _numeroOrdenInverso[_posDeGrupo][_posElemento].length;
    }

    if (_posElemento == 0){
      _posElemento++;
      return _numeroOrdenInverso[_posDeGrupo][_posElemento].toString();
    }else{
      _posElemento = 0;
      _posDeGrupo++;
      if(_posDeGrupo < _numeroOrdenInverso.length){
        return _numeroOrdenInverso[_posDeGrupo][_posElemento].toString();
      }else{
        return 'terminado';
      }
    }
  }

  String incorrecto(){
    if (contEjemplo < 2){
      contEjemplo ++;
    }else{
      fallosEnItem++;
    }

    if (_posElemento == 0){
      _posElemento++;
      return _numeroOrdenInverso[_posDeGrupo][_posElemento].toString();
    }else{

      if (fallosEnItem == 2){
        return'terminado';
      }else{
        fallosEnItem = 0;
        _posElemento = 0;
        _posDeGrupo++;
        if(_posDeGrupo < _numeroOrdenInverso.length){
          return _numeroOrdenInverso[_posDeGrupo][_posElemento].toString();
        }else{
          return 'terminado';
        }
      }

    }

  }
}