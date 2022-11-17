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


  factory PageModel.fromMap(Map<String, dynamic> map,T Function(dynamic json) fromJsonT) {
    return PageModel<T>(
      currentPage: map['currentPage'] != null ? map['currentPage'] as int : null,
      rows: map['rows'] != null ? List<T>.from((map['rows']).map<T?>(fromJsonT),) : null,
      total: map['total'] != null ? map['total'] as int : null,
    );
  }
}
