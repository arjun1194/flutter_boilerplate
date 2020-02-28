
import 'package:mobx/mobx.dart';
part  "SampleCounter.g.dart";

//class Counter = SampleCounter with $_SampleCounter;

abstract class SampleCounter with Store {
  @observable
  int value = 0;

  @computed
  int getValue() => value;

  @action
  void increment() {
    print("calling the increment method: ");
    value++;
  }

  // asynchronous action
  @action
  Future<void> loadStuff() async {
//    loading = true; //This notifies observers
//    stuff = await fetchStuff();
//    loading = false; //This also notifies observers
  }
//
}
