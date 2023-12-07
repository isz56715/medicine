import 'package:get/get.dart';
import '/common/common.dart';

class CP004Provider extends GetConnect {
  //
  // Select
  Future<dynamic> getCP004(search) async {
    String cnum = '1';
    final response = await get(ServerUrl + 'CAPSTONE/CP004?cnum=$cnum&search=$search');
    print(ServerUrl + 'CAPSTONE/CP004?cnum=$cnum&search=$search');

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  // Delete
  Future<dynamic> setCP003Delete(int mnum) async {
    final response =
        await delete(ServerUrl + 'CAPSTONE/CP004?mnum=$mnum');
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  // Insert
  Future<dynamic> setCP003Insert(String json) async {
    final response = await post(ServerUrl + 'CAPSTONE/CP004', json);

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  // Update
  Future<dynamic> setCP003Update(String json) async {
    final response = await put(ServerUrl + 'CAPSTONE/CP004', json);

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }
}
