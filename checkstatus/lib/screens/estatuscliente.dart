import 'package:flutter/material.dart';

class estatusCliente extends StatefulWidget {
  final String numeroPedido;

  estatusCliente({required this.numeroPedido});

  @override
  _estatusClienteState createState() => _estatusClienteState();
}

class _estatusClienteState extends State<estatusCliente> {
  int currentStatus = 4; // Estado inicial del pedido

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estado del Pedido - ${widget.numeroPedido}'),
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth > 600) {
              // Diseño horizontal
              return Content(
                isHorizontal: true,
                currentStatus: currentStatus,
              );
            } else {
              // Diseño vertical
              return Content(
                isHorizontal: false,
                currentStatus: currentStatus,
              );
            }
          },
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  final bool isHorizontal;
  final int currentStatus;

  Content({required this.isHorizontal, required this.currentStatus});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50),
      height: isHorizontal ? 100.0 : null,
      child: isHorizontal ? _buildHorizontalTimeline() : _buildVerticalTimeline(),
    );
  }

  Widget _buildHorizontalTimeline() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TimelineItem(title: 'Pedido Recibido', icon: Icons.check_circle, isActive: currentStatus >= 1),
          Expanded(
            child: Divider(
              color: currentStatus >= 2 ? Colors.green.withOpacity(0.7) : Colors.grey.withOpacity(0.7),
              thickness: 4.0,
            ),
          ),
          TimelineItem(title: 'En Proceso', icon: Icons.settings, isActive: currentStatus >= 2),
          Expanded(
            child: Divider(
              color: currentStatus >= 3 ? Colors.green.withOpacity(0.7) : Colors.grey.withOpacity(0.7),
              thickness: 4.0,
            ),
          ),
          TimelineItem(title: 'En Camino', icon: Icons.directions_car, isActive: currentStatus >= 3),
          Expanded(
            child: Divider(
              color: currentStatus >= 4 ? Colors.green.withOpacity(0.7) : Colors.grey.withOpacity(0.7),
              thickness: 4.0,
            ),
          ),
          TimelineItem(title: 'Entregado', icon: Icons.check, isActive: currentStatus >= 4),
        ],
      ),
    );
  }

  Widget _buildVerticalTimeline() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        TimelineItem(title: 'Pedido Recibido', icon: Icons.check_circle, isActive: currentStatus >= 1),
        Expanded(
          child: Divider(
            color: currentStatus >= 2 ? Colors.green.withOpacity(0.7) : Colors.grey.withOpacity(0.7),
            thickness: 4.0,
          ),
        ),
        TimelineItem(title: 'En Proceso', icon: Icons.settings, isActive: currentStatus >= 2),
        Expanded(
          child: Divider(
            color: currentStatus >= 3 ? Colors.green.withOpacity(0.7) : Colors.grey.withOpacity(0.7),
            thickness: 4.0,
          ),
        ),
        TimelineItem(title: 'En Camino', icon: Icons.directions_car, isActive: currentStatus >= 3),
        Expanded(
          child: Divider(
            color: currentStatus >= 4 ? Colors.green.withOpacity(0.7) : Colors.grey.withOpacity(0.7),
            thickness: 4.0,
          ),
        ),
        TimelineItem(title: 'Entregado', icon: Icons.check, isActive: currentStatus >= 4),
      ],
    );
  }
}

class TimelineItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isActive;

  TimelineItem({required this.title, required this.icon, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70.0,
          height: 70.0,
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: isActive ? Colors.green : Colors.grey,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 40.0,
          ),
        ),
        SizedBox(height: 5.0),
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
