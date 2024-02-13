import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_imc/contador_codegen/contador_codegen_controller.dart';

class ContadorCodegenPage extends StatefulWidget {
  const ContadorCodegenPage({super.key});

  @override
  State<ContadorCodegenPage> createState() => _ContadorCodegenPageState();
}

class _ContadorCodegenPageState extends State<ContadorCodegenPage> {
  final controller = ContadorCodegenController();
  final reactionsDisposer = <ReactionDisposer>[];

  @override
  void initState() {
    super.initState();

    // escuta as variáveis que estão sendo usadas nele
    // roda logo quando criado
    final autorunDisposer = autorun((_) => {
          debugPrint('------------- auto run --------------'),
          debugPrint(controller.fullName.first),
          debugPrint(controller.fullName.last),
        });

    // falamos para o mobx qual o atributo observavel que queremos observar
    // roda somente quando houver uma alteração
    final reactionDisposer = reaction((_) => controller.counter, (counter) {
      debugPrint('------------- reaction --------------');
      debugPrint(counter.toString());
    });

    // Só funciona uma vez
    final whenDisposer = when((_) => controller.fullName.first == 'James', () {
      debugPrint('------------- when --------------');
      debugPrint(controller.fullName.first);
    });

    reactionsDisposer.add(autorunDisposer);
    reactionsDisposer.add(reactionDisposer);
    reactionsDisposer.add(whenDisposer);
  }

  @override
  void dispose() {
    super.dispose();
    for (var reaction in reactionsDisposer) {
      reaction();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Contador Mobx Codegen'),
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
                  controller.saudacao,
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),

            TextButton(
              onPressed: () => controller.changeName(),
              child: const Text('Change Name'),
            ),

            TextButton(
              onPressed: () => controller.rollBackName(),
              child: const Text('Rollback Name'),
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
