// import 'package:get/get.dart';
// import 'file:///C:/Users/Silent-Tesla/Code/Flutter/sports_app/lib/app/modules/home/model/fixtures_model.dart';
//
// class FixturesModelProvider extends GetConnect {
// 	@override
// 	void onInit() {
// 		httpClient.defaultDecoder = (map) => FixturesModel.fromJson(map);
// 		httpClient.baseUrl = 'YOUR-API-URL';
// 	}
// 	Future<Response<FixturesModel>> getFixturesModel(int id) async =>
// 		await get('fixturesmodel/$id');
// 	Future<Response<FixturesModel>> postFixturesModel(FixturesModel fixturesmodel) async =>
// 		await post('fixturesmodel', fixturesmodel);
// 	Future<Response> deleteFixturesModel(int id) async =>
// 		await delete('fixturesmodel/$id');
// }
