class ReviewDokter {
  String? model;
  int? pk;
  Fields? fields;

  ReviewDokter({this.model, this.pk, this.fields});

  ReviewDokter.fromJson(Map<String, dynamic> json) {
    model = json['model'];
    pk = json['pk'];
    fields =
    json['fields'] != null ? new Fields.fromJson(json['fields']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model'] = this.model;
    data['pk'] = this.pk;
    if (this.fields != null) {
      data['fields'] = this.fields!.toJson();
    }
    return data;
  }
}

class Fields {
  int? user;
  int? dokter;
  String? review;

  Fields({this.user, this.dokter, this.review});

  Fields.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    dokter = json['dokter'];
    review = json['review'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['dokter'] = this.dokter;
    data['review'] = this.review;
    return data;
  }
}
