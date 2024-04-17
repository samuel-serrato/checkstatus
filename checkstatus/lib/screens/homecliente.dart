import 'package:flutter/material.dart';

void main() {
  runApp(homeCliente());
}

class homeCliente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              // Espacio flexible para alinear la imagen a la izquierda
              Expanded(
                child: Image.asset(
                  'assets/notlogoblanco.png', // Ruta de la imagen
                  height: 50, // Altura deseada de la imagen
                ),
              ),
              // Título en el medio del AppBar
              Expanded(
                flex: 2, // Ajusta la proporción del espacio ocupado por el texto
                child: Center(
                  child: Text(
                    "Estatus de trámite",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              // Espacio flexible para alinear el texto a la derecha
              Expanded(child: Container()), // Espacio vacío para centrar el texto
            ],
          ),
          backgroundColor: Color.fromARGB(255, 128, 9, 0),
          toolbarHeight: 100, // Ajusta la altura del AppBar
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Título
              SizedBox(height: 20.0),
              // Textfield para el número de ID
              TextField(
                decoration: InputDecoration(
                  labelText: "Número de ID",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              // Botón de enviar
              ElevatedButton(
                onPressed: () {
                  // Acción al presionar el botón
                },
                child: Text(
                  "Enviar",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 128, 9, 0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
