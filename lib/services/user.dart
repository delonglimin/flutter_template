import 'package:flutter_getx_template/model/article_model.dart';
import 'package:flutter_getx_template/model/page_model.dart';
import 'package:flutter_getx_template/utils/index.dart';

/// 用户
class UserAPI {
  static Future<PageModel<ArticleModel>> getArticleList(
      {Map<String, dynamic>? params}) {
    return Request()
        .post(
          '/agreement/getAgreementList',
          params: params,
        )
        .then((res) {
          return PageModel.fromMap(res, (json) => ArticleModel.fromMap(json));
        });
  }
}
