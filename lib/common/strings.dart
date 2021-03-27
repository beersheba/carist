import 'package:get/get.dart';

class Strings extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'error': 'Error',
          'error_number_invalid': 'Number is not valid',
          'error_number_not_found': 'Number not found',
          'number_title': 'Please scan or enter the vehicle number',
          'number_hint': '7 or 8 digits',
          'number_submit': 'Submit',
          'details_brand': 'Brand',
          'details_model': 'Model',
          'details_model_name': 'Model Name',
          'details_version': 'Version',
          'details_year': 'Year',
          'details_vin': 'VIN',
          'details_engine_code': 'Engine Code',
          'details_type': 'Vehicle Type',
          'details_type_private': 'Private',
          'details_type_commercial': 'Commercial',
          'details_ownership': 'Ownership',
          'details_fuel': 'Fuel Type',
          'details_test': 'Test Date',
          'details_test_valid': 'Valid Till',
        },
        'he_IL': {
          'error': 'שגיאה',
          'error_number_invalid': 'המספר אינו חוקי',
          'error_number_not_found': 'המספר לא נמצא',
          'number_title': 'אנא סרוק או הזן את מספר הרכב',
          'number_hint': '7 או 8 ספרות',
          'number_submit': 'שלח',
          'details_brand': 'יצרן',
          'details_model': 'דגם',
          'details_model_name': 'שם דגם',
          'details_version': 'רמת גימור',
          'details_year': 'שנת ייצור',
          'details_vin': 'מספר שילדה',
          'details_engine_code': 'דגם מנוע',
          'details_type': 'סוג דגם',
          'details_type_private': 'פרטי',
          'details_type_commercial': 'מסחרי',
          'details_ownership': 'סוג בעלות',
          'details_fuel': 'סוג דלק',
          'details_test': 'תאריך מבחן רכב (טסט)',
          'details_test_valid': 'תוקף רישיון רכב',
        }
      };
}
