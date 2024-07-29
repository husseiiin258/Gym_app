import 'package:flutter/material.dart';
import 'package:gym_app/views/Login/login_page.dart';

class CompleteProfilePage extends StatelessWidget {
  CompleteProfilePage({super.key});
  TextEditingController textEditingController = TextEditingController();
  String gender = "";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/completeprofile.png",
                  )
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Let’s complete your profile",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "It will help us to know more about you!",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  )
                ],
              ),
              SizedBox(
                height: height * .05,
              ),
              Padding(
                padding: EdgeInsets.only(left: width * .03, right: width * .03),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(14)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: textEditingController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(Icons.people_alt_outlined),
                              hintText: "Choose Gender"),
                          readOnly: true,
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return ListView(
                                  children: <Widget>[
                                    ListTile(
                                      title: const Text('Male'),
                                      onTap: () {
                                        textEditingController.text = "Male";
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      title: const Text('Female'),
                                      onTap: () {
                                        textEditingController.text = "Female";
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(14)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.datetime,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(Icons.calendar_month_outlined),
                              hintText: "Date of Birth"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                keyboardType: TextInputType.datetime,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(Icons.monitor_weight_outlined),
                                  hintText: "Your weight",
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: width * .02),
                        Container(
                          width: width * .16,
                          height: height * .06,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: const Color(0xffC58BF2),
                          ),
                          child: const Center(
                              child: Text(
                            "KG",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                keyboardType: TextInputType.datetime,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(Icons.height_outlined),
                                  hintText: "Your Height",
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: width * .02),
                        Container(
                          width: width * .16,
                          height: height * .06,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: const Color(0xffC58BF2),
                          ),
                          child: const Center(
                              child: Text(
                            "CM",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * .07,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color(0xff92A3FD))),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const LoginPage()));
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: height * .02, bottom: height * .02),
                                  child: const Text(
                                    "Next >",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                )))
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
