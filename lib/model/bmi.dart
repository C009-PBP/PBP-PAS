//TODO: BUAT MODEL
//STATUS: (MUNGKIN) UDAH
import 'dart:convert';

List<BMI> toDoFromJson(String str) =>
    List<BMI>.from(json.decode(str).map((x) => BMI.fromJson(x)));

String toDoToJson(List<BMI> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// title = models.CharField(max_length=255)
// rating = models.DecimalField(max_digits=3, decimal_places=2, validators= [MinValueValidator(1) ,MaxValueValidator(5)])
// release_date = models.DateField()
// review = models.TextField()
// is_watched = models.BooleanField()

class BMI {
  BMI({
    required this.user,
    required this.umur,
    required this.tinggi,
    required this.berat,
    required this.date_created,
    required this.bmi_result,
    required this.deskripsi_hasil,
    required this.keterangan_tambahan,
  });

  int user;
  int umur;
  int tinggi;
  int berat;
  String date_created;
  int bmi_result;
  String deskripsi_hasil;
  String keterangan_tambahan;

  factory BMI.fromJson(Map<String, dynamic> json) => BMI(
        user: json["fields"]["user"],
        umur: json["fields"]["umur"],
        tinggi: json["fields"]["tinggi"],
        berat: json["fields"]["berat"],
        date_created: json["fields"]["date_created"],
        bmi_result: json["fields"]["bmi_result"],
        deskripsi_hasil: json["fields"]["deskripsi_hasil"],
        keterangan_tambahan: json["fields"]["keterangan_tambahan"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "umur": umur,
        "tinggi": tinggi,
        "berat": berat,
        "date_created": date_created,
        "bmi_result": bmi_result,
        "deskripsi_hasil": deskripsi_hasil,
        "keterangan_tambahan": keterangan_tambahan,
      };
}
