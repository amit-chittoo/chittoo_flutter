
import 'package:chittoo/Profile_pages/Edit_Profile_pages/image_edit.dart';
import 'package:flutter/material.dart';

class Edit_Profile_Page extends StatefulWidget {
  const Edit_Profile_Page({super.key});

  @override
  State<Edit_Profile_Page> createState() => _Edit_Profile_PageState();
}

class _Edit_Profile_PageState extends State<Edit_Profile_Page> {
  final TextEditingController _name_controller = TextEditingController();
  final TextEditingController _email_controller = TextEditingController();
  final TextEditingController _mobile_controller = TextEditingController();
  final TextEditingController _date_of_birth_controller =
      TextEditingController();
  final TextEditingController _mother_tongue_controller =
      TextEditingController();
  final TextEditingController _town_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: const Color(0xFFF4F4F4),
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                            color: Color(0xFFFDECE1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: 20,
                          ),
                          color: const Color(0xFFF57952),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )),
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ],
              ),
              const Image_Edit(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Full Name",
                style: TextStyle(color: Colors.grey),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextFormField(
                  controller: _name_controller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Email",
                style: TextStyle(color: Colors.grey),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextFormField(
                  controller: _email_controller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Mobile Number",
                style: TextStyle(color: Colors.grey),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextFormField(
                  controller: _mobile_controller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Mother Tongue",
                style: TextStyle(color: Colors.grey),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextFormField(
                  controller: _mother_tongue_controller,
                  decoration: const InputDecoration(
                      hintText: "Ex. Hindi",
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Date of birth",
                style: TextStyle(color: Colors.grey),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextFormField(
                  controller: _date_of_birth_controller,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.date_range_outlined),
                        color: const Color(0xFFF57952),
                        onPressed: () async {
                          DateTime? _selected_date = (await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1890),
                              lastDate: DateTime.now()));
                          if (_selected_date != null) {
                            _date_of_birth_controller.text =
                                "${_selected_date.day}/"
                                "${_selected_date.month}/"
                                "${_selected_date.year}";
                          }
                        },
                      ),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Gender",
                style: TextStyle(color: Colors.grey),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Occupation",
                style: TextStyle(color: Colors.grey),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Town",
                style: TextStyle(color: Colors.grey),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextFormField(
                  controller: _town_controller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Country",
                style: TextStyle(color: Colors.grey),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: FilledButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF57952),
                      // Background color
                    ),
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(
                      //     builder: (BuildContext context) {
                      //       return Chittoo_Pro();
                      //     }));
                    },
                    child: const Text(
                      "Save profile",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    )),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
