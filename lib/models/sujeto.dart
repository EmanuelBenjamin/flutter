class Sujeto{
  String _codigo;

  String get codigo => _codigo;
  int _puntuacionDirecta = 0;
  int _puntuacionDirectaSpan = 0;
  int _puntuacionInversa = 0;
  int _puntuacionInversaSpan = 0;
  int _puntuacionCreciente = 0;
  int _puntuacionCrecienteSpan = 0;
  String _fecha = '';

  Sujeto({required String codigo}):
        _codigo = codigo;


  set codigo(String value) {
    _codigo = value;

  }
  int get puntuacionDirecta => _puntuacionDirecta;
  set puntuacionDirecta(int value) {
    _puntuacionDirecta = value;
  }

  int get puntuacionDirectaSpan => _puntuacionDirectaSpan;
  set puntuacionDirectaSpan(int value) {
    _puntuacionDirectaSpan = value;
  }

  int get puntuacionInversa => _puntuacionInversa;
  set puntuacionInversa(int value) {
    _puntuacionInversa = value;
  }

  int get puntuacionInversaSpan => _puntuacionInversaSpan;
  set puntuacionInversaSpan(int value) {
    _puntuacionInversaSpan = value;
  }

  int get puntuacionCreciente => _puntuacionCreciente;
  set puntuacionCreciente(int value) {
    _puntuacionCreciente = value;
  }

  int get puntuacionCrecienteSpan => _puntuacionCrecienteSpan;
  set puntuacionCrecienteSpan(int value) {
    _puntuacionCrecienteSpan = value;
  }

  String get fecha => _fecha;
  set fecha(String value) {
    _fecha = value;
  }

}
