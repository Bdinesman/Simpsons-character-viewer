typedef Json = Map<String, dynamic>;
double? readDouble(Map<dynamic, dynamic> rawJson, String key) {
  var value = rawJson[key];
  return switch (value) {
    double() => value,
    num() => value.toDouble(),
    String() => double.tryParse(value),
    _ => null,
  };
}

mixin ToJsonMixin {
  Map<String, dynamic> toJson();
  @override
  String toString() => '${toJson()}';
}
