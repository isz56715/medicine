import 'package:get/get.dart';
import '/common/common.dart';

class CP003Provider extends GetConnect {
  //
  // Select
  Future<dynamic> getCP003() async {
    String cnum = '0';
    final response = await get(ServerUrl + 'CAPSTONE/CP003?cnum=$cnum');
    print(ServerUrl + 'CAPSTONE/CP003?cnum=$cnum');

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }
    Future<dynamic> getIP001e011(search) async {
    String cnum = '01';
    final response = await get(ServerUrl + 'CAPSTONE/CP003?cnum=$cnum');
    print(ServerUrl + 'CAPSTONE/CP003?cnum=$cnum');

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  // Delete
  Future<dynamic> setCP003Delete(int mnum) async {
    final response =
        await delete(ServerUrl + 'CAPSTONE/CP003?mnum=$mnum');
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  // Insert
  Future<dynamic> setCP003Insert(String json) async {
    final response = await post(ServerUrl + 'CAPSTONE/CP003', json);

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  // Update
  Future<dynamic> setCP003Update(String json) async {
    final response = await put(ServerUrl + 'CAPSTONE/CP003', json);

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }
}
