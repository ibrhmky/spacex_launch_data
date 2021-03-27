import 'package:http/http.dart'  as http;
import 'package:spacex_launch_data/models/spacexModel.dart';
import 'dart:convert' as json;

Future<SpacexMod> fetchLatestLaunch() async {
  final response = await http.get('https://api.spacexdata.com/v4/launches/latest');
  if (response.statusCode == 200) {

    final jsonData = json.jsonDecode(response.body);
    final latestLaunchData = new SpacexMod.fromJson(jsonData);

    return latestLaunchData;

  } else {
    throw Exception('We can\'t load the data..');
  }
}