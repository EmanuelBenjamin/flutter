import 'package:flutter/material.dart';
import 'package:test_digitos_wisc/provider/testprovider.dart';
import 'package:test_digitos_wisc/screens/test_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test_digitos_wisc/services/test_service.dart';
import 'package:test_digitos_wisc/widgets/test_item_widgets.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (_)=> CustomTestProvider(),
          child: const MyApp(),

      )
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context,snapshot){
        if (snapshot.hasError){
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Error De Conexion',
              theme: ThemeData(
                primarySwatch: Colors.cyan,
              ),
              home: Container()


          );
        }
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData){
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Test Digitos Wisc',
              theme: ThemeData(
                primarySwatch: Colors.cyan,
              ),
              home: MyHome()
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}

class MyHome extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar: AppBar(
        title: Text('Pagina Principal'),
      ),
      body: StreamBuilder(
        stream: TestServices().getStream(),
        builder: (context,tests){
          if (tests.hasError){
            return Text('Error de conexion');
          }
          if (tests.hasData){
            final data = tests.data;
            if (data!= null){
              return ListView.builder(
                itemExtent: 60,
                  itemCount: data.docs.length,
                  itemBuilder: (context, index) {
                    return TestItem(data.docs[index]);
                  }
              );
            }
          }
          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => TestScreen()));
        },
        tooltip: 'Nuevo Test',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );

  }
}