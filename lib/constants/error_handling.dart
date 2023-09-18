import 'dart:convert';

import 'utils.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBack(context, jsonDecode(response.body)['msg']);
      break;
    case 500:
      showSnackBack(context, jsonDecode(response.body)['error']);
      break;
    default:
      showSnackBack(context, response.body);
  }
}
