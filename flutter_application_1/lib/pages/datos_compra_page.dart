import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/compra_exitosa_page.dart';

class DatosCompraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos de Compra'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(labelText: 'Teléfono'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16),
            DropdownButtonFormField(
              items: ['Contraentrega', 'Contado']
                  .map((medio) => DropdownMenuItem(
                        value: medio,
                        child: Text(medio),
                      ))
                  .toList(),
              onChanged: (value) {
                // Manejar el cambio en el medio de pago
              },
              decoration: InputDecoration(labelText: 'Medio de Pago'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Obtener la dirección mediante geolocalización
                // Puedes implementar aquí la lógica para obtener la dirección

                // Después de completar la compra, navegar a la página de compra exitosa
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CompraExitosaPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(primary: Colors.green),
              child: Text('Comprar'),
            ),
          ],
        ),
      ),
    );
  }
}
