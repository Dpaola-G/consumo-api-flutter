import 'package:flutter/material.dart';
import 'maquina1.dart';
import 'seguimiento.dart';  // Importa la nueva página de seguimiento

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee App',

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _selectedMaquina;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee App'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Seleccione la maquina a usar en el proceso'),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(5, (index) {
                  int machineNumber = index + 1;
                  return ElevatedButton(
                    onPressed: () {
                      if (machineNumber == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Maquina1Page()),
                        );
                      } else {
                        setState(() => _selectedMaquina = 'Maquina $machineNumber');
                      }
                    },
                    child: Text('$machineNumber'),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor: _selectedMaquina == 'Maquina $machineNumber' ? Colors.lightBlue : null,
                    ),
                  );
                }),
              ),
              SizedBox(height: 16.0),  // Añade un espacio entre los botones y el botón de seguimiento
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SeguimientoPage()),
                  );
                },
                child: Text('Seguimiento'),
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}
