import 'package:covid_19_job/const/ui_pages.dart';
import 'package:covid_19_job/models/rest_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_job/utils/bottom_navigator.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:covid_19_job/pages/add_update_job/add_address.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:covid_19_job/utils/utils.dart';
import 'package:covid_19_job/pages/add_update_job/add_update_job_controller.dart';
import 'dart:io';


class AddJob extends StatefulWidget {
  @override
  _AddJobState createState() => _AddJobState();
}

class _AddJobState extends State<AddJob> {
  final _formKey = GlobalKey<FormState>();
  final List<DropdownMenuItem> items = [];
  String imagePath = '';
  //this is also job type controller
  TextEditingController _dropDownController = new TextEditingController();
  TextEditingController _jobDescriptionController = new TextEditingController();
  TextEditingController _startLimitController  = new TextEditingController();
  TextEditingController _endLimitController = new TextEditingController();


   bool _isValidJobType = false;
  List<String> jobs = new List();
  String selectedValue = '';
  String _dropDownWages = 'Daily';
  List<String> _dropDownWagesList = ['Hourly', 'Daily', 'Monthly', 'Yearly'];
  dynamic selectedRadio = 1;
  List<String> gender = ['','Female','Male','Anyone'];
  final ImagePicker _picker = ImagePicker();
  PickedFile _imageFile;
  dynamic _pickImageError;

  FocusNode _jobTypeFocus = FocusNode();
  FocusNode _jobDescriptionFocus = FocusNode();
  FocusNode _wageEndLimitFocus = FocusNode();
  FocusNode _wageStartLimitFocus = FocusNode();
  FocusNode _jobTimingFocus = FocusNode();
  FocusNode _genderFocus = FocusNode();

  selectedRadioButton(val) {
    setState(() {
      print(val);
      selectedRadio = val;
    });
  }

  @override
  void initState() {
    super.initState();
    getMatchingJobs();
    _dropDownController.addListener(() {
      if (_dropDownController.text.length > 4 &&
          !jobs.contains(_dropDownController.text)) {
        jobs.add(_dropDownController.text);
      }
    });
  }

  @override
  void dispose() {

    _dropDownController.dispose();
    _jobDescriptionController.dispose();
    _startLimitController.dispose();
    _endLimitController.dispose();
    super.dispose();
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
                          controller: _jobDescriptionController,
                            focusNode: _jobDescriptionFocus,
                            onFieldSubmitted: (term) {
                              Utils.fieldFocusChange(
                                  context, _jobDescriptionFocus, _wageStartLimitFocus);
                            },
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
                                  controller: _startLimitController,
                                  focusNode: _wageStartLimitFocus,
                                  onFieldSubmitted: (term) {
                                    Utils.fieldFocusChange(
                                        context, _wageStartLimitFocus, _wageEndLimitFocus);
                                  },

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
                                  controller: _endLimitController,
                                  focusNode: _wageEndLimitFocus,
                                  onFieldSubmitted: (term) {
                                    Utils.fieldFocusChange(
                                        context, _wageEndLimitFocus, _jobTimingFocus);
                                  },
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
                              if (_formKey.currentState.validate()){
                                goToAddAddress();
                              }else{

                              }

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

  Future<List<String>> getMatchingJobs() async{
    JobsController jb = new JobsController();

    jb.getJobTypes().then((value){
      print(value);
      print(value['data']);
        List<String>jobTypes = new List<String>.from(value['data']['jobTypes']);
        setState(() {
          this.jobs = jobTypes;
        });
    }).catchError((error){
      setState(() {
        print(error);
        this.jobs = ['Plumber', 'Carpenter' , 'Maid'];
      });
    });

  }

  void goToAddAddress() {
    Map<String,String> nextPagePayload = {
    'jobType' : _dropDownController.text,
    'jobDescriptions' : _jobDescriptionController.text,
    'wageTiming' : _dropDownWages,
    'wageLowLimit' : _startLimitController.text,
    'wageHighLimit' : _endLimitController.text,
    'gender' : gender[selectedRadio],
    'imagePath' : imagePath,
    };
    Navigator.pushNamed(context, UiPagesPath.ADD_JOB_ADDRESS, arguments: nextPagePayload);
    return;
  }

  _imageButtonPressed(ImageSource source, {BuildContext context}) async {
    try {
      final pickedFile = await _picker.getImage(
        source: source,
      );
      setState(() {
        _imageFile = pickedFile;
        print(_imageFile.path);
        String imageType = _imageFile.path.split('.').last;
        print(imageType);
        if(imageType != 'jpeg' && imageType != 'jpg' && imageType != 'png'){
          showAlertDialogInInvalidImage(context);
          clearImage();
        }else{
          uploadImage();
        }
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
              _imageButtonPressed(ImageSource.gallery,context: context);
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
  snackBar(isValidated) {

    if (isValidated) {
      Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        content: Text("Successfully validated"),
      ));
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text("Validation failed"),
      ));
    }
  }
  showAlertDialogInInvalidImage(BuildContext context) {
   print("inside show alert box");
   print(context);
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Invalid image"),
      content: Text("Only allow jpg, jpeg, png ."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  uploadImage() async{
    print("uploading image");
    JobsController jb = new JobsController();
  jb.uploadImage(File(_imageFile.path)).then((value){
    if (value.elementAt(0).isEmpty){
      ErrorUploadingImage(context,value.elementAt(1));
      clearImage();
    }else{
      this.imagePath = value.elementAt(0);
    }
    }).catchError((onError){
    ErrorUploadingImage(context,onError.toString());
    clearImage();
   });

  }

  ErrorUploadingImage(BuildContext context,msg) {
    print("inside show alert box");
    print(context);
    // set up the button
    Widget okButton = FlatButton(
      child: Text("try again"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Error uploading image"),
      content: Text(msg),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

