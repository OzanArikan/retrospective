import 'package:flutter/material.dart';
import 'package:retrospektive/model/retro_page_params.dart';
import 'package:retrospektive/repository/firebase_repository.dart';
import 'package:retrospektive/template/abstract_base_template.dart';

class AddNewContentPage extends StatefulWidget {
  AddNewContentPage(this._retroPageParams, this._firebaseRepository);

  RetroPageParams _retroPageParams;
  FirebaseRepository _firebaseRepository;

  @override
  _AddNewContentPageState createState() => _AddNewContentPageState();
}

class _AddNewContentPageState extends State<AddNewContentPage> {
  TextEditingController _addContentTextController = TextEditingController();
  TextEditingController _selectTitleTextController = TextEditingController();
  String dropdownValue;
  bool isEnabled = false;

  @override
  void initState() {
    _addContentTextController.addListener(_checkButtonEnable);
    dropdownValue = widget._retroPageParams.template.titles[0];
  }

  @override
  void dispose() {
    _addContentTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(right: 50, left: 50),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          value: dropdownValue,
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: widget._retroPageParams.template.titles
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                        width: double.infinity,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          maxLength: 200,
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: 'Add Content',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          controller: _addContentTextController,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                        width: double.infinity,
                      ),
                      SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: !isEnabled ? null : (){createRetroRowAndPop();},
                            child: Text("Add"),
                          )),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  _checkButtonEnable() {
    if (_addContentTextController == null ||
        _addContentTextController.text == '' ||
        _addContentTextController.text == null) {
      setState(() {
        isEnabled = false;
      });
    } else {
      setState(() {
        isEnabled = true;
      });
    }
  }

  createRetroRowAndPop() {
    widget._firebaseRepository.createDocument(
        _addContentTextController.text,
        dropdownValue,
        widget._retroPageParams.roomCode,
        widget._retroPageParams.template);
    Navigator.pop(context);
  }
}
