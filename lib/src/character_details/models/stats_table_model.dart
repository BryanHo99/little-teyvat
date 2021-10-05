import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:little_teyvat/src/character_details/models/stat_row_model.dart';

abstract class StatsTableModel {
  final IList<StatRowModel> stats;

  const StatsTableModel({
    required this.stats,
  });

  IList<IList<String>> getStats();
}
