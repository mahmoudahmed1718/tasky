import 'package:api_request/api_request.dart';
import 'package:requests_inspector/requests_inspector.dart';
import 'package:tasky/app/utils/notification_util.dart';
import 'package:tasky/config/app_config.dart';
import 'package:tasky/core/app_storage.dart';
import 'package:flutter/widgets.dart';

class ApiUtils {
  ApiUtils.init(BuildContext context) {
    ApiRequestOptions.instance?.config(
      baseUrl: 'https://todo.iraqsapp.com/',
      getToken: () => getIt.get<AppStorage>().getToken(),
      tokenType: ApiRequestOptions.bearer,
      interceptors: [RequestsInspectorInterceptor()],
      onError: (error) {
        NotificationUtil.showError(error.message);
      },
      unauthenticated: () {
        //Force logout user form app
        getIt.get<AppStorage>().setToken(null);
      },
      defaultHeaders: {'Content-Language': 'en'},
    );
  }

  static void setLanguage(String languageCode) {
    ApiRequestOptions.instance?.config(
      defaultHeaders: {'Content-Language': languageCode},
    );
    ApiRequestOptions.refreshConfig();
    getIt.get<AppStorage>().setLocale(languageCode);
  }
}
