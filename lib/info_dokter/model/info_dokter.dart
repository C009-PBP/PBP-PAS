class InfoDokter {
  String? model;
  int? pk;
  Fields? fields;

  InfoDokter({this.model, this.pk, this.fields});

  InfoDokter.fromJson(Map<String, dynamic> json) {
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
  String? namaDokter;
  String? hariPraktek;
  String? jadwalPraktek;

  Fields({this.namaDokter, this.hariPraktek, this.jadwalPraktek});

  Fields.fromJson(Map<String, dynamic> json) {
    namaDokter = json['nama_dokter'];
    hariPraktek = json['hari_praktek'];
    jadwalPraktek = json['jadwal_praktek'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama_dokter'] = this.namaDokter;
    data['hari_praktek'] = this.hariPraktek;
    data['jadwal_praktek'] = this.jadwalPraktek;
    return data;
  }
}
