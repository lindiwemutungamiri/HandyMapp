import 'worker.dart';

class ServiceDataModel {
  final String name;
  final List<Worker> workers;

  ServiceDataModel({
    required this.name,
    required this.workers,
  });
}
