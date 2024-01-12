import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 1;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Principal'),
      ),
      body: Container(
        color: Colors.lightBlueAccent, // Fondo de color
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Contador: $counter',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenA(counter: counter),
                    ),
                  ).then((value) {
                    // Actualizar el contador después de regresar de la Pantalla A
                    if (value != null) {
                      setState(() {
                        counter = value;
                      });
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Color de fondo del botón
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Ir a Pantalla A'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenB(counter: counter),
                    ),
                  ).then((value) {
                    // Actualizar el contador después de regresar de la Pantalla B
                    if (value != null) {
                      setState(() {
                        counter = value;
                      });
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange, // Color de fondo del botón
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Ir a Pantalla B'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenA extends StatelessWidget {
  final int counter;

  ScreenA({required this.counter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla A'),
      ),
      body: Container(
        color: Colors.lightGreenAccent, // Fondo de color
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Contador en Pantalla A: $counter',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Incrementar el contador y regresar el valor a la Página Principal
                  Navigator.pop(context, counter + 1);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Color de fondo del botón
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Incrementar Contador'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenB extends StatelessWidget {
  final int counter;

  ScreenB({required this.counter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla B'),
      ),
      body: Container(
        color: Colors.deepOrangeAccent, // Fondo de color
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Contador en Pantalla B: $counter',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Incrementar el contador y regresar el valor a la Página Principal
                  Navigator.pop(context, counter + 1);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple, // Color de fondo del botón
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Incrementar Contador'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
