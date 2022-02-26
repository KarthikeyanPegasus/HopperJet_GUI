import 'package:flutter/material.dart';
import 'package:hopperjet/presenter/localsource/source.dart';
import 'package:hopperjet/view/widgets/navbar.dart';

class DnsSpoofDetection extends StatefulWidget {
  const DnsSpoofDetection({Key? key}) : super(key: key);

  @override
  State<DnsSpoofDetection> createState() => _DnsSpoofDetectionState();
}

class _DnsSpoofDetectionState extends State<DnsSpoofDetection> {
  bool isfound = false;
  String interface = "";
  bool isstarted = false;

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
            Active: 3,
          ),
          Stack(
            children: [
              Image.asset(
                "image/h5.png",
                width: MediaQuery.of(context).size.width - 120,
                fit: BoxFit.cover,
              ),
              isfound
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
                      Feature5,
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
                      F2theory,
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
                            hintText: 'Enter the Interface',
                          ),
                          onChanged: (text) {
                            setState(() {
                              interface = text;
                            });
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.10,
                        margin: EdgeInsets.only(
                            top: 50,
                            left: MediaQuery.of(context).size.width * 0.05),
                        child: TextButton(
                          onPressed: () {
                            // redirect to the start func in python
                            setState(() {
                              isfound == true
                                  ? isfound = false
                                  : isfound = true;
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
                      child: !isstarted
                          ? Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.35,
                              color: Colors.black,
                              padding: const EdgeInsets.only(top: 5),
                              child: Container(
                                margin: EdgeInsets.only(top: 10, left: 10),
                                child: const Text(
                                  output,
                                  style: TextStyle(color: Colors.greenAccent),
                                ),
                              ),
                            )
                          : Stack(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height:
                                      MediaQuery.of(context).size.height * 0.35,
                                  color: Colors.black,
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10, left: 10),
                                    child: const Text(
                                      output,
                                      style:
                                          TextStyle(color: Colors.greenAccent),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: const Color.fromARGB(1000, 43, 45, 46),
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height:
                                      MediaQuery.of(context).size.height * 0.35,
                                  child: Center(
                                    child: Image.asset(
                                      "image/loading.gif",
                                      height: 400,
                                      width: 400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
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
