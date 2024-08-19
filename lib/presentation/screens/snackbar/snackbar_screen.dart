import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackBarScreen({super.key});
  void showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text('Tienes un nuevo mensaje!'),
      action: SnackBarAction(
        label: 'Ok!',
        onPressed: () {},
      ),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, //No cerrar dialogo si se pulsa afuera del diálogo
//builder se construye en tiempo de ejecución
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text(
          'Laborum aliquip laborum velit est ex amet anim occaecat cillum aliqua eiusmod. Aliqua incididunt consequat esse deserunt laborum commodo nostrud consectetur ea proident aliquip exercitation excepteur. Sunt elit ex magna dolor eiusmod ullamco non ullamco. Ea proident quis eiusmod adipisicing. Reprehenderit cillum tempor fugiat tempor fugiat proident voluptate aliqua ea. Ipsum est esse mollit enim anim reprehenderit qui laboris id do mollit tempor cupidatat consequat.',
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => context.pop(),
            child: const Text('Aceptar'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackBar(context),
        label: const Text('Show Snackbar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () {
                showAboutDialog(context: context);
              },
              child: const Text('Licencias usadas'),
            ),
            FilledButton.tonal(
              onPressed: () {
                openDialog(context);
              },
              child: const Text('Mostrar diálogos'),
            ),
          ],
        ),
      ),
    );
  }
}
