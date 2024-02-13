import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_imc/contador/contador_controller.dart';

class ContadorPage extends StatelessWidget {
  final controller = ContadorController();

  ContadorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Contador Mobx'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            
            Observer(
              builder: (_) {
                return Text(
                  '${controller.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            
            Observer(
              builder: (_) {
                return Text(
                  controller.fullName.first,
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            
            Observer(
              builder: (_) {
                return Text(
                  controller.fullName.last,
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            
            Observer(
              builder: (_) {
                return Text(
                  controller.saldacao,
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
