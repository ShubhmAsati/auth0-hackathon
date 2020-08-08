import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_job/utils/bottom_navigator.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:covid_19_job/pages/add_update_job/add_address.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddJob extends StatefulWidget {
  @override
  _AddJobState createState() => _AddJobState();
}

class _AddJobState extends State<AddJob> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _jobTypeController = new TextEditingController();
  final List<DropdownMenuItem> items = [];
  TextEditingController _dropDownController = new TextEditingController();

  List<String> jobs = new List();
  String selectedValue = '';
  String _dropDownWages = 'Daily';
  List<String> _dropDownWagesList = ['Hourly', 'Daily', 'Monthly', 'Yearly'];
  dynamic selectedRadio;
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  PickedFile _imageFile;
  dynamic _pickImageError;

  selectedRadioButton(val) {
    setState(() {
      print(val);
      selectedRadio = val;
    });
  }

  @override
  void initState() {
    super.initState();
    jobs = getMatchingJobs('filterBy');
    List<String> l = getMatchingJobs('');
    _dropDownController.addListener(() {
      if (_dropDownController.text.length > 4 &&
          !jobs.contains(_dropDownController.text)) {
        jobs.add(_dropDownController.text);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _dropDownController.dispose();
  }

  getSearchJobTypeDropDown() {
    return DropDownField(
      value: '',
      hintText: 'Plumber , Salesman ..etc',
      hintStyle: TextStyle(fontSize: 15),
      labelText: 'Please enter the type of job',
      labelStyle: TextStyle(
        color: Colors.teal,
      ),
      controller: _dropDownController,
      items: jobs,
      strict: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                          child: ListTile(
                            title: Text("Create Job",
                                style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.teal,
                                )),
                            subtitle: Text("Post a job here and let us find out the best employees for you"),
                          )
                      ),
                      Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: getSearchJobTypeDropDown(),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 10, 60, 10),
                        child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            minLines: 3,
                            maxLines: 4,
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
                              labelText: 'Job Descriptions',
                              hintText: 'Briefly describe the job',
                            )),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 20, 20, 0),
                              child: Text('Wage',
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Roboto',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w200)),
                            ),
                            Container(
                                height: 50,
                                width: 50,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding:
                                    const EdgeInsets.fromLTRB(0, 0, 0, -40),
                                    hintText: '0.000',
                                    labelStyle:
                                    TextStyle(color: Colors.teal[500]),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.teal),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.teal),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.teal),
                                    ),
                                  ),
                                )),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 20, 0),
                              child: Text(
                                '-',
                              ),
                            ),
                            Container(
                                height: 50,
                                width: 50,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding:
                                    const EdgeInsets.fromLTRB(0, 0, 0, -40),
                                    hintText: '0.000',
                                    labelStyle:
                                    TextStyle(color: Colors.teal[500]),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.teal),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.teal),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.teal),
                                    ),
                                  ),
                                )),
                            Container(
                                height: 50,
                                padding: const EdgeInsets.fromLTRB(22, 20, 0, 0),
                                child: DropdownButton(
                                  value: _dropDownWages,
                                  icon: Icon(
                                    Icons.arrow_drop_down_circle,
                                    color: Colors.teal,
                                  ),
                                  iconSize: 20,
                                  elevation: 16,
                                  style:
                                  TextStyle(color: Colors.teal, fontSize: 15),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      _dropDownWages = newValue;
                                    });
                                  },
                                  items: _dropDownWagesList
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                ))
                          ],
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 60, 0),
                          child: ButtonBar(children: <Widget>[
                            Radio(
                              value: 1,
                              groupValue: selectedRadio,
                              activeColor: Colors.teal,
                              onChanged: (val) {
                                selectedRadioButton(val);
                              },
                            ),
                            Text('Female', style: TextStyle()),
                            Radio(
                              value: 2,
                              groupValue: selectedRadio,
                              activeColor: Colors.teal,
                              onChanged: (val) {
                                selectedRadioButton(val);
                              },
                            ),
                            Text('Male', style: TextStyle()),
                            Radio(
                              value: 3,
                              groupValue: selectedRadio,
                              activeColor: Colors.teal,
                              onChanged: (val) {
                                selectedRadioButton(val);
                              },
                            ),
                            Text('Anyone', style: TextStyle()),
                          ])),
                      Container(
                        child:getImageContainer(),
                      ),
                      Container(
                        padding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: RaisedButton(
                            onPressed: () {
                              goToAddAddress();
                            },
                            elevation: 15,
                            color: Colors.teal,
                            padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                            child: Text(
                              'Next',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                      )
                    ],
                  ),
                )),
          )),
      bottomNavigationBar: BottomNavigator(),
    );
  }

  List<String> getMatchingJobs(String filterBy) {
    return ['first', 'second', 'third', 'fourth'];
  }

  void goToAddAddress() {
    Map<String, String> m = {"name": "shubham"};
    print('imhere');
    Navigator.pushNamed(context, '/add-address', arguments: m);
    return;
  }

  _imageButtonPressed(ImageSource source, {BuildContext context}) async {
    try {
      final pickedFile = await _picker.getImage(
        source: source,
      );
      setState(() {
        _imageFile = pickedFile;
      });
    } catch (e) {
      print(e);
      setState(() {
        _pickImageError = e;
      });
    }
  }
  getImageContainer(){
    if(_imageFile == null){
      return Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.teal,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: FlatButton(
            onPressed: (){
              _imageButtonPressed(ImageSource.gallery);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[Icon(Icons.file_upload,color: Colors.teal,), Text('Upload Image',style:TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.w100,
                fontSize: 11,
              ))],
            )),
      );
    }else{
      return Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.teal,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          children: <Widget>[
            new Container(
                width: 150,
                padding: EdgeInsets.zero,
                child:  Image.file(File(_imageFile.path)
                  ,fit: BoxFit.fitWidth,)),
            Positioned(
              right: 0.0,
              top: 0.0,
              child: new FloatingActionButton(
                child: const Icon(Icons.close,
                  color: Colors.white,),
                backgroundColor: Colors.transparent,
                onPressed: () {
                  clearImage();
                },
              ),
            ),
          ],
        ),
      );
    }
  }
  void clearImage(){
    setState(() {
      _imageFile = null;
    });
  }

}

