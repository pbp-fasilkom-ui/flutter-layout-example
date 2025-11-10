import 'package:json_annotation/json_annotation.dart';

part 'volume_info.g.dart';

@JsonSerializable()
class VolumeInfo {
  VolumeInfo({
    required this.title,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoFromJson(json);

  final String title;
  final List<String>? authors;
  final String? publisher;
  final String? publishedDate;
  final String? description;

  Map<String, dynamic> toJson() => _$VolumeInfoToJson(this);
}
