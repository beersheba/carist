import 'package:carist/controller/details_controller.dart';
import 'package:carist/controller/number_controller.dart';
import 'package:carist/model/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailsTable extends StatelessWidget {
  final NumberController _numberController = Get.find();
  final DetailsController _detailsController = Get.find();

  @override
  Widget build(BuildContext context) {
    Base base = _numberController.base.value;
    Rx<Details> details = _detailsController.details;

    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Obx(
          () => DataTable(
            headingRowHeight: 0,
            dividerThickness: 2.0,
            columns: [
              DataColumn(label: Text("")),
              DataColumn(label: Text("")),
            ],
            rows: [
              _textRow('details_model'.tr, _vehicleName()),
              _textRow('details_version'.tr, base.version),
              _textRow('details_year'.tr, base.year),
              _textRow(
                'details_engine_size'.tr,
                details.value.engineSize,
                units: 'details_cc'.tr,
              ),
              _textRow('details_fuel'.tr, base.fuel),
              _textRow('details_horse_power'.tr, details.value.horsePower),
              _textRow('details_ownership'.tr, base.ownership),
              _textRow(
                'details_weight'.tr,
                details.value.weight,
                units: 'details_kilo'.tr,
              ),
              _textRow('details_vin'.tr, base.vin),
              _textRow('details_last_test'.tr, _formatDate(base.testDate)),
              _textRow(
                'details_license_valid'.tr,
                _formatDate(base.licenseValidity),
                textColor: _dateColor(base.licenseValidity),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DataRow _textRow(String title, var value,
      {Color textColor = Colors.white, String units = ''}) {
    return DataRow(
      cells: [
        DataCell(Text(title)),
        DataCell(value == null
            ? Text('-')
            : Text("${value.toString()} $units",
                style: TextStyle(color: textColor))),
      ],
    );
  }

  String _vehicleName() {
    String brand = _detailsController.extra.value.brandEng;
    if (brand == null) return null;
    String model = _numberController.base.value.model;
    if (model.isCaseInsensitiveContains(brand)) {
      return model;
    }
    return ('${brand.toUpperCase()} $model');
  }

  String _formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat("dd/MM/yyyy").format(dateTime);
  }

  Color _dateColor(String date) {
    return _daysLeft(date) < _daysInCurrentMonth(date)
        ? Colors.red
        : Colors.white;
  }

  int _daysLeft(String date) {
    DateTime dateTime = DateTime.parse(date);
    return dateTime.difference(DateTime.now()).inDays;
  }

  int _daysInCurrentMonth(String date) {
    DateTime dateTime = DateTime.now();
    return DateTime(dateTime.year, dateTime.month + 1, 0).day;
  }
}

String _vehicleType(String type) {
  String vehicleType = 'details_type_private'.tr;
  if (type == 'M') {
    vehicleType = 'details_type_commercial'.tr;
  }
  return vehicleType;
}
