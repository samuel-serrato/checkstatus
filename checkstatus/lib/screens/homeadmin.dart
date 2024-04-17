import 'package:flutter/material.dart';

void main() {
  runApp(homeAdmin());
}

class homeAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Check Status',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AdminScreen(),
    );
  }
}

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  List<Map<String, dynamic>> orders = [
    {"id": 1, "description": "Escritura de terreno en Costa Azul", "status": "En preparación"},
    {"id": 2, "description": "Order 2", "status": "Entregado"},
    {"id": 3, "description": "Order 3", "status": "En preparación"},
    {"id": 4, "description": "Order 4", "status": "En tramite"},
    {"id": 5, "description": "Order 5", "status": "En preparación"},
    {"id": 6, "description": "Order 6", "status": "Entregado"},
    {"id": 7, "description": "Order 7", "status": "En tramite"},
    {"id": 8, "description": "Order 8", "status": "En tramite"},
    {"id": 9, "description": "Order 9", "status": "En preparación"},
    {"id": 10, "description": "Order 10", "status": "Entregado"},
  ];

  @override
  Widget build(BuildContext context) {
        double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 128, 9, 0),
        title: Text('Admin Dashboard', style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    columns: [
                      DataColumn(label: SizedBox(width: screenWidth * 0.05, child: Text('ID'))),
                      DataColumn(label: SizedBox(width: screenWidth * 0.5, child: Text('Descripción'))),
                      DataColumn(label: SizedBox(width: screenWidth * 0.1, child: Text('Estado'))),
                    ],
                    rows: orders.map((order) {
                      return DataRow(cells: [
                        DataCell(Text(order['id'].toString())),
                        DataCell(Text(order['description'])),
                        DataCell(
                          DropdownButton<String>(
                            value: order['status'],
                            items: <String>['En preparación', 'En tramite', 'Entregado'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                order['status'] = newValue!;
                              });
                            },
                          ),
                        ),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
