import 'package:flutter/foundation.dart';
import 'package:scales_app/data_providers/scales_data_provider/scales_base_provider.dart';
import 'package:scales_app/models/Scale.dart';

class ScalesRepository{
  final ScalesBaseProvider provider;

  ScalesRepository({@required this.provider});

  List<Scale> getScales({List<String> selectedNotes}) => provider.getScales(selectedNotes);

}