import 'package:ai_chat_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContributionsPage extends StatefulWidget {
  const ContributionsPage({Key? key}) : super(key: key);

  @override
  State<ContributionsPage> createState() => _ContributionsPageState();
}

class _ContributionsPageState extends State<ContributionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Contributions",
          style: GoogleFonts.montserrat(
            fontSize: 20,
          ),
        ),
        backgroundColor: Palette.backgroundColor,
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
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              /// Michael
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                margin: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Michael Rohan Swaminathan",
                            softWrap: true,
                            style: GoogleFonts.montserrat(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "KLE Technological University",
                            style: GoogleFonts.montserrat(fontSize: 15),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Backend Programmer",
                            style: GoogleFonts.montserrat(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Created the business logic and APIs",
                            style: GoogleFonts.montserrat(fontSize: 15),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const CircleAvatar(
                      radius: 80,
                      backgroundImage:
                          AssetImage('assets/app-icon/app-icon.png'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              /// Sameer
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                margin: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sameer Ankalagi",
                            softWrap: true,
                            style: GoogleFonts.montserrat(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "KLE Technological University",
                            style: GoogleFonts.montserrat(fontSize: 15),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Android Developer",
                            style: GoogleFonts.montserrat(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Created the Android App UI",
                            style: GoogleFonts.montserrat(fontSize: 15),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const CircleAvatar(
                      radius: 80,
                      backgroundImage:
                          AssetImage('assets/app-icon/app-icon.png'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              /// Sandeep
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                margin: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sandeep Urankar",
                            softWrap: true,
                            style: GoogleFonts.montserrat(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "KLE Technological University",
                            style: GoogleFonts.montserrat(fontSize: 15),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Backend Programmer and Documentation",
                            style: GoogleFonts.montserrat(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Solos",
                            style: GoogleFonts.montserrat(fontSize: 15),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const CircleAvatar(
                      radius: 80,
                      backgroundImage:
                          AssetImage('assets/app-icon/app-icon.png'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              /// Utkarsh
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                margin: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Utkarsh Khot",
                            softWrap: true,
                            style: GoogleFonts.montserrat(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "KLE Technological University",
                            style: GoogleFonts.montserrat(fontSize: 15),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Backend Programmer",
                            style: GoogleFonts.montserrat(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Decoded the research papers",
                            style: GoogleFonts.montserrat(fontSize: 15),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const CircleAvatar(
                      radius: 80,
                      backgroundImage:
                          AssetImage('assets/app-icon/app-icon.png'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
