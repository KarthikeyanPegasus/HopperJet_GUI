import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:process_run/shell_run.dart';

class CustomInteractor {
  Future<void> GitClone() async {
    var shell = Shell(throwOnError: false);
    await shell
        .run('git clone https://github.com/Sakthivel-Ramasamy/Test-Repo.git');
  }

  Future<bool> CheckDir() async {
    Directory appDocDir = Directory.current;
    String appDocPath = appDocDir.path;
    var path = "$appDocPath/Test-Repo";
    bool checkPathExistence = Directory(path).existsSync();
    return checkPathExistence;
  }

  Future<bool> CheckErr() async {
    Directory appDocDir = Directory.current;
    String appDocPath = appDocDir.path;
    var path = "$appDocPath/Test-Repo/GUI/error.hop";
    bool checkPathExistence = File(path).existsSync();
    log(checkPathExistence.toString());
    return checkPathExistence;
  }

  Future<bool> CheckOutput() async {
    Directory appDocDir = Directory.current;
    String appDocPath = appDocDir.path;
    var path = "$appDocPath/Test-Repo/GUI/output.hop";
    bool checkPathExistence = File(path).existsSync();
    log(checkPathExistence.toString());
    return checkPathExistence;
  }

  void DeleteErr() {
    Directory appDocDir = Directory.current;
    String appDocPath = appDocDir.path;
    var path = "$appDocPath/Test-Repo/GUI/error.hop";
    File(path).delete();
  }

  void DeleteInp() {
    Directory appDocDir = Directory.current;
    String appDocPath = appDocDir.path;
    var path = "$appDocPath/Test-Repo/GUI/input.hop";
    File(path).delete();
  }

  void DeleteOut() {
    Directory appDocDir = Directory.current;
    String appDocPath = appDocDir.path;
    var path = "$appDocPath/Test-Repo/GUI/output.hop";
    File(path).delete();
  }

  void write(String text) async {
    Directory appDocDir = Directory.current;
    String appDocPath = appDocDir.path;
    final File file = File('$appDocPath/Test-Repo/GUI/input.json');
    await file.writeAsString(text);
  }

  Future<String> Read() async {
    String text = "";
    try {
      Directory appDocDir = Directory.current;
      String appDocPath = appDocDir.path;
      final File file = File('$appDocPath/Test-Repo/GUI/output.hop');
      text = file.readAsStringSync();
    } catch (e) {
      print("Something went wrong");
    }
    return text;
  }

  Future<void> verifyCIDR() async {
    Directory appDocDir = Directory.current;
    String appDocPath = appDocDir.path;
    var shell = Shell(throwOnError: false);
    Platform.isWindows
        ? await shell.run(
            'python $appDocPath/Test-Repo/GUI/Validation/CIDR_IP_Validation.py')
        : await shell.run(
            'python3 $appDocPath/Test-Repo/GUI/Validation/CIDR_IP_Validation.py');
  }

  Future<void> verifyIP() async {
    Directory appDocDir = Directory.current;
    String appDocPath = appDocDir.path;
    var shell = Shell(throwOnError: false);
    Platform.isWindows
        ? await shell
            .run('python $appDocPath/Test-Repo/GUI/Validation/IP_Validation.py')
        : await shell.run(
            'python3 $appDocPath/Test-Repo/GUI/Validation/IP_Validation.py');
  }

  Future<void> Host() async {
    Directory appDocDir = Directory.current;
    String appDocPath = appDocDir.path;
    var shell = Shell(throwOnError: false);
    Platform.isWindows
        ? await shell.run(
            'python $appDocPath/Test-Repo/GUI/Host_Discovery/Host_Discovery.py',
          )
        : await shell.run(
            'python3 $appDocPath/Test-Repo/GUI/Host_Discovery/Host_Discovery.py',
          );
  }

  Future<void> Promiscous() async {
    Directory appDocDir = Directory.current;
    String appDocPath = appDocDir.path;
    var shell = Shell(throwOnError: false);

    Platform.isWindows
        ? await shell.run(
            'python $appDocPath/Test-Repo/GUI/Promiscuous_Mode_Detection/Promiscuous_Mode_Detection.py',
          )
        : await shell.run(
            'python3 $appDocPath/Test-Repo/GUI/Promiscuous_Mode_Detection/Promiscuous_Mode_Detection.py',
          );
  }

  Future<void> arp() async {
    var shell = Shell(throwOnError: false);
    await shell
        .run('git clone https://github.com/Sakthivel-Ramasamy/Test-Repo.git');
  }

  Future<void> dhcp() async {
    var shell = Shell(throwOnError: false);
    await shell
        .run('git clone https://github.com/Sakthivel-Ramasamy/Test-Repo.git');
    await shell.run('pwd');
  }

  Future<void> dns() async {
    var shell = Shell(throwOnError: false);
    await shell
        .run('git clone https://github.com/Sakthivel-Ramasamy/Test-Repo.git');
    await shell.run('pwd');
  }

  Future<void> ip() async {
    var shell = Shell(throwOnError: false);
    await shell
        .run('git clone https://github.com/Sakthivel-Ramasamy/Test-Repo.git');
    await shell.run('pwd');
  }

  Future<void> port() async {
    var shell = Shell(throwOnError: false);
    await shell
        .run('git clone https://github.com/Sakthivel-Ramasamy/Test-Repo.git');
    await shell.run('pwd');
  }

  Future<void> os() async {
    var shell = Shell(throwOnError: false);
    await shell
        .run('git clone https://github.com/Sakthivel-Ramasamy/Test-Repo.git');
    await shell.run('pwd');
  }

  Future<void> requirements() async {
    Directory appDocDir = Directory.current;
    String appDocPath = appDocDir.path;
    var shell = Shell(throwOnError: false);
    await shell.run(
        'pip install -r  $appDocPath/Test-Repo/GUI/Requirements/Requirement.txt');
  }
}
