import 'package:mobx/mobx.dart';
part 'future_controller.g.dart';

class FutureController = FutureControllerBase with _$FutureController;

abstract class FutureControllerBase with Store {
  @observable
  // ObservableFuture<String> name = Future.value('').asObservable();
  ObservableFuture<String> nome = ObservableFuture.value('');

  Future<void> buscarNome() async {
    final buscaNomeFuture =
        Future.delayed(const Duration(seconds: 2), () => 'Jack').asObservable();

    // nome = buscaNomeFuture.asObservable();
    nome = ObservableFuture(buscaNomeFuture);
  }
}
