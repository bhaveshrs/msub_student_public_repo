import 'package:msub/config/network_services/api_client.dart';
import 'package:msub/config/network_services/api_result.dart';
import 'package:msub/config/resource/apis_end_points.dart';

class NotificationService {
  Future<ApiResult> notificationsDataCall({payload}) async {
    ApiResult apiResult =
        await DioClient().post(ApisEndPoints.notificationListing, data: payload);
    return apiResult;
  }
}
