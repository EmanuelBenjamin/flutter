import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_digitos_wisc/services/test_service.dart';

class TestItem extends StatelessWidget {

  final String codigo;
  final int puntuacionDirecta;
  final int puntuacionDirectaSpan;
  final int puntuacionInversa;
  final int puntuacionInversaSpan;
  final int puntuacionCreciente;
  final int puntuacionCrecienteSpan;
  final String fecha;

  final QueryDocumentSnapshot _snapshot;

  TestItem(this._snapshot)
      :
        codigo = _snapshot.get('COD') as String,
        puntuacionDirecta= _snapshot.get('Dd') as int,
        puntuacionDirectaSpan= _snapshot.get('SpanDd') as int,
        puntuacionInversa= _snapshot.get('Di') as int,
        puntuacionInversaSpan= _snapshot.get('SpanDi') as int,
        puntuacionCreciente= _snapshot.get('Dc') as int,
        puntuacionCrecienteSpan= _snapshot.get('SpanDc') as int,
        fecha = _snapshot.get('fecha') as String;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('$codigo'),
      subtitle:Text('$fecha'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder:(BuildContext context){
                return AlertDialog(
                title: Text("Test $codigo"),
                content: Container(
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text('Puntuacion Directa: $puntuacionDirecta'),
                    Text('Span Directa: $puntuacionDirectaSpan'),
                    Text('Puntuacion Inversa: $puntuacionInversa'),
                    Text('Span Inversa: $puntuacionInversaSpan'),
                    Text('Puntuacion Creciente: $puntuacionCreciente'),
                    Text('Span Creciente: $puntuacionCrecienteSpan'),

                  ]
                  ),
                )


                );
                }
                );
              },
              icon: Icon(Icons.remove_red_eye_sharp)
          ),
          IconButton(
            onPressed:(){
              showDialog(
                  context: context,
                  builder:(BuildContext context){
                    return AlertDialog(
                      title: Text('Realmente Deseas Borrar el Test $codigo?'),
                      actions: [
                        TextButton(
                            onPressed: (){
                              TestServices().deleteTest(codigo);
                              Navigator.pop(context);
                            },
                            child: Text('Borrar',style:const TextStyle(
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
              icon: Icon(Icons.delete)
          )
        ],
      ),
    );
  }


}