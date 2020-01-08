import 'package:scales_app/data_providers/scales_data_provider/scales_base_provider.dart';
import 'package:scales_app/models/Note.dart';
import 'package:scales_app/models/Scale.dart';

class ScalesBasicProvider extends ScalesBaseProvider{


  final List<Scale> _scales = [
    Scale(root: 'C', type: 'Major', notes: ['C', 'D', 'E', 'F', 'G', 'A', 'B'], playableNotes: [Note.C(), Note.D(), Note.E(), Note.F(), Note.G(), Note.A(), Note.B(), Note.C(midi: 72)]),
    Scale(root: 'D♭', type: 'Major', notes: ['D♭', 'E♭', 'F', 'G♭', 'A♭', 'B♭','C'], playableNotes: [Note.dFlat(), Note.eFlat(), Note.F(), Note.gFlat(), Note.aFlat(), Note.bFlat(), Note.C(midi: 72), Note.dFlat(midi: 73)]),
    Scale(root: 'D', type: 'Major', notes: ['D', 'E', 'G♭', 'G', 'A', 'B', 'D♭'], playableNotes: [Note.D(), Note.E(), Note.gFlat(), Note.G(), Note.A(), Note.B(), Note.dFlat(midi: 73), Note.D(midi: 74)]),
    Scale(root: 'E♭', type: 'Major', notes: ['E♭', 'F', 'G', 'A♭', 'B♭', 'C','D'], playableNotes: [Note.eFlat(), Note.F(), Note.G(), Note.aFlat(), Note.bFlat(), Note.C(midi: 72), Note.D(midi: 74), Note.eFlat(midi: 75)]),
    Scale(root: 'E', type: 'Major', notes: ['E', 'G♭', 'A♭' ,'A',  'B', 'D♭', 'E♭'], playableNotes: [Note.E(), Note.gFlat(), Note.aFlat(), Note.A(), Note.B(), Note.dFlat(midi: 73), Note.eFlat(midi: 75), Note.E(midi: 76)]),
    Scale(root: 'F', type: 'Major', notes: ['F', 'G', 'A', 'B♭', 'C', 'D', 'E'], playableNotes: [Note.F(), Note.G(), Note.A(), Note.bFlat(), Note.C(midi: 72), Note.D(midi: 74), Note.E(midi: 76), Note.F(midi: 77)]),
    Scale(root: 'G♭', type: 'Major', notes: ['G♭', 'A♭', 'B♭', 'B', 'D♭', 'E♭','F'], playableNotes: [Note.gFlat(), Note.aFlat(), Note.bFlat(), Note.B(), Note.dFlat(midi: 73), Note.eFlat(midi: 75), Note.F(), Note.gFlat(midi: 78)]),
    Scale(root: 'G', type: 'Major', notes: ['G', 'A', 'B', 'C', 'D', 'E', 'G♭'], playableNotes: [Note.G(), Note.A(), Note.B(), Note.C(midi: 72), Note.D(midi: 74), Note.E(midi: 76), Note.gFlat(midi: 78), Note.G(midi: 79)]),
    Scale(root: 'A♭', type: 'Major', notes: ['A♭', 'B♭', 'C', 'D♭', 'E♭', 'F', 'G'], playableNotes: [Note.aFlat(), Note.bFlat(), Note.C(midi: 72), Note.dFlat(midi: 73), Note.eFlat(midi: 75), Note.F(midi: 77), Note.G(midi: 79), Note.aFlat(midi: 80)]),
    Scale(root: 'A', type: 'Major', notes: ['A', 'B', 'D♭', 'D', 'E', 'G♭', 'A♭'], playableNotes: [Note.A(), Note.B(), Note.dFlat(midi: 73), Note.D(midi: 74), Note.E(midi: 76), Note.gFlat(midi: 78), Note.aFlat(midi: 80), Note.A(midi: 81)]),
    Scale(root: 'B♭', type: 'Major', notes: ['B♭', 'C', 'D', 'E♭', 'F', 'G','A'], playableNotes: [Note.bFlat(), Note.C(midi: 72), Note.D(midi: 74), Note.eFlat(midi: 75), Note.F(midi: 77), Note.G(midi: 79), Note.A(midi: 81), Note.bFlat(midi: 82)]),
    Scale(root: 'B', type: 'Major', notes: ['B', 'D♭', 'E♭', 'E', 'G♭', 'A♭','B♭'], playableNotes: [Note.B(), Note.dFlat(midi: 73), Note.eFlat(midi: 75), Note.E(midi: 76), Note.gFlat(midi: 78), Note.aFlat(midi: 80), Note.bFlat(midi: 82), Note.B(midi: 83)]),
    Scale(root: 'C', type: 'Minor', notes: ['C', 'D', 'E♭', 'F', 'G', 'A♭', 'B♭'], playableNotes: [Note.C(), Note.D(), Note.eFlat(), Note.F(), Note.G(), Note.aFlat(), Note.bFlat(), Note.C(midi: 72)]),
    Scale(root: 'D♭', type: 'Minor', notes: ['D♭', 'E♭', 'E', 'G♭', 'A♭', 'A', 'B'], playableNotes: [Note.dFlat(), Note.eFlat(), Note.E(), Note.gFlat(), Note.aFlat(), Note.A(), Note.B(), Note.dFlat(midi: 73)]),
    Scale(root: 'D', type: 'Minor', notes: ['D', 'E', 'F', 'G', 'A', 'B♭', 'C'], playableNotes: [Note.D(), Note.E(), Note.F(), Note.G(), Note.A(), Note.bFlat(), Note.C(midi: 72), Note.D(midi: 74)]),
    Scale(root: 'E♭', type: 'Minor', notes: ['E♭', 'F', 'G♭', 'A♭', 'B♭', 'B','D♭'], playableNotes: [Note.eFlat(), Note.F(), Note.gFlat(), Note.aFlat(), Note.bFlat(), Note.B(), Note.dFlat(midi: 73), Note.eFlat(midi: 75)]),
    Scale(root: 'E', type: 'Minor', notes: ['E', 'G♭', 'G' ,'A',  'B', 'C', 'D'], playableNotes: [Note.E(), Note.gFlat(), Note.G(), Note.A(), Note.B(), Note.C(midi: 72), Note.D(midi: 74), Note.E(midi: 76)]),
    Scale(root: 'F', type: 'Minor', notes: ['F', 'G', 'A♭', 'B♭', 'C', 'D♭', 'E♭'], playableNotes: [Note.F(), Note.G(), Note.aFlat(), Note.bFlat(), Note.C(midi: 72), Note.dFlat(midi: 73), Note.eFlat(midi: 75), Note.F(midi: 77)]),
    Scale(root: 'G♭', type: 'Minor', notes: ['G♭', 'A♭', 'A', 'B', 'D♭', 'D', 'E'], playableNotes: [Note.gFlat(), Note.aFlat(), Note.A(), Note.B(), Note.dFlat(midi: 73), Note.D(midi: 74), Note.E(midi: 76), Note.gFlat(midi: 78)]),
    Scale(root: 'G', type: 'Minor', notes: ['G', 'A', 'B♭', 'C', 'D', 'E♭', 'F'], playableNotes: [Note.G(), Note.A(), Note.bFlat(), Note.C(midi: 72), Note.D(midi: 74), Note.eFlat(midi: 75), Note.F(midi: 77), Note.G(midi: 79)]),
    Scale(root: 'A♭', type: 'Minor', notes: ['A♭', 'B♭', 'B', 'D♭', 'E♭', 'E' , 'G♭'], playableNotes: [Note.aFlat(), Note.bFlat(), Note.B(), Note.dFlat(midi: 73), Note.eFlat(midi: 75), Note.E(midi: 76), Note.gFlat(midi: 78), Note.aFlat(midi: 80)]),
    Scale(root: 'A', type: 'Minor', notes: ['A', 'B', 'C', 'D', 'E', 'F', 'G'], playableNotes: [Note.A(), Note.B(), Note.C(midi: 72), Note.D(midi: 74), Note.E(midi: 76), Note.F(midi: 77), Note.G(midi: 79), Note.A(midi: 81)]),
    Scale(root: 'B♭', type: 'Minor', notes: ['B♭', 'C', 'D♭', 'E♭', 'F', 'G♭','A♭'], playableNotes: [Note.bFlat(), Note.C(midi: 72), Note.dFlat(midi: 73), Note.eFlat(midi: 75), Note.F(midi: 77), Note.gFlat(midi: 78), Note.aFlat(midi: 80), Note.bFlat(midi: 82)]),
    Scale(root: 'B', type: 'Minor', notes: ['B', 'D♭', 'D', 'E', 'G♭', 'G','A'], playableNotes: [Note.B(), Note.dFlat(midi: 73), Note.D(midi: 74), Note.E(midi: 76), Note.gFlat(midi: 78), Note.G(midi: 79), Note.A(midi: 81), Note.B(midi: 83)]),
  ];


  @override
  List<Scale> getScales(List<String> selectedNotes) {
    if (selectedNotes.isEmpty) return [];
    return List<Scale>.from(_scales).where((scale) => scale.notes.toSet().containsAll(selectedNotes.toSet())).toList();
  }

}