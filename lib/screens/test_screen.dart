import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_digitos_wisc/provider/testprovider.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _testProvider = Provider.of<CustomTestProvider>(context);
    final _textController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
            title: Text('Pagina de test'),
            actions:[
              _testProvider.testStarted
              ?IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder:(BuildContext context){
                      return AlertDialog(
                        title: Text('Realmente Deseas Parar el Test?'),
                        actions: [
                          TextButton(
                            onPressed: (){
                              _testProvider.pararTest();
                              Navigator.pop(context);
                            },
                            child: Text('Parar Test', style: const TextStyle(
                                color: Colors.white
                            )),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.red,

                            ),
                          ),
                          TextButton(
                              onPressed:(){
                                Navigator.pop(context);
                              },
                              child: const Text('Cancelar')
                          )
                        ],
                      );
                    }
                );
              },
              icon: Icon(Icons.stop))
                  :Container()
          ]
        ),
        body: Center(
          child: _testProvider.testStarted
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${_testProvider.testActualString}'),
                    _testProvider.pruebaTest
                    ? Text('Ejemplo',style: TextStyle(color: Colors.green),)
                    :Container(),
                    SizedBox(height: 20,),
                    Text('${_testProvider.numerosEnPantalla}'),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _testProvider.testTerminado
                    ? const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Test Finalizado', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
                    )
                    :Container(),
                    ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Comenzar Text'),
                                  content: TextField(
                                    decoration: InputDecoration(
                                        hintText: 'Introduce el codigo'),
                                    controller: _textController,
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          _testProvider.comenzarTest(
                                              _textController.text);
                                          Navigator.pop(context);
                                        },
                                        child: Text('Comenzar'))
                                  ],
                                );
                              });
                        },
                        child: Text('Comenzar Test'))
                  ],
                ),
        ),
        floatingActionButton: _testProvider.testStarted
            ? Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        _testProvider.incorrecto();
                      },
                      child: Icon(Icons.close),
                      backgroundColor: Colors.red,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        _testProvider.correcto();
                      },
                      child: Icon(Icons.done),
                      backgroundColor: Colors.green,
                    ),
                  )
                ],
              )
            : Container());
  }
}
