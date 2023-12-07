import 'package:get/get.dart';
import '/common/common.dart';

class CP002Provider extends GetConnect {
  //
  // Select
  Future<dynamic> getCP002() async {
    String cnum = '0';
    final response = await get(ServerUrl + 'CAPSTONE/CP002?cnum=$cnum');
    print(ServerUrl + 'CAPSTONE/CP002?cnum=$cnum');

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }
  // Delete
  Future<dynamic> setIP001e01Delete(int regisnum) async {
    final response =
        await delete(ServerUrl + 'CAPSTONE/CP002?regisnum=$regisnum');

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  // Insert
  Future<dynamic> setIP001e01Insert(String json) async {
    final response = await post(ServerUrl + 'CAPSTONE/CP002', json);

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  // Update
  Future<dynamic> setIP001e01Update(String json) async {
    final response = await put(ServerUrl + 'CAPSTONE/CP002', json);

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }
}
