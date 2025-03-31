class Ad {
  String? adName;
  String? adBanner;
  String? adId;
  String? startDate;
  String? endDate;

  Ad({
    required this.adName,
    required this.adBanner,
    required this.adId,
    required this.startDate,
    required this.endDate,
  });

  Ad.fromJson(Map<String, dynamic> json) {
    adName = json['ad_name'];
    adBanner = json['ad_banner'];
    adId = json['ad_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ad_name'] = adName;
    data['ad_banner'] = adBanner;
    data['ad_id'] = adId;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    return data;
  }
}
