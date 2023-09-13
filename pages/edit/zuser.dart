import 'dart:async';
import 'dart:io';
import 'package:animations/animations.dart';
import 'package:xyz/pages/edit/additionals/rating_box.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xyz/database/HelperUser.dart';
// import 'package:xyz/date_picker.dart';
import 'package:xyz/model/User.dart';
// import 'package:xyz/rating_box.dart';
import 'package:xyz/utils/Utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xyz/pages/edit/additionals/rating_box.dart';
// import 'package:xyz/detail_page.dart';
// import 'package:xyz/xdance.dart';

class UserPage extends StatefulWidget {
  // static const String routeName = "/user";
  UserPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  FlutterToast flutterToast;

  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.greenAccent,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.check),
        SizedBox(
          width: 12.0,
        ),
        Text("Activity Noted"),
      ],
    ),
  );

  _showToast([String s]) {
    flutterToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }

  var zdatetime;
  bool flag = false;
  bool insertItem = false;
  final teNameController = TextEditingController();
  final tePhoneController = TextEditingController();
  final teEmailController = TextEditingController();
  final teCategoryController = TextEditingController();
  final teDescriptionController = TextEditingController();
  final teDateController = TextEditingController();
  final teCommentController = TextEditingController();
  final teRatingController = TextEditingController();
  final teDoneController = TextEditingController();
  final teReviewController = TextEditingController();
  List<User> items = new List();
  List<User> values;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  ScrollController _scrollController;

  int _rating = 0;
  double _size = 20;

  bool _isDone = false;
  bool _isReview = false;

  SharedAxisTransitionType _transitionType =
      SharedAxisTransitionType.horizontal;

  // File _image;

  // Future getImage() {
  //   final image = await ImagePicker.pickImage(source: ImageSource.camera);
  //   setState(() {
  //     _image = image;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: getAllUser(),
      floatingActionButton: _buildFab(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  Widget _buildIsDone() {
    return SwitchListTile(
      title: Text("Done?", style: TextStyle(fontSize: 20)),
      value: _isDone,
      onChanged: (bool newValue) => setState(() {
        _isDone = newValue;
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    print("INIT");
    flutterToast = FlutterToast(context);
    _scrollController = new ScrollController();
    _scrollController.addListener(() => setState(() {}));
    print(RatingBox());
  }

  Widget _buildFab() {
    bool visibilityFlag = true;
    double max;
    double currentScroll;

    if (_scrollController.hasClients) {
      //visibilityFlag = true;

      max = _scrollController.position.maxScrollExtent;
      double min = _scrollController.position.minScrollExtent;
      currentScroll = _scrollController.position.pixels;

      if ((min == currentScroll) &&
          (_scrollController.position.userScrollDirection ==
              ScrollDirection.idle)) {
        visibilityFlag = true;
      } else if (max == currentScroll) {
        visibilityFlag = false;
      }
    }

    return new Visibility(
      visible: visibilityFlag,
      child: new FloatingActionButton(
        onPressed: () => openAlertBox(null),
        tooltip: 'Increment',
        backgroundColor: Color(0xff00bfa5),
        child: Icon(Icons.add),
      ),
    );
  }

  ///edit User
  editUser(int id) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      var user = User();
      user.id = id;
      user.name = teNameController.text;
      user.phone = tePhoneController.text;
      user.email = teEmailController.text;
      user.category = teCategoryController.text;
      user.description = teDescriptionController.text;
      user.date = teDateController.text;
      user.comment = teCommentController.text;
      user.rating = teRatingController.text;
      user.done = teDoneController.text;
      user.review = teReviewController.text;
      var dbHelper = Helper();
      dbHelper.update(user).then((update) {
        teNameController.text = "";
        tePhoneController.text = "";
        teEmailController.text = "";
        teCategoryController.text = "";
        teDescriptionController.text = "";
        teDateController.text = "";
        teCommentController.text = "";
        teRatingController.text = "";
        teDoneController.text = "";
        teReviewController.text = "";
        Navigator.of(context).pop();
        _showToast();
        setState(() {
          flag = false;
        });
      });
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }

  ///add User Method
  addUser() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      var user = User();
      user.name = teNameController.text;
      user.phone = tePhoneController.text;
      user.email = teEmailController.text;
      user.category = teCategoryController.text;
      user.description = teDescriptionController.text;
      user.date = teDateController.text;
      user.comment = teCommentController.text;
      user.rating = teRatingController.text;
      user.done = teDoneController.text;
      user.review = teReviewController.text;
      var dbHelper = Helper();
      dbHelper.insert(user).then((value) {
        teNameController.text = "";
        tePhoneController.text = "";
        teEmailController.text = "";
        teCategoryController.text = "";
        teDescriptionController.text = "";
        teDateController.text = "";
        teCommentController.text = "";
        teRatingController.text = "";
        teDoneController.text = "";
        teReviewController.text = "";
        Navigator.of(context).pop();
        _showToast("yes");
        setState(() {
          insertItem = true;
        });
      });
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }

  /// openAlertBox to add/edit user
  openAlertBox(User user) {
    if (user != null) {
      teNameController.text = user.name;
      tePhoneController.text = user.phone;
      teEmailController.text = user.email;
      teCategoryController.text = user.category;
      teDescriptionController.text = user.description;
      teDateController.text = user.date;
      teCommentController.text = user.comment;
      teRatingController.text = user.rating;
      teDoneController.text = user.done;
      teReviewController.text = user.review;
      flag = true;
    } else {
      flag = false;
      teNameController.text = "";
      tePhoneController.text = "";
      teEmailController.text = "";
      teCategoryController.text = "";
      teDescriptionController.text = "";
      teDateController.text = "";
      teCommentController.text = "";
      teRatingController.text = "";
      teDoneController.text = "";
      teReviewController.text = "";
    }

    void _updateTransitionType(SharedAxisTransitionType newType) {
      setState(() {
        _transitionType = newType;
      });
    }

    @override
    void _setRatingAsOne() {
      setState(() {
        _rating = 1;
      });
    }

    @override
    void _setRatingAsTwo() {
      setState(() {
        _rating = 2;
      });
    }

    @override
    void _setRatingAsThree() {
      setState(() {
        _rating = 3;
      });
    }

    @override
    void _setRatingAsFour() {
      setState(() {
        _rating = 4;
      });
    }

    @override
    void _setRatingAsFive() {
      setState(() {
        _rating = 5;
      });
    }

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 450.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        flag ? "Edit User" : "Add User",
                        style: TextStyle(fontSize: 28.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 4.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Form(
                      key: _formKey,
                      autovalidate: _autoValidate,
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0)),
                          FlatButton(
                              onPressed: () {
                                DatePicker.showDateTimePicker(context,
                                    showTitleActions: true, onChanged: (date) {
                                  print('change $date in time zone ' +
                                      date.timeZoneOffset.inHours.toString());
                                }, onConfirm: (date) {
                                  teDateController.text = "$date";
                                },
                                    currentTime:
                                        DateTime(2008, 12, 31, 23, 12, 34));
                              },
                              child: Text(
                                'click here to set time',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black12),
                              )),
                          TextFormField(
                            controller: teDateController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.priority_high,
                                size: 20,
                                color: Colors.black54,
                              ),
                              isDense: true,
                              labelText: 'Date and Time...',
                              border: OutlineInputBorder(),
                            ),
                            validator: validateDate,
                            onSaved: (String val) {
                              teDateController.text = val;
                            },
                          ),
                          Padding(
                              padding:
                                  EdgeInsets.fromLTRB(5.0, 37.0, 5.0, 5.0)),
                          TextFormField(
                            controller: teNameController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.priority_high,
                                size: 20,
                                color: Colors.black54,
                              ),
                              isDense: true,
                              labelText: 'Activity Name...',
                              border: OutlineInputBorder(),
                            ),
                            validator: validateName,
                            onSaved: (String val) {
                              teNameController.text = val;
                            },
                          ),
                          Padding(
                              padding:
                                  EdgeInsets.fromLTRB(5.0, 37.0, 5.0, 5.0)),
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: tePhoneController,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.priority_high,
                                size: 20,
                                color: Colors.black54,
                              ),
                              isDense: true,
                              labelText: 'Phone Number...',
                              border: OutlineInputBorder(),
                            ),
                            maxLines: 1,
                            validator: validateMobile,
                            onSaved: (String val) {
                              tePhoneController.text = val;
                            },
                          ),
                          Padding(
                              padding:
                                  EdgeInsets.fromLTRB(5.0, 37.0, 5.0, 5.0)),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: teEmailController,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.priority_high,
                                size: 20,
                                color: Colors.black54,
                              ),
                              isDense: true,
                              labelText: 'Email Address...',
                              border: OutlineInputBorder(),
                            ),
                            maxLines: 1,
                            validator: validateEmail,
                            onSaved: (String val) {
                              teEmailController.text = val;
                            },
                          ),
                          Padding(
                              padding:
                                  EdgeInsets.fromLTRB(5.0, 37.0, 5.0, 5.0)),
                          TextFormField(
                            controller: teCategoryController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.priority_high,
                                size: 20,
                                color: Colors.black54,
                              ),
                              isDense: true,
                              labelText: 'Category...',
                              border: OutlineInputBorder(),
                            ),
                            validator: validateCategory,
                            onSaved: (String val) {
                              teCategoryController.text = val;
                            },
                          ),
                          Padding(
                              padding:
                                  EdgeInsets.fromLTRB(5.0, 37.0, 5.0, 5.0)),
                          TextFormField(
                            controller: teDescriptionController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.priority_high,
                                size: 20,
                                color: Colors.black54,
                              ),
                              isDense: true,
                              labelText: 'Description...',
                              border: OutlineInputBorder(),
                            ),
                            validator: validateDescription,
                            onSaved: (String val) {
                              teDescriptionController.text = val;
                            },
                          ),
                          Padding(
                              padding:
                                  EdgeInsets.fromLTRB(5.0, 37.0, 5.0, 5.0)),
                          TextFormField(
                            controller: teCommentController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.priority_high,
                                size: 20,
                                color: Colors.black54,
                              ),
                              isDense: true,
                              labelText: 'Comment...',
                              border: OutlineInputBorder(),
                            ),
                            validator: validateComment,
                            onSaved: (String val) {
                              teCommentController.text = val;
                            },
                          ),
                          Padding(
                              padding:
                                  EdgeInsets.fromLTRB(5.0, 37.0, 5.0, 5.0)),
                          // const RatingBox(teRatingController.text = zrating),

                          TextFormField(
                            controller: teRatingController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.priority_high,
                                size: 20,
                                color: Colors.black54,
                              ),
                              isDense: true,
                              labelText: 'Comment...',
                              border: OutlineInputBorder(),
                            ),
                            validator: validateRating,
                            onSaved: (String val) {
                              teRatingController.text = val;
                            },
                          ),
                          //sd

                          _buildIsDone(),
                          //sd
                          TextFormField(
                            controller: teRatingController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.priority_high,
                                size: 20,
                                color: Colors.black54,
                              ),
                              isDense: true,
                              labelText: 'Rating...',
                              border: OutlineInputBorder(),
                            ),
                            validator: validateRating,
                            onSaved: (String val) {
                              teRatingController.text = val;
                              // RatingBox(context) = teRatingController.text;
                              setState(() {});
                            },
                          ),
                          Padding(
                              padding:
                                  EdgeInsets.fromLTRB(5.0, 37.0, 5.0, 5.0)),
                          TextFormField(
                            controller: teDoneController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.priority_high,
                                size: 20,
                                color: Colors.black54,
                              ),
                              isDense: true,
                              labelText: 'completed...',
                              border: OutlineInputBorder(),
                            ),
                            validator: validateDone,
                            onSaved: (String val) {
                              teDoneController.text = val;
                            },
                          ),
                          Padding(
                              padding:
                                  EdgeInsets.fromLTRB(5.0, 37.0, 5.0, 5.0)),
                          TextFormField(
                            controller: teReviewController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.priority_high,
                                size: 20,
                                color: Colors.black54,
                              ),
                              isDense: true,
                              labelText: 'Review...',
                              border: OutlineInputBorder(),
                            ),
                            validator: validateReview,
                            onSaved: (String val) {
                              teReviewController.text = val;
                            },
                          ),
                          const _CourseSwitch(course: 'Completed ?'),
                          Padding(padding: EdgeInsets.all(0)),
                          const _CourseSwitch(course: 'Do Again ?'),
                          Padding(padding: EdgeInsets.all(0)),
                          Padding(
                              padding:
                                  EdgeInsets.fromLTRB(5.0, 37.0, 5.0, 5.0)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Radio<SharedAxisTransitionType>(
                                value: SharedAxisTransitionType.horizontal,
                                groupValue: _transitionType,
                                onChanged: (SharedAxisTransitionType newValue) {
                                  _updateTransitionType(newValue);
                                },
                              ),
                              const Text('X'),
                              Radio<SharedAxisTransitionType>(
                                value: SharedAxisTransitionType.vertical,
                                groupValue: _transitionType,
                                onChanged: (SharedAxisTransitionType newValue) {
                                  _updateTransitionType(newValue);
                                },
                              ),
                              const Text('Y'),
                              Radio<SharedAxisTransitionType>(
                                value: SharedAxisTransitionType.scaled,
                                groupValue: _transitionType,
                                onChanged: (SharedAxisTransitionType newValue) {
                                  _updateTransitionType(newValue);
                                },
                              ),
                              const Text('Z'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => flag ? editUser(user.id) : addUser(),
                    child: Container(
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        color: Color(0xff00bfa5),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25.0),
                            bottomRight: Radius.circular(25.0)),
                      ),
                      child: Text(
                        flag ? "Edit User" : "Add User",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  /// Validation Check
  String validateName(String value) {
    if (value.length < 3)
      return 'Name must be more than 2 charater';
    else if (value.length > 30) {
      return 'Name must be less than 30 charater';
    } else
      return null;
  }

  String validateMobile(String value) {
    Pattern pattern = r'^[0-9]*$';
    RegExp regex = new RegExp(pattern);
    if (value.trim().length != 10)
      return 'Mobile Number must be of 10 digit';
    else if (value.startsWith('+', 0)) {
      return 'Mobile Number should not contain +91';
    } else if (value.trim().contains(" ")) {
      return 'Blank space is not allowed';
    } else if (!regex.hasMatch(value)) {
      return 'Characters are not allowed';
    } else
      return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else if (value.length > 30) {
      return 'Email length exceeds';
    } else
      return null;
  }

  String validateCategory(String value) {
    if (value.length < 3)
      return 'Name must be more than 2 charater';
    else if (value.length > 30) {
      return 'Name must be less than 30 charater';
    } else
      return null;
  }

  String validateDescription(String value) {
    if (value.length < 3)
      return 'Name must be more than 2 charater';
    else if (value.length > 30) {
      return 'Name must be less than 30 charater';
    } else
      return null;
  }

  String validateDate(String value) {
    if (value.length < 3)
      return 'Name must be more than 2 charater';
    else if (value.length > 30) {
      return 'Name must be less than 30 charater';
    } else
      return null;
  }

  String validateComment(String value) {
    if (value.length < 3)
      return 'Name must be more than 2 charater';
    else if (value.length > 30) {
      return 'Name must be less than 30 charater';
    } else
      return null;
  }

  String validateRating(String value) {
    if (value.length != 1)
      return 'Rating must be one digit';
    else if (value.length > 30) {
      return 'Name must be less than 30 charater';
    } else
      return null;
  }

  String validateDone(String value) {
    if (value.length != 1)
      return 'If task completed input 1';
    else if (value.length > 1) {
      return 'If task completed input 1';
    } else
      return null;
  }

  String validateReview(String value) {
    if (value.length != 1)
      return 'Review must be one digit';
    else if (value.length > 1) {
      return 'Review must be one digit';
    } else
      return null;
  }

  /// Get all users data
  getAllUser() {
    return FutureBuilder(
        future: _getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return createListView(context, snapshot);
        });
  }

  ///Fetch data from database
  Future<List<User>> _getData() async {
    var dbHelper = Helper();
    await dbHelper.getAllUsers().then((value) {
      items = value;
      if (insertItem) {
        _listKey.currentState.insertItem(values.length);
        insertItem = false;
      }
    });

    return items;
  }

  ///create List View with Animation
  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    values = snapshot.data;
    if (values != null) {
      showProgress();
      return new AnimatedList(
          key: _listKey,
          controller: _scrollController,
          shrinkWrap: true,
          initialItemCount: values.length,
          itemBuilder: (BuildContext context, int index, animation) {
            return _buildItem(values[index], animation, index);
          });
    } else
      return Container();
  }

  ///Construct cell for List View
  Widget _buildItem(User values, Animation<double> animation, int index) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        child: ListTile(
          onTap: () => onItemClick(values),
          title: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.brown.shade800,
                      child: Text(
                        values.name.substring(0, 1).toUpperCase(),
                        style: TextStyle(fontSize: 35, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 5.0)),
                  new Row(
                    children: <Widget>[
                      Icon(Icons.account_circle),
                      Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0)),
                      new InkWell(
                        child: Container(
                          constraints: new BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width - 200),
                          child: Text(
                            values.date,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontStyle: FontStyle.normal,
                                color: Colors.black),
                            maxLines: 2,
                            softWrap: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 5.0)),
                  new Row(
                    children: <Widget>[
                      Icon(Icons.account_circle),
                      Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0)),
                      new InkWell(
                        child: Container(
                          constraints: new BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width - 200),
                          child: Text(
                            values.description,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontStyle: FontStyle.normal,
                                color: Colors.black),
                            maxLines: 2,
                            softWrap: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 5.0)),
                  new Row(
                    children: <Widget>[
                      Icon(Icons.account_circle),
                      Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0)),
                      new InkWell(
                        child: Container(
                          constraints: new BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width - 200),
                          child: Text(
                            values.name,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontStyle: FontStyle.normal,
                                color: Colors.black),
                            maxLines: 2,
                            softWrap: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 5.0)),
                  new Row(
                    children: <Widget>[
                      Icon(Icons.phone),
                      Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0)),
                      new InkWell(
                        child: new Text(
                          values.phone.toString(),
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 5.0)),
                  new Row(
                    children: <Widget>[
                      Icon(Icons.email),
                      Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0)),
                      new InkWell(
                        child: Container(
                          constraints: new BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width - 200),
                          child: new Text(
                            values.email.toString(),
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.black),
                            textAlign: TextAlign.left,
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //adah aja

                  Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 10.0)),
                ],
              ),
            ],
          ),
          trailing: Column(
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                child: IconButton(
                    color: Colors.black,
                    icon: new Icon(Icons.edit),
                    onPressed: () => onEdit(values, index)),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: IconButton(
                    color: Colors.black,
                    icon: new Icon(Icons.delete),
                    onPressed: () => onDelete(values, index)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///On Item Click
  onItemClick(User values) {}

  /// Delete Click and delete item
  onDelete(User values, int index) {
    var id = values.id;
    var dbHelper = Helper();
    dbHelper.delete(id).then((value) {
      User removedItem = items.removeAt(index);

      AnimatedListRemovedItemBuilder builder = (context, animation) {
        return _buildItem(removedItem, animation, index);
      };
      _listKey.currentState.removeItem(index, builder);
    });
  }

  /// Edit Click
  onEdit(User user, int index) {
    openAlertBox(user);
  }
}

class _CourseSwitch extends StatefulWidget {
  const _CourseSwitch({
    this.course,
  });

  final String course;

  @override
  _CourseSwitchState createState() => _CourseSwitchState();
}

class _CourseSwitchState extends State<_CourseSwitch> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    final String subtitle = _value ? 'Yes' : 'No';
    return SwitchListTile(
      title: Text(widget.course),
      subtitle: Text(subtitle),
      value: _value,
      onChanged: (bool newValue) {
        setState(() {
          _value = newValue;
        });
      },
    );
  }
}
