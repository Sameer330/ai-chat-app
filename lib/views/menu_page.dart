import 'package:ai_chat_app/utils/colors.dart';
import 'package:ai_chat_app/utils/common_vars.dart';
import 'package:ai_chat_app/views/contributions.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final DropdownController _fontSizeController = DropdownController();

  List<CoolDropdownItem<double>> fontSizes = [
    CoolDropdownItem(label: '14', value: 14),
    CoolDropdownItem(label: '15', value: 15),
    CoolDropdownItem(label: '16', value: 16),
    CoolDropdownItem(label: '17', value: 17),
    CoolDropdownItem(label: '18', value: 18),
    CoolDropdownItem(label: '19', value: 19),
    CoolDropdownItem(label: '20', value: 20),
    CoolDropdownItem(label: '21', value: 21),
    CoolDropdownItem(label: '22', value: 22),
    CoolDropdownItem(label: '23', value: 23),
    CoolDropdownItem(label: '24', value: 24),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      appBar: AppBar(
        backgroundColor: Palette.backgroundColor,
        centerTitle: true,
        title: Text(
          "Menu",
          style: GoogleFonts.montserrat(fontSize: 20),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_forward_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              /// Add your API KEY
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.24,
                    child: Text(
                      "Add API: ",
                      softWrap: true,
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 70,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        errorMaxLines: 5,
                        hintText: "OpenAI API KEY",
                        enabled: false,
                        contentPadding: const EdgeInsets.all(27),
                        disabledBorder: InputBorder.none,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Palette.borderColor,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Palette.borderColor,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Palette.gradient1,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        hintStyle: GoogleFonts.montserrat(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.info_outline,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              /// Adjust Font Size
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.24,
                    child: Text(
                      "Adjust Font Size: ",
                      softWrap: true,
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Palette.borderColor,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                      color: Palette.borderColor,
                    ),
                    child: CoolDropdown<double>(
                      resultOptions: ResultOptions(
                        openBoxDecoration: BoxDecoration(
                          // color: Palette.gradient2,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        textStyle: const TextStyle(color: Colors.white),
                        boxDecoration: BoxDecoration(
                          color: Palette.borderColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      isMarquee: true,
                      dropdownOptions: const DropdownOptions(
                        color: Palette.backgroundColor,
                        animationType: DropdownAnimationType.scale,
                        curve: Curves.linear,
                      ),
                      dropdownItemOptions: DropdownItemOptions(
                        selectedBoxDecoration: BoxDecoration(
                          color: Palette.borderColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        isMarquee: false,
                        alignment: Alignment.center,
                        boxDecoration: BoxDecoration(
                          color: Palette.gradient3,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        mainAxisAlignment: MainAxisAlignment.start,
                        textStyle: GoogleFonts.montserrat(
                          color: Palette.gradient1,
                        ),
                      ),
                      dropdownTriangleOptions: const DropdownTriangleOptions(
                        align: DropdownTriangleAlign.left,
                      ),
                      controller: _fontSizeController,
                      dropdownList: fontSizes,
                      onChange: (value) {},
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Fluttertoast.showToast(
                        msg: "Adjust Font Size",
                        backgroundColor: Palette.gradient2,
                      );
                    },
                    icon: const Icon(
                      Icons.info_outline,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Normal Mode:",
                    softWrap: true,
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CupertinoSwitch(
                    value: useGPTwithoutContext,
                    onChanged: (value) {
                      useGPTwithoutContext == false
                          ? setState(() {
                              useGPTwithContext = false;
                              useGPTwithContextandCloud = false;
                              useGPTwithoutContext = value;
                              Fluttertoast.showToast(
                                msg: "Normal Mode Activated!",
                                backgroundColor: Colors.green,
                              );
                            })
                          : setState(() {
                              useGPTwithoutContext = value;
                            });
                    },
                    activeColor: Palette.gradient1,
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Context Mode:",
                    softWrap: true,
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CupertinoSwitch(
                    value: useGPTwithContext,
                    onChanged: (value) {
                      setState(() {
                        useGPTwithContext == false
                            ? setState(() {
                                useGPTwithoutContext = false;
                                useGPTwithContextandCloud = false;
                                useGPTwithContext = value;
                                Fluttertoast.showToast(
                                  msg: "Context Mode Activated!",
                                  backgroundColor: Colors.green,
                                );
                              })
                            : setState(() {
                                useGPTwithContext = value;
                              });
                      });
                    },
                    activeColor: Palette.gradient1,
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Taxonomy Mode:",
                    softWrap: true,
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CupertinoSwitch(
                    value: useGPTwithContextandCloud,
                    onChanged: (value) {
                      useGPTwithContextandCloud == false
                          ? setState(() {
                              useGPTwithContext = false;
                              useGPTwithoutContext = false;
                              useGPTwithContextandCloud = value;

                              Fluttertoast.showToast(
                                msg: "Taxonomy Mode Activated!",
                                backgroundColor: Colors.green,
                              );
                            })
                          : setState(() {
                              useGPTwithContextandCloud = value;
                            });
                    },
                    activeColor: Palette.gradient1,
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),
              Container(
                // width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF8C52FF),
                      Color(0xFFFF914D),
                    ],
                    begin: Alignment.centerLeft,
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ContributionsPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize:
                        Size(MediaQuery.of(context).size.width * 0.93, 55),
                    backgroundColor: Colors.transparent,
                  ),
                  child: Text(
                    "See Contributions",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
