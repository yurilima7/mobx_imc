import 'package:mobx/mobx.dart';
import 'package:mobx_imc/model/full_name.dart';

part 'contador_codegen_controller.g.dart';

class ContadorCodegenController = ContadorCodegenControllerBase
    with _$ContadorCodegenController;

abstract class ContadorCodegenControllerBase with Store {
  @observable
  int counter = 0;

  @observable
  FullName fullName = FullName(first: 'first', last: 'last');

  @computed
  String get saudacao =>
      'Olá, ${fullName.first} ${fullName.last}';

  @action
  void increment() {
    counter++;
  }

  @action
  void changeName() {
    fullName = fullName.copyWith(first: 'James', last: 'Caio');
  }

  @action
  void rollBackName() {
    fullName = fullName.copyWith(first: 'first', last: 'last');
  }
}
