import 'package:flutter/material.dart';
import 'package:test_digitos_wisc/models/testcreciente.dart';
import 'package:test_digitos_wisc/models/testdirecto.dart';
import 'package:test_digitos_wisc/models/testinverso.dart';
import 'package:test_digitos_wisc/services/test_service.dart';

import '../models/sujeto.dart';

class CustomTestProvider with ChangeNotifier {
  bool testStarted = false;
  bool pruebaTest = false;
  bool testTerminado = false;
  String numerosEnPantalla = '';

  TestDirecto testDirecto = TestDirecto();

  var numerosOrdenDirecto = TestDirecto.numeroOrdenDirecto;
  TestInverso testInverso = TestInverso();
  var numerosInverso =TestInverso.numeroOrdenInverso;

  TestCreciente testCreciente = TestCreciente();
  var numerosCreciente = TestCreciente.numeroOrdenCreciente;

  Sujeto? sujeto;
  TestServices testServices = TestServices();

  String testActualString = '';

  var _testActual = tests.directo;

  get testActual => _testActual;

  void comenzarTest(String codigo) {
    testDirecto = TestDirecto();
    sujeto = Sujeto(codigo: codigo);
    _testActual = tests.directo;
    cambiarStringTestActual(testActual);

    testTerminado = false;
    testStarted = true;
    numerosEnPantalla = numerosOrdenDirecto[0][0].toString();
    notifyListeners();
  }

  void comenzarTestInverso() {
    testInverso = TestInverso();

    _testActual = tests.inverso;
    cambiarStringTestActual(testActual);

    pruebaTest = true;

    numerosEnPantalla = numerosInverso[0][0].toString();
    notifyListeners();
  }

  void comenzarTestCreciente() {
    testCreciente = TestCreciente();

    _testActual = tests.creciente;
    cambiarStringTestActual(testActual);

    pruebaTest = true;

    numerosEnPantalla = numerosCreciente[0][0].toString();
    notifyListeners();
  }

  void pararTest() {
    testStarted = false;
    notifyListeners();
  }

  void finalizarTest() {
    testStarted = false;
    testTerminado = true;

    sujeto!.puntuacionDirecta = testDirecto.aciertos;
    sujeto!.puntuacionDirectaSpan = testDirecto.span;
    sujeto!.puntuacionInversa = testInverso.aciertos;
    sujeto!.puntuacionInversaSpan = testInverso.span;
    sujeto!.puntuacionCreciente = testCreciente.aciertos;
    sujeto!.puntuacionCrecienteSpan = testCreciente.span;

    var fecha= DateTime.now();
    String fechaString = '${fecha.year}/${fecha.month}/${fecha.day}-${fecha.hour}:${fecha.minute}:${fecha.second}';

    sujeto!.fecha = fechaString;


    testServices.addTest(sujeto!);


    notifyListeners();
  }

  void correcto() {
    switch (_testActual) {
      case tests.directo:
        correctoTestDirecto();
        break;
      case tests.inverso:
        correctoTestInverso();
        break;
      case tests.creciente:
        correctoTestCreciente();
        break;
    }
  }

  void incorrecto() {
    switch (_testActual) {
      case tests.directo:
        incorrectoTestDirecto();
        break;
      case tests.inverso:
        incorrectoTestInverso();
        break;
      case tests.creciente:
        incorrectoTestCreciente();
        break;
    }
  }

  void correctoTestDirecto() {
    String resultado = testDirecto.correto();
    if (resultado == 'terminado') {
      comenzarTestInverso();
    } else {
      numerosEnPantalla = resultado;
      notifyListeners();
    }
  }

  void incorrectoTestDirecto() {
    String resultado = testDirecto.incorrecto();
    if (resultado == 'terminado') {
      comenzarTestInverso();
    } else {
      numerosEnPantalla = resultado;
      notifyListeners();
    }
  }


  void correctoTestInverso() {
    String resultado = testInverso.correto();
    if (resultado == 'terminado') {
      comenzarTestCreciente();
    } else {
      if (testInverso.contEjemplo == 2){
        pruebaTest = false;
      }else{
        pruebaTest = true;
      }
      numerosEnPantalla = resultado;
      notifyListeners();
    }
  }

  void incorrectoTestInverso() {
    String resultado = testInverso.incorrecto();
    if (resultado == 'terminado') {
      comenzarTestCreciente();

    } else {
      if (testInverso.contEjemplo == 2){
        pruebaTest = false;
      }else{
        pruebaTest = true;
      }
      numerosEnPantalla = resultado;
      notifyListeners();
    }
  }


  void correctoTestCreciente() {
    String resultado = testCreciente.correto();
    if (resultado == 'terminado') {
      finalizarTest();
    } else {
      if (testInverso.contEjemplo == 4){
        pruebaTest = false;
      }else{
        pruebaTest = true;
      }
      numerosEnPantalla = resultado;
      notifyListeners();
    }
  }

  void incorrectoTestCreciente() {
    String resultado = testCreciente.incorrecto();
    if (resultado == 'terminado') {
      finalizarTest();

    } else {
      if (testCreciente.contEjemplo == 4){
        pruebaTest = false;
      }else{
        pruebaTest = true;
      }
      numerosEnPantalla = resultado;
      notifyListeners();
    }
  }


  void cambiarStringTestActual(var test){
    switch (_testActual) {
      case tests.directo:
        testActualString = 'Test Directo';
        break;
      case tests.inverso:
        testActualString = 'Test Inverso';
        break;
      case tests.creciente:
        testActualString = 'Test Creciente';
        break;
    }
  }
}

enum tests { directo, inverso, creciente }
