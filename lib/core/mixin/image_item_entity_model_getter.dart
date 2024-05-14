mixin ImageItemEntityModelGetter<T> {
  T searchModel({
    required String id,
    required List<dynamic> models,
  }) =>
      models.firstWhere((element) => element.id == id);
}
