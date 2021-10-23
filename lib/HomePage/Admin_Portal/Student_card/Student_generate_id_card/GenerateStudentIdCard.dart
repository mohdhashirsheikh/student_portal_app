import 'package:flutter/material.dart';

class GenerateStudentIdCard extends StatefulWidget {
  final Map studentInfo;
  GenerateStudentIdCard({Key? key, required this.studentInfo})
      : super(key: key);

  @override
  _GenerateStudentIdCardState createState() =>
      _GenerateStudentIdCardState(studentInfo);
}

class _GenerateStudentIdCardState extends State<GenerateStudentIdCard> {
  final Map studentInfo;
  _GenerateStudentIdCardState(this.studentInfo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFBCEBEB),
      appBar: AppBar(
        backgroundColor: Color(0xFF097272),
        title: Text("Student Id Card"),
      ),
      body: Container(
        height: 550,
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.025,
            vertical: 100),
        width: MediaQuery.of(context).size.width * 0.95,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Id_card_background.jpeg'),
            //fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 100),
                child: studentInfo['pic'] != null
                    ? CircleAvatar(
                        radius: 80,
                        backgroundImage: NetworkImage(studentInfo['pic']),
                      )
                    : CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.blueGrey,
                        child: Icon(
                          Icons.person_rounded,
                          size: 80,
                        ),
                      ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Text(
                          "Reg. No",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.03,
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        studentInfo['regno'],
                        style: TextStyle(
                          color: Colors.black,
                          height: 1.5,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Text(
                          "Name",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.03,
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        studentInfo['name'],
                        style: TextStyle(
                          color: Colors.black,
                          height: 1.5,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Text(
                          "Class",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.03,
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        studentInfo['class'],
                        style: TextStyle(
                          color: Colors.black,
                          height: 1.5,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Text(
                          "Section",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.03,
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        studentInfo['section'],
                        style: TextStyle(
                          color: Colors.black,
                          height: 1.5,
                          fontSize: 14,
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
