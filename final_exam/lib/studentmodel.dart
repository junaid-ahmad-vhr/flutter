class ModelPass {
  int? id;
  String? uid;
  String? correct;
  String? total;

  passwordMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id ?? null;
    mapping['uid'] = uid!;
    mapping['correct'] = correct!;
    mapping['total'] = total!;

    return mapping;
  }
}
