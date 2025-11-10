import 'package:json_annotation/json_annotation.dart';
import 'package:layout_example/models/volume_info.dart';

part 'book_volume.g.dart';

@JsonSerializable()
class BookVolume {
  BookVolume({
    required this.id,
    required this.volumeInfo,
  });

  factory BookVolume.fromJson(Map<String, dynamic> json) =>
      _$BookVolumeFromJson(json);

  final String id;
  @JsonKey(name: 'volumeInfo')
  final VolumeInfo volumeInfo;

  Map<String, dynamic> toJson() => _$BookVolumeToJson(this);
}
