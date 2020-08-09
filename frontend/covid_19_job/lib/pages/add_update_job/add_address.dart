import 'package:covid_19_job/utils/current_location.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_job/utils/bottom_navigator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:covid_19_job/pages/add_update_job/add_address_scafold.dart';

class AddAddress extends StatefulWidget {
  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  Map dataFromPreviousPage  = {};

  bool _useMyCurrentLocationEnabled = true;

  TextEditingController _alternateMobileNoController = new TextEditingController();
  TextEditingController _contactPersonController = new TextEditingController();
  TextEditingController _pincodeController = new TextEditingController();
  TextEditingController _cityController = new TextEditingController();
  TextEditingController _stateController = new TextEditingController();
  TextEditingController _countryController = new TextEditingController();
  TextEditingController _landmarkController = new TextEditingController();
  TextEditingController _addressController = new TextEditingController();

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){

     _alternateMobileNoController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    dataFromPreviousPage = ModalRoute.of(context).settings.arguments;
    print(dataFromPreviousPage);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: AddAddressScafold(dataFromPreviousPage:dataFromPreviousPage),
      bottomNavigationBar: BottomNavigator(),

    );
  }


}
