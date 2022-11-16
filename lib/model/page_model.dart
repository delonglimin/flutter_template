// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PageModel<T> {
  int? currentPage;
  List<T>? rows;
  int? total;
  PageModel({
    this.currentPage,
    this.rows,
    this.total,
  });
  

  PageModel<T> copyWith({
    int? currentPage,
    List<T>? rows,
    int? total,
  }) {
    return PageModel<T>(
      currentPage: currentPage ?? this.currentPage,
      rows: rows ?? this.rows,
      total: total ?? this.total,
    );
  }


  factory PageModel.fromMap(Map<String, dynamic> map) {
    return PageModel<T>(
      currentPage: map['currentPage'] != null ? map['currentPage'] as int : null,
      rows: map['rows'] != null ? map['rows']: null,
      total: map['total'] != null ? map['total'] as int : null,
    );
  }


  factory PageModel.fromJson(String source) => PageModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
