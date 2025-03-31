class Ad {
  String? adName;
  String? adBanner;
  String? adId;
  DateTime? startDate;
  DateTime? endDate;

  Ad({
    required this.adName,
    required this.adBanner,
    required this.adId,
    required this.startDate,
    required this.endDate,
  });

  Ad.fromJson(Map<String, dynamic> json) {
    adName = json['ad_name'];
    adBanner = json['ad_image'];
    adId = json['ad_id'];
    startDate = DateTime.parse(json['start_date']);
    endDate = DateTime.parse(json['end_date']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ad_name'] = adName;
    data['adBanner'] = adBanner;
    data['ad_id'] = adId;
    data['start_date'] = startDate?.toIso8601String();
    data['end_date'] = endDate?.toIso8601String();
    return data;
  }
}
