import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:covid_19_job/utils/current_location.dart';
import 'package:covid_19_job/pages/add_update_job/add_update_job_controller.dart';

class AddAddressScafold extends StatefulWidget {
  dynamic dataFromPreviousPage;
  AddAddressScafold({this.dataFromPreviousPage});
  @override
  _AddAddressScafoldState createState() =>
      _AddAddressScafoldState(dataFromPreviousPage: dataFromPreviousPage);
}

class _AddAddressScafoldState extends State<AddAddressScafold> {
  Map dataFromPreviousPage = {};
  _AddAddressScafoldState({this.dataFromPreviousPage});
  bool _useMyCurrentLocationEnabled = true;

  String lat, lng;

  TextEditingController _alternateMobileNoController =
      new TextEditingController();
  TextEditingController _contactPersonController = new TextEditingController();
  TextEditingController _pincodeController = new TextEditingController();
  TextEditingController _cityController = new TextEditingController();
  TextEditingController _stateController = new TextEditingController();
  TextEditingController _countryController = new TextEditingController();
  TextEditingController _landmarkController = new TextEditingController();
  TextEditingController _addressController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _alternateMobileNoController.dispose();
    _contactPersonController.dispose();
    _pincodeController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _countryController.dispose();
    _landmarkController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                'Job Location',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                alignment: Alignment.center,
                child: RaisedButton.icon(
                  onPressed: _useMyCurrentLocationEnabled
                      ? () async {
                          await getLatLng(context);
                        }
                      : null,
                  color: Colors.white,
                  icon: Icon(
                    Icons.my_location,
                  ),
                  label: Text('Use my current location'),
                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 80),
                )),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 10.0, right: 20.0),
                    child: Divider(
                      height: 50,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  "OR",
                  style: TextStyle(color: Colors.black),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 20.0, right: 10.0),
                    child: Divider(
                      height: 50,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      width: size.width * 0.4,
                      child: TextFormField(
                        controller: _alternateMobileNoController,
                        validator: (value) {
                          if (value.length > 8 && value.length < 20) {
                            return null;
                          } else {
                            return "Invalid alternate mobile no";
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.teal[500]),
                          errorStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 10,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.teal[500],
                                width: 2.0,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.teal[500],
                                width: 2.0,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.red,
                                width: 2.0,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          labelText: 'Alternate mobile',
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * 0.4,
                      child: TextFormField(
                        validator: (value) {
                          if (value.length > 0 && value.length < 50) {
                            return null;
                          } else {
                            return "Invalid contact person name";
                          }
                        },
                        controller: _contactPersonController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          errorStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 10,
                          ),
                          labelStyle: TextStyle(color: Colors.teal[500]),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.teal[500],
                                width: 2.0,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.teal[500],
                                width: 2.0,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.red,
                                width: 2.0,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          labelText: 'Contact person name',
                        ),
                      ),
                    )
                  ],
                )),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: size.width * 0.4,
                    child: TextFormField(
                      validator: (value) {
                        if (value.length > 4 && value.length < 8) {
                          return null;
                        } else {
                          return "Invalid pincode";
                        }
                      },
                      controller: _pincodeController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        errorStyle: TextStyle(
                          color: Colors.red,
                          fontSize: 10,
                        ),
                        labelStyle: TextStyle(color: Colors.teal[500]),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.teal[500],
                              width: 2.0,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.teal[500],
                              width: 2.0,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 2.0,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        labelText: 'Pincode',
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * 0.4,
                    child: TextFormField(
                      controller: _cityController,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        value = value.trim();
                        if (value.length > 0 && value.length < 50) {
                          return null;
                        } else {
                          return "invalid city";
                        }
                      },
                      decoration: InputDecoration(
                        errorStyle: TextStyle(
                          color: Colors.red,
                          fontSize: 10,
                        ),
                        labelStyle: TextStyle(color: Colors.teal[500]),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.teal[500],
                              width: 2.0,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.teal[500],
                              width: 2.0,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 2.0,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        labelText: 'City',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      width: size.width * 0.4,
                      child: TextFormField(
                        controller: _stateController,
                        validator: (value) {
                          value = value.trim();
                          if (value.length > 0 && value.length < 50) {
                            return null;
                          } else {
                            return "invalid state";
                          }
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          errorStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 10,
                          ),
                          labelStyle: TextStyle(color: Colors.teal[500]),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.teal[500],
                                width: 2.0,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.teal[500],
                                width: 2.0,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.red,
                                width: 2.0,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          labelText: 'State',
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * 0.4,
                      child: TextFormField(
                        controller: _countryController,
                        validator: (value) {
                          value = value.trim();
                          if (value.length > 0 && value.length < 50) {
                            return null;
                          } else {
                            return "invalid country";
                          }
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          errorStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 10,
                          ),
                          labelStyle: TextStyle(color: Colors.teal[500]),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.teal[500],
                                width: 2.0,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.teal[500],
                                width: 2.0,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.red,
                                width: 2.0,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          labelText: 'Country',
                        ),
                      ),
                    )
                  ],
                )),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              child: TextFormField(
                controller: _landmarkController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.teal[500]),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.teal[500],
                        width: 2.0,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.teal[500],
                        width: 2.0,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  labelText: 'Landmark',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              child: Container(
                height: 60,
                child: TextFormField(
                  controller: _addressController,
                  minLines: 2,
                  maxLines: 4,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.teal[500]),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.teal[500],
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.teal[500],
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.red,
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    labelText: 'Job location Address',
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      addJob();
                    } else {
                      showSnackBar(Colors.red,
                          'please correct the address data', context);
                    }
                  },
                  elevation: 15,
                  color: Colors.teal,
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  child: Text(
                    'Submit Job',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
            )
          ],
        ),
      ),
    ));
  }

  Future getLatLng(context) async {
    Set currentLocation = await CurrentLocation.GetLatLng();
    if (currentLocation.isEmpty) {
      //failed to get current location
      showSnackBar(Colors.red, 'Failed to get current location .', context);
    } else {
      lat = currentLocation.elementAt(0).toString();
      lng = currentLocation.elementAt(1).toString();
      Placemark place = await CurrentLocation.GetLocationData(currentLocation);
      print(place);
      if (place != null) {
        _pincodeController.text = place.postalCode;
        _countryController.text = place.country;
        _landmarkController.text = place.locality;
      } else {
        showSnackBar(Colors.red, 'Please fill the address manually', context);
      }
    }
    setState(() {
      _useMyCurrentLocationEnabled = false;
    });
  }

  showSnackBar(color, msg, context) {
    print("hello");
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: color,
    ));
  }

  addJob() {
    Map<String, String> payLoad = dataFromPreviousPage;
    payLoad['lat'] = lat;
    payLoad['lng'] = lng;
    payLoad['alternateMobileNumber'] = _alternateMobileNoController.text;
    payLoad['contactPerson'] = _contactPersonController.text;
    payLoad['pincode'] = _pincodeController.text;
    payLoad['city'] = _cityController.text;
    payLoad['state'] = _stateController.text;
    payLoad['country'] = _countryController.text;
    payLoad['landmark'] = _landmarkController.text;
    payLoad['address'] = _addressController.text;
    print(payLoad);
    print("hello");
    JobsController jc = new JobsController();
    jc.addJob(payLoad);
  }
}
