import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends Disposable {
  HomeBloc() {
    item2$.add([
      "Item 2 01",
      "Item  2 02",
      "Item  2 03",
      "Item  2 04",
      "Item  2 05",
      "Item 2 06",
      "Item  2 07",
      "Item  2 08",
      "Item  2 09",
      "Item  2 10",
    ]);
  }
  //dispose will be called automatically by closing its streams
  var item$ = BehaviorSubject.seeded([
    "Item 01",
    "Item 02",
    "Item 03",
    "Item 04",
    "Item 05",
  ]);

  var item2$ = BehaviorSubject<List<String>>();

  @override
  void dispose() {
    item$.close();
    item2$.close();
  }
}
