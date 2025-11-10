import 'package:json_annotation/json_annotation.dart';
import 'package:layout_example/models/book_volume.dart';

part 'books_response.g.dart';

@JsonSerializable()
class BooksResponse {
  BooksResponse({required this.books});

  factory BooksResponse.fromJson(Map<String, dynamic> json) =>
      _$BooksResponseFromJson(json);

  @JsonKey(name: 'items')
  final List<BookVolume> books;

  Map<String, dynamic> toJson() => _$BooksResponseToJson(this);
}
