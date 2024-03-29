import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_imc/observables/modelo_observado/modelo_observado_controller.dart';

class ModeloObservado extends StatefulWidget {
  const ModeloObservado({super.key});

  @override
  State<ModeloObservado> createState() => _ModeloObservadoState();
}

class _ModeloObservadoState extends State<ModeloObservado> {
  final controller = ModeloObservadoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modelo Observado'),
      ),

      body: Column( 
        children: [
          Expanded(
            child: Observer(
              builder: (_) => ListView.builder(
                itemCount: controller.products.length,
                
                itemBuilder: (context, index) => Observer(
                  builder: (_) => CheckboxListTile(
                    value: controller.products[index].seleted,
                    
                    onChanged: (_) {
                      controller.selectedProduct(index);
                    },

                    title: Text(controller.products[index].productModel.name),
                  ),
                ),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              TextButton(
                onPressed: () => controller.addProduct(),
                child: const Text('Adicionar'),
              ),
              TextButton(
                onPressed: () => controller.removeProduct(),
                child: const Text('Remover'),
              ),
              TextButton(
                onPressed: () => controller.loadProducts(),
                child: const Text('Carregar'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
