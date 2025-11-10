// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_volume.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookVolume _$BookVolumeFromJson(Map<String, dynamic> json) => BookVolume(
  id: json['id'] as String,
  volumeInfo: VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BookVolumeToJson(BookVolume instance) =>
    <String, dynamic>{'id': instance.id, 'volumeInfo': instance.volumeInfo};
