import 'package:get/get.dart';
import '/common/common.dart';

class CP001Provider extends GetConnect {
  //
  // Select
  Future<dynamic> getCP001(search) async {
    final response = await get(ServerUrl + 'CAPSTONE/CP001?search=$search');
    print(ServerUrl + 'CAPSTONE/CP001?search=$search');

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }
  // Delete
  Future<dynamic> setIP001e01Delete(int regisnum) async {
    final response =
        await delete(ServerUrl + 'CAPSTONE/CP001?regisnum=$regisnum');

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  // Insert
  Future<dynamic> setIP001e01Insert(String json) async {
    final response = await post(ServerUrl + 'CAPSTONE/CP001', json);

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  // Update
  Future<dynamic> setIP001e01Update(String json) async {
    final response = await put(ServerUrl + 'CAPSTONE/CP001', json);

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }
}
