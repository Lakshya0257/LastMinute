import 'package:last_minute_driver/app/data/model/distance.dart';

import '../../../utils/error_handler/error_handler.dart';
import '../model/repo_response.dart';
import '../network/network_requester.dart';

class DistanceRepository{
  Future<RepoResponse<DistanceMatrix>> getDistance(double userLat,double userLng,double patientLat,double patientLng) async {
    final response =
        await NetworkRequester.shared.get(path: 'json?origins=$userLat,$userLng&destinations=$patientLat,$patientLng&key=thabpPe0ky3ZUuL8sK8LIPpnM3Jik',);
    if (response is APIException) {
      return RepoResponse(error: response);
    } else {
      return RepoResponse(data: DistanceMatrix.fromJson(response));
    }
  }
}