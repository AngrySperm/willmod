import 'dart:async';

import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:willmod/configs/constant.dart';
import 'package:willmod/configs/myapp.dart';
import 'package:willmod/configs/mydio.dart';
import 'package:willmod/globals/globalwidget.dart';

class WiljosItemSelector {
  static Widget _getSearchTextField(
      double width, TextEditingController controller, VoidCallback onTap) {
    WiljosConstant constant = Get.put(WiljosConstant());
    return Material(
      // elevation: 8,
      borderRadius: BorderRadius.circular(30),
      child: SizedBox(
        width: width,
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          style: TextStyle(
              fontSize: 16,
              color: constant.colorText,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.black12)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: constant.colorPrimary, width: 2)),
            filled: true,
            prefixIcon: const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Icon(Icons.search),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: IconButton(
                  onPressed: () {
                    onTap();
                  },
                  icon: Icon(Icons.refresh, color: constant.colorTextLight)),
            ),
            hintText: "Search ...",
            hintStyle: const TextStyle(color: Colors.black12, fontSize: 16),
          ),
        ),
      ),
    );
  }

  static Future<String?> showSingleStringSelectorDialog(BuildContext context,
      double width, double height, String title, List<String> listData,
      {Function(Map<String, dynamic>)? newItemBuilder,
      bool fromApi = false,
      String apiUrl = '',
      String filterField = "",
      String filterValue = "",
      String? additionalFilter,
      Map<String, Object>? additionalParams,
      String? orderBy}) async {
    List<Map<String, dynamic>> listDataConverted =
        listData.map((e) => {'name': e}).toList();
    Map<String, dynamic>? result = await showSingleSelectorDialog(
        context, width, height, title, listDataConverted,
        newItemBuilder: newItemBuilder,
        fromApi: fromApi,
        apiUrl: apiUrl,
        filterField: filterField,
        filterValue: filterValue,
        additionalFilter: additionalFilter,
        additionalParams: additionalParams,
        orderBy: orderBy);
    if (result == null) {
      return null;
    } else {
      Map<String, dynamic> mapResult = result;
      return mapResult['name'];
    }
  }

  static Future<List<String>?> showMultipleStringSelectorDialog(
      BuildContext context,
      double width,
      double height,
      String title,
      List<String> listData,
      {Function(Map<String, dynamic>)? newItemBuilder,
      bool fromApi = false,
      String apiUrl = '',
      String filterField = "",
      String filterValue = "",
      String? additionalFilter,
      Map<String, Object>? additionalParams,
      String? orderBy}) async {
    List<Map<String, dynamic>> listDataConverted =
        listData.map((e) => {'name': e}).toList();
    List<Map<String, dynamic>>? resultList = await showMultipleSelectorDialog(
        context, width, height, title, listDataConverted,
        newItemBuilder: newItemBuilder,
        fromApi: fromApi,
        apiUrl: apiUrl,
        filterField: filterField,
        filterValue: filterValue,
        additionalFilter: additionalFilter,
        additionalParams: additionalParams,
        orderBy: orderBy);
    if (resultList == null) {
      return null;
    } else if (resultList.isEmpty) {
      return null;
    } else {
      List<Map<String, dynamic>> mapResultList = resultList;
      List<String> result =
          mapResultList.map((e) => e['name']).toList() as List<String>;
      return result;
    }
  }

  static Future<Map<String, dynamic>?> showSingleSelectorDialog(
      BuildContext context,
      double width,
      double height,
      String title,
      List<Map<String, dynamic>> listData,
      {Function(Map<String, dynamic>)? newItemBuilder,
      bool fromApi = false,
      String apiUrl = '',
      String filterField = "",
      String filterValue = "",
      String? additionalFilter,
      Map<String, Object>? additionalParams,
      String? orderBy}) async {
    List<Map<String, dynamic>>? resultList = await showSelectorDialog(
        context, width, height, title, listData,
        newItemBuilder: newItemBuilder,
        singleSelection: true,
        apiUrl: apiUrl,
        filterField: filterField,
        additionalFilter: additionalFilter,
        additionalParams: additionalParams,
        orderBy: orderBy);
    if (resultList == null) {
      return null;
    } else if (resultList.isEmpty) {
      return null;
    } else {
      return resultList[0];
    }
  }

  static Future<List<Map<String, dynamic>>?> showMultipleSelectorDialog(
      BuildContext context,
      double width,
      double height,
      String title,
      List<Map<String, dynamic>> listData,
      {Function(Map<String, dynamic>)? newItemBuilder,
      bool fromApi = false,
      String apiUrl = '',
      String filterField = "",
      String filterValue = "",
      String? additionalFilter,
      Map<String, Object>? additionalParams,
      String? orderBy}) async {
    return showSelectorDialog(context, width, height, title, listData,
        newItemBuilder: newItemBuilder,
        singleSelection: false,
        multiSelection: true,
        apiUrl: apiUrl,
        filterField: filterField,
        additionalFilter: additionalFilter,
        additionalParams: additionalParams,
        orderBy: orderBy);
  }

  static Future<List<Map<String, dynamic>>?> showSelectorDialog(
      BuildContext context,
      double width,
      double height,
      String title,
      List<Map<String, dynamic>> listData,
      {Function(Map<String, dynamic>)? newItemBuilder,
      bool singleSelection = true,
      bool multiSelection = false,
      String apiUrl = '',
      String filterField = "",
      String? additionalFilter,
      Map<String, Object>? additionalParams,
      String? orderBy}) async {
    TextEditingController textEditingController = TextEditingController();

    RxList rxList = RxList(listData);
    WiljosConstant constant = Get.put(WiljosConstant());
    List<bool> isSelected = List.generate(listData.length, (index) => false);
    if (multiSelection) {
      singleSelection = false;
    }

    if (apiUrl.isNotEmpty) {
      _reloadFromCloud(apiUrl, rxList, isSelected, filterField, '',
          additionalFilter, additionalParams, orderBy);
    }

    return showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 10,
            backgroundColor: Colors.white,
            child: SizedBox(
              width: width * 0.9,
              height: height * 0.9,
              // color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                    child: Text(
                      title,
                      style: TextStyle(
                          color: constant.colorTextLight,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  _getSearchTextField(width * 0.7, textEditingController, () {
                    _reloadFromCloud(
                        apiUrl,
                        rxList,
                        isSelected,
                        filterField,
                        textEditingController.value.text,
                        additionalFilter,
                        additionalParams,
                        orderBy);
                  }),
                  15.height,
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(20, 3, 20, 3),
                      width: width * 0.9,
                      height: height * 0.5,
                      color: Colors.black12,
                      child: Obx(
                        () => ListView.builder(
                            itemCount: rxList.length,
                            itemBuilder: (item, index) {
                              String name = rxList[index].containsKey('label')
                                  ? rxList[index]['label']
                                  : "";
                              if (name.isEmpty) {
                                name = rxList[index].containsKey('name')
                                    ? rxList[index]['name']
                                    : "";
                              }
                              if (name.isEmpty) {
                                name = rxList[index].containsKey('nama')
                                    ? rxList[index]['nama']
                                    : "";
                              }
                              if (name.isEmpty) {
                                name = rxList[index].containsKey('kode')
                                    ? rxList[index]['kode']
                                    : "";
                              }
                              if (name.isEmpty) {
                                name = rxList[index].containsKey('code')
                                    ? rxList[index]['code']
                                    : "";
                              }
                              if (name.isEmpty) {
                                name = "No Label Data";
                              }
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(8, 10, 8, 10),
                                child: Material(
                                  elevation: 5,
                                  color:
                                      isSelected.isNotEmpty && isSelected[index]
                                          ? constant.colorPrimary
                                          : Colors.white,
                                  child: InkWell(
                                    splashColor: isSelected.isNotEmpty &&
                                            isSelected[index]
                                        ? Colors.white
                                        : constant.colorPrimary,
                                    onTap: () {
                                      if (singleSelection) {
                                        List<Map<String, dynamic>> listResult =
                                            [];
                                        listResult.add(rxList[index]);
                                        Navigator.pop(context, listResult);
                                      } else {
                                        isSelected[index] = !isSelected[index];
                                        rxList.refresh();
                                      }
                                    },
                                    child: newItemBuilder != null
                                        ? newItemBuilder(rxList[index])
                                        : Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                15, 18, 15, 18),
                                            child: Text(name,
                                                style: TextStyle(
                                                    color:
                                                        constant.colorTextLight,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600))),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ),
                  singleSelection
                      ? 30.height
                      : Container(
                          padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                          width: width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context, null);
                                },
                                splashColor: Colors.black12,
                                child: SizedBox(
                                  width: 100,
                                  height: 35,
                                  child: Center(
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(
                                          color: constant.colorTextLight,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                              15.width,
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: constant.colorPrimary),
                                child: const Text(
                                  "Okay",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                onPressed: () {
                                  List<Map<String, dynamic>> result = [];
                                  for (int i = 0; i < isSelected.length; i++) {
                                    if (isSelected[i]) {
                                      result.add(rxList[i]);
                                    }
                                  }
                                  if (result.isEmpty) {
                                    Navigator.pop(context, null);
                                  } else {
                                    Navigator.pop(context, result);
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                ],
              ),
            ),
          );
        });
  }

  static void _reloadFromCloud(
      String apiUrl,
      RxList listData,
      List<bool> listSelected,
      String filterField,
      String filterValue,
      String? additionalFilter,
      Map<String, Object>? additionalParams,
      String? orderBy) async {
    listData.clear();
    listSelected.clear();

    try {
      var myDio = Get.put(MyDio());
      var myApp = Get.put(MyApp());

      String filterTxt = '';
      List<String> filterFields = filterField.split(',');
      String firstFilterField = filterFields.length > 0 ? filterFields[0] : '';
      for (String filter in filterFields) {
        if (filterTxt.isNotEmpty) {
          filterTxt += '||';
        }
        filterTxt += '${filter}:contains:${filterValue}';
      }

      if (additionalFilter != null && additionalFilter.isNotEmpty) {
        filterTxt += additionalFilter;
      }

      String newOrder = firstFilterField;
      if (orderBy != null) {
        newOrder = orderBy;
      }

      final params = {
        'take': 30,
        'page': 1,
        'order': newOrder,
        'order_method': 'ASC',
        'filter': filterValue.isEmpty
            ? (additionalFilter != null && additionalFilter.isNotEmpty
                ? additionalFilter.substring(1)
                : "")
            : filterTxt,
      };
      if (additionalParams != null && additionalParams.isNotEmpty) {
        params.addAll(additionalParams);
      }
      final response =
          await myDio.request(MyDio.REQ_GET, apiUrl, mapQuery: params);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> responseBody = response.data;

        if (responseBody["success"]) {
          List listRawData = responseBody["data"];
          for (dynamic item in listRawData) {
            Map<String, dynamic> map = item as Map<String, dynamic>;
            listData.add(map);
            listSelected.add(false);
          }
        } else {
          showMessage(responseBody["message"]);
        }
      } else {
        showMessage(response.statusMessage ?? "");
      }
    } on TimeoutException catch (_) {
      showMessage("Could not connect to server");
    }
  }
}
