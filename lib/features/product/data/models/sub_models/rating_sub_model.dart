import 'package:ecommcere_clean_app/features/product/domain/entities/sub_entities/ratinig_entity.dart';

class Rating extends RatinigEntity {
  Rating({required super.rate, required super.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: (json['rate'] as num).toDouble(),
      count: json['count'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {'rate': rate, 'count': count};
  }
}
