library linq_samples;

import "dart:collection";
import "dart:mirrors";
import "dart:math" as Math;
import "dart:json" as JSON;
import "linq-data.dart";

part 'linq-restrictions.dart';
part 'linq-projections.dart';
part 'linq-partitioning.dart';
part 'linq-ordering.dart';
part 'linq-grouping.dart';
part 'linq-setoperations.dart';
part 'linq-conversionoperations.dart';
part 'linq-elementoperations.dart';
part 'linq-generationoperations.dart';
part 'linq-quantifiers.dart';
part 'linq-aggregateoperations.dart';
part 'linq-miscellaneousoperations.dart';
part 'linq-queryexecution.dart';
part 'linq-joinoperators.dart';

void main() {
  doRestrictions();
  doProjections();
  doPartitioning();
  doOrdering();
  doGrouping();
  doSetOperations();
  doConversionOperations();
  doElementOperations();
  doGenerationOperations();
  doQuantifiers();
  doAggregateOperations();
  doMiscellaneousOperations();
  doQueryExecution();
  doJoinOperators();
}