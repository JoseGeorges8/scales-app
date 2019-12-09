import 'package:flutter/foundation.dart';
import 'package:scales_app/data_providers/scales_data_provider/scales_base_provider.dart';
import 'package:scales_app/models/Scale.dart';

class ScalesRepository{
  final ScalesBaseProvider provider;

  ScalesRepository({@required this.provider});

  Stream<List<Scale>> scales() => provider.scales();

}