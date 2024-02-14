import 'package:mobx/mobx.dart';
import 'package:mobx_imc/model/product_model.dart';
import 'package:mobx_imc/observables/modelo_observado/model/product_store.dart';
part 'modelo_observado_controller.g.dart';

class ModeloObservadoController = ModeloObservadoControllerBase
    with _$ModeloObservadoController;

abstract class ModeloObservadoControllerBase with Store {
  @observable
  var products = <ProductStore>[].asObservable();

  @action
  void loadProducts() {
    final productsData = [
      ProductStore(
        productModel: ProductModel(name: 'Computador'),
        seleted: false,
      ),
      ProductStore(
        productModel: ProductModel(name: 'Celular'),
        seleted: false,
      ),
      ProductStore(
        productModel: ProductModel(name: 'Teclado'),
        seleted: false,
      ),
      ProductStore(
        productModel: ProductModel(name: 'Mouse'),
        seleted: false,
      ),
    ];
    products.addAll(productsData);
  }

  @action
  void addProduct() {
    products.add(ProductStore(
      productModel: ProductModel(name: 'Tablet'),
      seleted: false,
    ));
  }

  @action
  void removeProduct() {
    products.removeAt(0);
  }

  @action
  void selectedProduct(int index) {
    var productSelected = products[index].seleted;
    products[index].seleted = !productSelected;
  }
}
