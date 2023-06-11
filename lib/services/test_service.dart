import '../models/sujeto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TestServices {
  void addTest(Sujeto sujeto) {
    FirebaseFirestore.instance.collection('tests').add({
      'COD': sujeto.codigo,
      'Dd': sujeto.puntuacionDirecta,
      'SpanDd': sujeto.puntuacionDirectaSpan,
      'Di': sujeto.puntuacionInversa,
      'SpanDi': sujeto.puntuacionInversaSpan,
      'Dc': sujeto.puntuacionCreciente,
      'SpanDc': sujeto.puntuacionCrecienteSpan,
      'fecha': sujeto.fecha,
    });
  }

  Stream<QuerySnapshot> getStream() =>
      FirebaseFirestore
          .instance
          .collection('tests')
          .orderBy('COD')
          .snapshots();

  void deleteTest(String codigo)async{
    var colletion = FirebaseFirestore.instance.collection('tests');
    var snapshot = await colletion.where('COD', isEqualTo: codigo).get();
    await snapshot.docs.first.reference.delete();

  }

}
