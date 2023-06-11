class TestDirecto{
  static const _numeroOrdenDirecto = [
    [
      [2 , 9],
      [6 , 4]

    ],

    [
      [3, 9, 6],
      [6, 5, 2]

    ],

    [
      [6, 4, 1, 7],
      [9, 1, 6, 8]

    ],

    [
      [8, 2, 1, 9, 6],
      [7, 2, 3, 4, 9]

    ],

    [
      [5, 7, 3, 6, 4, 8],
      [3, 8, 4, 1, 7, 5]

    ],

    [
      [2, 1, 8, 9, 4, 3, 7],
      [7, 8, 5, 2, 1, 6, 3]

    ],

    [
      [1, 8, 4, 3, 7, 5, 3, 6],
      [2, 7, 9, 6, 3, 1, 4, 8]

    ],

    [
      [7, 2, 6, 1, 9, 4, 8, 3, 5],
      [4, 3, 8, 9, 1, 7, 5, 6, 2]

    ],

    [
      [6, 2, 5, 3, 1, 8, 9, 5, 4, 3],
      [9, 4, 3, 8, 7, 5, 2, 9, 6, 1]

    ],
  ];

  static get numeroOrdenDirecto => _numeroOrdenDirecto;

  int aciertos = 0;
  int span = 0;
  int fallosEnItem = 0;

  int _posDeGrupo = 0;
  int _posElemento = 0;

  String correto(){
    aciertos++;

    if (_numeroOrdenDirecto[_posDeGrupo][_posElemento].length > 2){
      span = _numeroOrdenDirecto[_posDeGrupo][_posElemento].length - 1;
    }
    if (_posElemento == 0){
      _posElemento++;
      return _numeroOrdenDirecto[_posDeGrupo][_posElemento].toString();
    }else{
      _posElemento = 0;
      _posDeGrupo++;
      if(_posDeGrupo < _numeroOrdenDirecto.length){
        return _numeroOrdenDirecto[_posDeGrupo][_posElemento].toString();
      }else{
        return 'terminado';
      }
    }
  }
  String incorrecto(){
    fallosEnItem++;


    if (_numeroOrdenDirecto[_posDeGrupo][_posElemento].length > 2){
      span = _numeroOrdenDirecto[_posDeGrupo][_posElemento].length - 1;
    }
    if (_posElemento == 0){
      _posElemento++;
      return _numeroOrdenDirecto[_posDeGrupo][_posElemento].toString();
    }else{

      if (fallosEnItem == 2){
        return'terminado';
      }else{
        fallosEnItem = 0;
        _posElemento = 0;
        _posDeGrupo++;
        if(_posDeGrupo < _numeroOrdenDirecto.length){
          return _numeroOrdenDirecto[_posDeGrupo][_posElemento].toString();
        }else{
          return 'terminado';
        }
      }

    }

  }
}