import 'package:get/get.dart';

enum EventStatus { initial, loading, success, error }

class CounterController extends GetxController {
  final _counter = 0.obs;
  int get counter => _counter.value;
  final status = Rx<EventStatus>(EventStatus.initial);

  @override
  void onInit() {
    super.onInit();
    status.value = EventStatus.loading;
    Future.delayed(Duration(seconds: 5)).then((value) {
      status.value = EventStatus.success;
    });
  }

  void increment() {
    _counter.value += 1;
  }
}
