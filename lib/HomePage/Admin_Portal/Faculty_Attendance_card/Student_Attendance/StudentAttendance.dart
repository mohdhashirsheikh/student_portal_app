import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class StudentAttendance extends StatefulWidget {
  StudentAttendance({Key? key}) : super(key: key);

  @override
  _StudentAttendanceState createState() => _StudentAttendanceState();
}

class _StudentAttendanceState extends State<StudentAttendance> {
  //TextEditingController className = new TextEditingController();
  TextEditingController section = new TextEditingController();
  //TextEditingController regno = new TextEditingController();
  TextEditingController subject = new TextEditingController();
  //TextEditingController period = new TextEditingController();
  TextEditingController facultyId = new TextEditingController();
  var className;
  var periodNum;
  String regNum = "";
  List? searchStudentList;
  Map<String, bool> countToValue = <String, bool>{};
  List classList = [
    "Nursury",
    "LKG",
    "UKG",
    "1st",
    "2nd",
    "3rd",
    "4th",
    "5th",
    "6th",
    "7th",
    "8th",
    "9th",
    "10th",
    "11th",
    "12th",
  ];
  List period = [
    "1st",
    "2nd",
    "3rd",
    "4th",
    "5th",
    "6th",
    "7th",
    "8th",
  ];
  bool isLoading = false;
  bool isLoadingAttendance = false;
  String error = "";
  String errorAttendance = "";

  Future<void> searchStudentClassInfo() async {
    if (className == null &&
        section.text.isEmpty &&
        subject.text.isEmpty &&
        periodNum == null &&
        facultyId.text.isEmpty) {
      setState(() {
        error = "Please fill the All fields";
        isLoading = false;
      });
    } else {
      setState(() {
        error = "";
        isLoading = true;
      });

      print("class:" + className);
      print("section:" + section.text);
      print("subject:" + subject.text);
      print("period:" + periodNum);
      print("faculty:" + facultyId.text);
      var data = {
        "class": className,
      };
      var response = await http.post(
          Uri.parse(
              "http://sniic.co.in/admin/school_app/student_detail_json.php"),
          body: json.encode(data));
      var obj = jsonDecode(response.body);
      if (obj["result"] == "S") {
        setState(() {
          error = "";
          isLoading = false;
          searchStudentList = obj["data"];
        });
      } else {
        setState(() {
          error = obj["message"];
          isLoading = false;
        });
      }
    }
  }

  Future<void> submitStudentAttendance() async {
    if (className == null &&
        section.text.isEmpty &&
        subject.text.isEmpty &&
        periodNum == null &&
        facultyId.text.isEmpty) {
      setState(() {
        errorAttendance = "Please fill the All fields";
        isLoadingAttendance = false;
      });
    } else {
      setState(() {
        errorAttendance = "";
        isLoading = true;
      });
      countToValue.forEach((i, value) {
        if (value == true) {
          print(i);
          regNum = regNum + i + ",";
        }
      });

      print("class:" + className);
      print("section:" + section.text);
      print("subject:" + subject.text);
      print("period:" + periodNum);
      print("regno:" + regNum);
      print("faculty:" + facultyId.text);
      var data = {
        "regnos": regNum,
        "class": className,
        "section": section.text,
        "subject": subject.text,
        "period": periodNum,
        "fid": facultyId.text,
      };
      var response = await http.post(
          Uri.parse(
              "http://sniic.co.in/admin/school_app/student_attendance.php"),
          body: json.encode(data));
      var obj = jsonDecode(response.body);
      if (obj["result"] == "S") {
        setState(() {
          errorAttendance = "Student Attendance Successfully Done";
          isLoading = false;
          regNum = "";
          countToValue = {};
        });
      } else {
        setState(() {
          errorAttendance = obj["message"];
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFBCEBEB),
      appBar: AppBar(
        backgroundColor: Color(0xFF097272),
        title: Text("Student Attendance"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        width: MediaQuery.of(context).size.width * 0.9,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30, bottom: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Class Name:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 50),
                          child: DropdownButton(
                            isExpanded: true,
                            underline: Text(""),
                            hint: Text("Select Current Class"),
                            value: className,
                            items: classList.map<DropdownMenuItem<String>>((e) {
                              return DropdownMenuItem<String>(
                                child: Text(e),
                                value: e,
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                className = value.toString();
                                print(className);
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                //color: Color(0xFFFFFFFF),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: TextFormField(
                    controller: section,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.class__rounded,
                        color: Colors.black,
                        size: 24,
                      ),
                      border: InputBorder.none,
                      labelText: "Section",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      hintText: "Enter Section",
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                //color: Color(0xFFFFFFFF),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: TextFormField(
                    controller: subject,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.subject_rounded,
                        color: Colors.black,
                        size: 24,
                      ),
                      border: InputBorder.none,
                      labelText: "Subject Name",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      hintText: "Enter Subject Name",
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Class Name:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 50),
                          child: DropdownButton(
                            isExpanded: true,
                            underline: Text(""),
                            hint: Text("Select Current Class"),
                            value: periodNum,
                            items: period.map<DropdownMenuItem<String>>((e) {
                              return DropdownMenuItem<String>(
                                child: Text(e),
                                value: e,
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                periodNum = value.toString();
                                print(periodNum);
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                //color: Color(0xFFFFFFFF),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: TextFormField(
                    controller: facultyId,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person_rounded,
                        color: Colors.black,
                        size: 24,
                      ),
                      border: InputBorder.none,
                      labelText: "Faculty Id",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      hintText: "Enter Faculty Id",
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: error != ""
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          error,
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                          textAlign: TextAlign.left,
                        ),
                      )
                    : Text(""),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF097272),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {
                    searchStudentClassInfo();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: isLoading != false
                        ? Text(
                            "Loading.....",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        : Text(
                            "Submit",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:
                      searchStudentList == null ? 0 : searchStudentList!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      margin: EdgeInsets.symmetric(vertical: 2.5),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: CheckboxListTile(
                        secondary: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey,
                          child: Icon(
                            Icons.person_rounded,
                            color: Color(0xFFFFFFFF),
                            size: 30,
                          ),
                        ),
                        title: Text(
                          searchStudentList![index]["name"],
                        ),
                        subtitle: Text(
                          '${searchStudentList![index]["regno"]}\n${searchStudentList![index]["class"]}',
                          style: TextStyle(height: 1.8),
                        ),

                        selected:
                            countToValue[searchStudentList![index]["regno"]] ??
                                false,
                        autofocus: true,
                        activeColor: Color(0xFF097272),
                        checkColor: Colors.white,
                        //activeColor: Colors.red,
                        value:
                            countToValue[searchStudentList![index]["regno"]] ??
                                false,
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            countToValue[searchStudentList![index]["regno"]] =
                                value!;

                            print(countToValue);
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              Container(
                child: errorAttendance != ""
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          errorAttendance,
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                          textAlign: TextAlign.left,
                        ),
                      )
                    : Text(""),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: searchStudentList == null
                    ? Text("")
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF097272),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          submitStudentAttendance();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: isLoadingAttendance != false
                              ? Text(
                                  "Submitting.....",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              : Text(
                                  "Attendace Submit",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                      ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
