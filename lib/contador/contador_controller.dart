import 'package:mobx/mobx.dart';
import 'package:mobx_imc/model/full_name.dart';

class ContadorController {
  final _counter = Observable<int>(0, name: 'counter observable');

  late Action increment;
  late Computed _saudacaoComputed;

  final _fullName = Observable<FullName>(
    FullName(
      first: 'first',
      last: 'last',
    ),
  );

  ContadorController() {
    increment = Action(_incrementCounter);
    _saudacaoComputed = Computed(() => 'Olá, ${_fullName.value.first} ${_fullName.value.last}');
  }

  int get counter => _counter.value;
  FullName get fullName => _fullName.value;
  String get saldacao => _saudacaoComputed.value;

  void _incrementCounter() {
    _counter.value++;
    // !Não funciona
    // _fullName.value.first = 'James';
    // _fullName.value.last = 'Caio';

    // _fullName.value = FullName(first: 'James', last: 'Caio');
    // O exemplo acima pode ser trocado pelo exemplo abaixo

    // Alterar pelo padrão de projeto prototype  (copywith)
    _fullName.value = _fullName.value.copyWith(first: 'James', last: 'Caio');
  }
}
