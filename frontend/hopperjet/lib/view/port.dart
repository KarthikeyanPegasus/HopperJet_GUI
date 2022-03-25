import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hopperjet/interacter/interactor.dart';
import 'package:hopperjet/presenter/localsource/source.dart';
import 'package:hopperjet/view/widgets/navbar.dart';
import 'package:url_launcher/url_launcher.dart';

class PortScanner extends StatefulWidget {
  const PortScanner({Key? key}) : super(key: key);

  @override
  State<PortScanner> createState() => _PortScannerState();
}

class _PortScannerState extends State<PortScanner> {
  late bool isfound;
  String IPaddress = "";
  String Port = "";
  String Timeout = "";
  String Verbose = "";
  String dropdownvalue = portList[8];
  late bool isstarted = false;
  late String VerifiedIp;
  late String outputstr;

  @override
  void initState() {
    super.initState();
    setState(() {
      isstarted = false;
      outputstr = """Preparing ...""";
    });
    CustomInteractor().DeleteErr();
    CustomInteractor().DeleteInp();
    CustomInteractor().DeleteOut();
    CustomInteractor().CheckErr().then((value) {
      setState(() {
        isfound = value;
        log(isfound.toString());
      });
    });
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Appname,
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 80, 0),
            child: Column(
              children: [
                const Icon(Icons.support_outlined),
                Container(
                  margin: const EdgeInsets.only(top: 2),
                  child: const Text(
                    support,
                    style: TextStyle(fontSize: 14),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CustomNavBar(
            Active: 4,
          ),
          Stack(
            children: [
              Image.asset(
                "image/h7.png",
                width: MediaQuery.of(context).size.width - 120,
                fit: BoxFit.cover,
              ),
              !isfound
                  ? Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width - 120,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.lightGreen, Colors.transparent])),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width - 120,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.redAccent, Colors.transparent])),
                    ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.20,
                        left: MediaQuery.of(context).size.width * 0.05),
                    child: const Text(
                      Feature7,
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02,
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: const Text(
                      F7theory,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 10,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 15,
                      left: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: TextButton(
                      onPressed: () {
                        const url =
                            'https://en.wikipedia.org/wiki/Port_scanner';
                        launchURL(url);
                        // redirect to the wiki page
                      },
                      child: const Text(
                        LearnMoreHint,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor: Color.fromARGB(500, 196, 196, 196),
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 15, right: 15),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        margin: EdgeInsets.only(
                            top: 50,
                            left: MediaQuery.of(context).size.width * 0.05),
                        child: TextField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter the IP address',
                          ),
                          onChanged: (text) {
                            setState(() {
                              IPaddress = text;
                            });
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.10,
                        margin: EdgeInsets.only(
                            top: 50,
                            left: MediaQuery.of(context).size.width * 0.02),
                        child: TextButton(
                          onPressed: () {
                            // redirect to the verify func in python
                            String text = """
                                {
                                  "Method": "Verify",
                                  "IP_Address": "$IPaddress"
                                }
                                """;
                            CustomInteractor().DeleteInp();
                            CustomInteractor().DeleteErr();
                            CustomInteractor().write(text);
                            CustomInteractor().verifyIP();

                            Timer(const Duration(seconds: 4), () {
                              CustomInteractor().CheckErr().then((value) {
                                setState(() {
                                  isfound = value;
                                  log(isfound.toString());
                                  !isfound
                                      ? VerifiedIp = IPaddress
                                      : IPaddress = "";
                                  !isfound
                                      ? outputstr = "Verified"
                                      : outputstr =
                                          "Please Check the IP- Invalid Format";
                                });
                              });
                            });
                          },
                          child: const Text(
                            "Verify",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            backgroundColor: Color.fromARGB(500, 196, 196, 196),
                            padding: const EdgeInsets.only(top: 25, bottom: 25),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.11,
                        margin: EdgeInsets.only(
                            top: 50,
                            left: MediaQuery.of(context).size.width * 0.02),
                        child: DropdownButton(
                          dropdownColor: Color.fromARGB(500, 149, 149, 145),
                          value: dropdownvalue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: portList.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                              outputstr = "All ready Waiting to start.....";
                            });
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.07,
                        margin: EdgeInsets.only(
                            top: 50,
                            left: MediaQuery.of(context).size.width * 0.02),
                        child: TextField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Port number',
                          ),
                          onChanged: (text) {
                            setState(() {
                              Port = text;
                            });
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.07,
                        margin: EdgeInsets.only(
                            top: 50,
                            left: MediaQuery.of(context).size.width * 0.02),
                        child: TextField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Timeout',
                          ),
                          onChanged: (text) {
                            setState(() {
                              Timeout = text;
                            });
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.07,
                        margin: EdgeInsets.only(
                            top: 50,
                            left: MediaQuery.of(context).size.width * 0.02),
                        child: TextField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Verbose',
                          ),
                          onChanged: (text) {
                            setState(() {
                              Verbose = text;
                            });
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.10,
                        margin: EdgeInsets.only(
                            top: 50,
                            left: MediaQuery.of(context).size.width * 0.02),
                        child: TextButton(
                          onPressed: () {
                            // redirect to the start func in python
                            String text = """
                                {
                                  "Method": "Port Scanner",
                                  "IP_Address": "$VerifiedIp",
                                  "Drop_Down": "$dropdownvalue",
                                  "Port":"$Port",
                                  "Time_Out":"$Timeout",
                                  "Verbose":"$Verbose"
                                }
                                """;
                            CustomInteractor().DeleteOut();
                            CustomInteractor().DeleteInp();
                            CustomInteractor().write(text);
                            CustomInteractor().port();
                            setState(() {
                              outputstr = "Loading ...";
                            });
                            Timer.periodic(const Duration(seconds: 2), (timer) {
                              if (outputstr != "" &&
                                  outputstr !=
                                      "All ready Waiting to start....." &&
                                  outputstr !=
                                      "Please Check the IP- Invalid Format" &&
                                  outputstr != "Verified" &&
                                  outputstr != "Loading ..." &&
                                  outputstr != """Preparing ...""") {
                                return;
                              } else {
                                CustomInteractor().CheckOutput().then((value) {
                                  setState(() {
                                    isstarted = !value;
                                    log(isstarted.toString());
                                    if (!isstarted) {
                                      CustomInteractor().Read().then((value) {
                                        setState(() {
                                          outputstr = value;
                                        });
                                      });
                                    }
                                  });
                                });
                              }
                            });
                          },
                          child: const Text(
                            "Start",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            backgroundColor: Colors.lightGreen,
                            padding: const EdgeInsets.only(top: 25, bottom: 25),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 120,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.09),
                    child: Center(
                        child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.35,
                      color: Colors.black,
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
                        margin: EdgeInsets.only(top: 10, left: 10),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(
                            outputstr,
                            style: const TextStyle(color: Colors.greenAccent),
                          ),
                        ),
                      ),
                    )),
                  )
                ],
              ),
            ],
          )
        ],
      )),
    );
  }
}
