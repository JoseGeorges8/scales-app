import 'package:scales_app/data_providers/scales_data_provider/scales_base_provider.dart';
import 'package:scales_app/models/Scale.dart';

class ScalesBasicProvider extends ScalesBaseProvider{


  final List<Scale> _scales = [
    Scale(root: 'C', type: 'Major', notes: ['C', 'D', 'E', 'F', 'G', 'A', 'B']),
    Scale(root: 'D', type: 'Major', notes: ['D', 'E', 'Eb', 'G', 'A', 'B', 'Bb']),
  ];

  @override
  Stream<List<Scale>> scales() async* {
    yield [];
  }

  @override
  List<Scale> getScales(List<String> selectedNotes) {
    if (selectedNotes.isEmpty) return [];
    return List<Scale>.from(_scales).where((scale) => scale.notes.toSet().containsAll(selectedNotes.toSet())).toList();
  }

}