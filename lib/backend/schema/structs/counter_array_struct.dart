// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CounterArrayStruct extends BaseStruct {
  CounterArrayStruct({
    List<double>? counterItem,
  }) : _counterItem = counterItem;

  // "counterItem" field.
  List<double>? _counterItem;
  List<double> get counterItem => _counterItem ?? const [];
  set counterItem(List<double>? val) => _counterItem = val;

  void updateCounterItem(Function(List<double>) updateFn) {
    updateFn(_counterItem ??= []);
  }

  bool hasCounterItem() => _counterItem != null;

  static CounterArrayStruct fromMap(Map<String, dynamic> data) =>
      CounterArrayStruct(
        counterItem: getDataList(data['counterItem']),
      );

  static CounterArrayStruct? maybeFromMap(dynamic data) => data is Map
      ? CounterArrayStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'counterItem': _counterItem,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'counterItem': serializeParam(
          _counterItem,
          ParamType.double,
          isList: true,
        ),
      }.withoutNulls;

  static CounterArrayStruct fromSerializableMap(Map<String, dynamic> data) =>
      CounterArrayStruct(
        counterItem: deserializeParam<double>(
          data['counterItem'],
          ParamType.double,
          true,
        ),
      );

  @override
  String toString() => 'CounterArrayStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CounterArrayStruct &&
        listEquality.equals(counterItem, other.counterItem);
  }

  @override
  int get hashCode => const ListEquality().hash([counterItem]);
}

CounterArrayStruct createCounterArrayStruct() => CounterArrayStruct();
