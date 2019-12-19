import 'package:scales_app/data_providers/scales_data_provider/scales_base_provider.dart';
import 'package:scales_app/models/Scale.dart';

class ScalesBasicProvider extends ScalesBaseProvider{


  final List<Scale> _scales = [
    Scale(root: 'C', type: 'Major', notes: ['C', 'D', 'E', 'F', 'G', 'A', 'B']),
    Scale(root: 'D', type: 'Major', notes: ['D', 'E', 'G♭', 'G', 'A', 'B', 'B♭']),
    Scale(root: 'E', type: 'Major', notes: ['E', 'G♭', 'A♭' ,'A',  'B', 'D♭', 'E♭', 'E']),
    Scale(root: 'F', type: 'Major', notes: ['F', 'G', 'A', 'B♭', 'C', 'D', 'E']),
    Scale(root: 'G', type: 'Major', notes: ['G', 'A', 'B', 'C', 'D', 'E', 'G♭']),
    Scale(root: 'A', type: 'Major', notes: ['A', 'B', 'D♭', 'D', 'E', 'G♭', 'A♭']),
    Scale(root: 'B', type: 'Major', notes: ['B', 'D♭', 'E♭', 'E', 'G♭', 'A♭','B♭']),
    Scale(root: 'D♭', type: 'Major', notes: ['D♭', 'E♭', 'F', 'G♭', 'A♭', 'B♭','C']),
    Scale(root: 'E♭', type: 'Major', notes: ['E♭', 'F', 'G', 'A♭', 'B♭', 'C','D']),
    Scale(root: 'G♭', type: 'Major', notes: ['G♭', 'A♭', 'B♭', 'B', 'D♭', 'E♭','F']),
    Scale(root: 'A♭', type: 'Major', notes: ['A♭', 'B♭', 'C', 'D♭', 'E♭', 'F', 'G']),
    Scale(root: 'B♭', type: 'Major', notes: ['B♭', 'C', 'D', 'E♭', 'F', 'G','A']),
    Scale(root: 'C', type: 'Minor', notes: ['C', 'D', 'E♭', 'F', 'G', 'A♭', 'B♭']),
    Scale(root: 'D', type: 'Minor', notes: ['D', 'E', 'F', 'G', 'A', 'B♭', 'C']),
    Scale(root: 'E', type: 'Minor', notes: ['E', 'G♭', 'G' ,'A',  'B', 'C', 'D', 'E']),
    Scale(root: 'F', type: 'Minor', notes: ['F', 'G', 'A♭', 'B♭', 'C', 'D♭', 'E♭']),
    Scale(root: 'G', type: 'Minor', notes: ['G', 'A', 'B♭', 'C', 'D', 'E♭', 'F']),
    Scale(root: 'A', type: 'Minor', notes: ['A', 'B', 'C', 'D', 'E', 'F', 'G']),
    Scale(root: 'B', type: 'Minor', notes: ['B', 'D♭', 'D', 'E', 'G♭', 'G','A']),
    Scale(root: 'D♭', type: 'Minor', notes: ['D♭', 'E♭', 'E', 'G♭', 'A♭', 'A', 'B']),
    Scale(root: 'E♭', type: 'Minor', notes: ['E♭', 'F', 'G♭', 'A♭', 'B♭', 'C♭','D♭']),
    Scale(root: 'G♭', type: 'Minor', notes: ['G♭', 'A♭', 'A', 'B', 'D♭', 'D', 'E']),
    Scale(root: 'A♭', type: 'Minor', notes: ['A♭', 'B♭', 'B', 'D♭', 'E♭', 'G♭', 'A♭']),
    Scale(root: 'B♭', type: 'Minor', notes: ['B♭', 'C', 'D♭', 'E♭', 'F', 'G♭','A♭']),
  ];


  @override
  List<Scale> getScales(List<String> selectedNotes) {
    if (selectedNotes.isEmpty) return [];
    return List<Scale>.from(_scales).where((scale) => scale.notes.toSet().containsAll(selectedNotes.toSet())).toList();
  }

}