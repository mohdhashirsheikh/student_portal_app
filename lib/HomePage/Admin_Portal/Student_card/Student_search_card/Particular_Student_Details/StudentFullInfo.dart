import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class StudentInfo extends StatefulWidget {
  final String regno;
  StudentInfo({Key? key, required this.regno}) : super(key: key);

  @override
  _StudentInfoState createState() => _StudentInfoState(regno);
}

class _StudentInfoState extends State<StudentInfo> {
  final String regno;
  _StudentInfoState(this.regno);

  // final String regno;
  String? studentPic;
  var studentSrNo;
  var studentName;
  var studentClass;
  var studentSection;
  var studentAddDate;
  var studentBoardRegNo;
  var studentAdhaarId;
  var studentGender;
  var studentCategory;
  var studentDoB;
  var studentGroup;
  var studentBloodGroup;
  var studentReligion;
  var studentAddress;
  var studentCity;
  var studentState;
  var studentEmail;
  var studentPhoneNo;
  var studentBirthCertificate;
  var studentTransCertificate;
  var studentPrevClassMarksheet;
  var studentTransport;
  var studentGameHouse;
  var studentGuardianName;
  var studentGuadianMobNo;
  var studentIdProof;
  var studentIdNo;
  var studentSession;
  var studentStdActiveStatus;

  Future<void> studentDetails() async {
    print("Reg No:" + regno);
    var data = {
      "regno": regno,
    };
    var response = await http.post(
        Uri.parse("http://sniic.co.in/admin/school_app/find_student.php"),
        body: json.encode(data));

    // Getting Server response into variable.
    var obj = jsonDecode(response.body);
    if (obj["result"] == "S") {
      print(obj["data"]["pic"]);
      studentPic = obj["data"]["pic"];
      studentSrNo = obj["data"]["srno"];
      studentName = obj["data"]["name"];
      studentClass = obj["data"]["class"];
      studentSection = obj["data"]["section"];
      studentAddDate = obj["data"]["addmdate"];
      studentBoardRegNo = obj["data"]["boardregno"];
      studentAdhaarId = obj["data"]["adharid"];
      studentGender = obj["data"]["gender"];
      studentCategory = obj["data"]["categ"];
      studentDoB = obj["data"]["dob"];
      studentGroup = obj["data"]["studgroup"];
      studentBloodGroup = obj["data"]["bloodgroup"];
      studentReligion = obj["data"]["religion"];
      studentAddress = obj["data"]["address"];
      studentCity = obj["data"]["city"];
      studentState = obj["data"]["state"];
      studentEmail = obj["data"]["email"];
      studentPhoneNo = obj["data"]["phoneno"];
      studentBirthCertificate = obj["data"]["birthcert"];
      studentTransCertificate = obj["data"]["tc"];
      studentPrevClassMarksheet = obj["data"]["prevclassmarksheet"];
      studentTransport = obj["data"]["transport"];
      studentGameHouse = obj["data"]["gamehouse"];
      studentGuardianName = obj["data"]["guaname"];
      studentGuadianMobNo = obj["data"]["guamobile"];
      studentIdProof = obj["data"]["idproof"];
      studentIdNo = obj["data"]["idno"];
      studentSession = obj["data"]["session"];
      studentStdActiveStatus = obj["data"]["stdActiveStatus"];

      print(studentPic!);
    } else {
      print(obj["message"]);
      print("something Wrong");
    }
  }

  @override
  void initState() {
    super.initState();
    studentDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFBCEBEB),
      appBar: AppBar(
        title: Text("Student Full Details"),
        backgroundColor: Color(0xFF097272),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        width: MediaQuery.of(context).size.width * 0.9,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: studentPic != ""
                      ? NetworkImage(studentPic!)
                      : NetworkImage(""),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          "Name",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        studentName,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Color(0xFF0E0101),
                    thickness: 1,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          "Reg No",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        regno,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Color(0xFF0E0101),
                    thickness: 1,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          "Board Reg No",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        studentBoardRegNo,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Color(0xFF0E0101),
                    thickness: 1,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          "Class",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        studentClass,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Color(0xFF0E0101),
                    thickness: 1,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          "Section",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        studentSection,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Color(0xFF0E0101),
                    thickness: 1,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          "Gender",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        studentGender,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Color(0xFF0E0101),
                    thickness: 1,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          "Date Of Birth",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        studentDoB,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Color(0xFF0E0101),
                    thickness: 1,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          "Admission Date",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        studentAddDate,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Color(0xFF0E0101),
                    thickness: 1,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          "Category",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        studentCategory,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Color(0xFF0E0101),
                    thickness: 1,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          "Religion",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        studentReligion,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Color(0xFF0E0101),
                    thickness: 1,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          "Adhaar Id",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        studentAdhaarId,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Color(0xFF0E0101),
                    thickness: 1,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          "Group",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        studentGroup,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Color(0xFF0E0101),
                    thickness: 1,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          "Blood Group",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        studentBloodGroup,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Color(0xFF0E0101),
                    thickness: 1,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          "Address",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        studentAddress,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Color(0xFF0E0101),
                    thickness: 1,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          "City",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        studentCity,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Color(0xFF0E0101),
                    thickness: 1,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          "State",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        studentState,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Color(0xFF0E0101),
                    thickness: 1,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          "Email",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        studentEmail,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Color(0xFF0E0101),
                    thickness: 1,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          "Phone No",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        studentPhoneNo,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Color(0xFF0E0101),
                    thickness: 1,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          "Session",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        studentSession,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Color(0xFF0E0101),
                    thickness: 1,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          "Transport",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        studentTransport,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Color(0xFF0E0101),
                    thickness: 1,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          "Game House",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        studentGameHouse,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Color(0xFF0E0101),
                    thickness: 1,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          "Guardian Name",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        studentGuardianName,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Color(0xFF0E0101),
                    thickness: 1,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          "Guardian Mob No",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        studentGuadianMobNo,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Color(0xFF0E0101),
                    thickness: 1,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          "Id Proof",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        studentIdProof,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Color(0xFF0E0101),
                    thickness: 1,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          "Id No",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        studentIdNo,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Color(0xFF0E0101),
                    thickness: 1,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          "Birth Certificate",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        studentBirthCertificate,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Color(0xFF0E0101),
                    thickness: 1,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          "Transfer Certificate",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        studentTransCertificate,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Color(0xFF0E0101),
                    thickness: 1,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          "Previous Class Marksheet",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        studentPrevClassMarksheet,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Color(0xFF0E0101),
                    thickness: 1,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          "Status",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: studentStdActiveStatus != "0"
                          ? Text(
                              "Active",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          : Text(
                              "Inactive",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
