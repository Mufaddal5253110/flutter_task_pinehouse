import 'dart:io';

import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_pinehouse/Models/User.dart';
import 'package:flutter_task_pinehouse/Services/DatabaseService.dart';
import 'package:flutter_task_pinehouse/Services/StorageService.dart';
import 'package:flutter_task_pinehouse/Utils/Global.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({Key? key}) : super(key: key);

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  bool _isLaoding = false;
  String _imagePath = "";
  File? picked_file;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  final List<String> _depList = ["HR", "Finance", "Marketing", "HouseKeeping"];
  String? _selectedDep = null;

  void pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
      allowCompression: true,
    );
    if (result != null) {
      setState(() {
        picked_file = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New User"),
      ),
      body: Form(
        key: _formKey,
        child: SizedBox(
          height: Global.height(context),
          width: Global.width(context),
          child: ListView(
            children: [
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  pickImage();
                },
                child: CircleAvatar(
                  backgroundColor: Colors.purple,
                  radius: 63,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    backgroundImage: picked_file != null
                        ? Image.file(
                            File(picked_file!.path),
                            fit: BoxFit.cover,
                          ).image
                        : null,
                    child: picked_file == null
                        ? const Icon(
                            Icons.camera_alt,
                            size: 35,
                            color: Colors.purple,
                          )
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: Global.width(context) * 0.05),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Name",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 55,
                margin: EdgeInsets.symmetric(
                    horizontal: Global.width(context) * 0.05),
                padding: const EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 2),
                      blurRadius: 3.0,
                    )
                  ],
                ),
                child: Center(
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: "ABC",
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: Global.width(context) * 0.05),
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Name";
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: Global.width(context) * 0.05),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Phone Number",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 55,
                margin: EdgeInsets.symmetric(
                    horizontal: Global.width(context) * 0.05),
                padding: const EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 2),
                      blurRadius: 3.0,
                    )
                  ],
                ),
                child: Center(
                  child: TextFormField(
                    controller: _phoneNumberController,
                    decoration: InputDecoration(
                      hintText: "Ex: +91XXXXXXXXXX",
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: Global.width(context) * 0.05),
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Phone Number";
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: Global.width(context) * 0.05),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Age",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 55,
                margin: EdgeInsets.symmetric(
                    horizontal: Global.width(context) * 0.05),
                padding: const EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 2),
                      blurRadius: 3.0,
                    )
                  ],
                ),
                child: Center(
                  child: TextFormField(
                    controller: _ageController,
                    decoration: InputDecoration(
                      hintText: "Ex: 24",
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: Global.width(context) * 0.05),
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Age";
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: Global.width(context) * 0.05),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Department",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: Global.width(context) * 0.05),
                height: 55,
                child: CustomDropdownButton2(
                  icon: const Icon(Icons.keyboard_arrow_down, size: 20),
                  buttonDecoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hint: "Select Department",
                  dropdownItems: _depList,
                  value: _selectedDep,
                  dropdownWidth: MediaQuery.of(context).size.width * 0.8,
                  onChanged: (value) {
                    setState(() {
                      _selectedDep = value!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              _isLaoding
                  ? const Center(child: CircularProgressIndicator())
                  : GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          if (picked_file != null) {
                            if (_selectedDep != null) {
                              setState(() {
                                _isLaoding = true;
                              });
                              await StorageService()
                                  .uploadImage(picked_file!)
                                  .then((value) async {
                                _imagePath = value!;
                                User user = User(
                                  id: '',
                                  name: _nameController.text.trim(),
                                  age: int.parse(_ageController.text.trim()),
                                  phoneNumber: int.parse(
                                      _phoneNumberController.text.trim()),
                                  department: _selectedDep!,
                                  profilePicture: _imagePath,
                                );
                                DatabaseService().addNewUser(user);
                              });

                              setState(() {
                                _isLaoding = false;
                                _nameController.clear();
                                _phoneNumberController.clear();
                                _ageController.clear();
                                picked_file = null;
                                _selectedDep = null;
                              });
                              Global.showSnackBar(
                                  const Text("User Added Successfully!"),
                                  context);
                            } else {
                              Global.showSnackBar(
                                  const Text("Please Select department"),
                                  context);
                            }
                          } else {
                            Global.showSnackBar(
                                const Text("Please Upload Profile Picture"),
                                context);
                          }
                        }
                      },
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(
                            horizontal: Global.width(context) * 0.05),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.purple,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 2),
                              blurRadius: 3.0,
                            )
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            "Save",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
