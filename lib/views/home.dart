import 'dart:ui' as ui;
import 'package:diary/controllers/notes_controller.dart';
import 'package:diary/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:diary/services/constants.dart';
import 'package:diary/controllers/profile_controller.dart';
import 'package:diary/services/home_decor.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});

  ProfileController profileController = Get.put(ProfileController());

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Center(
          heightFactor: 1.5,
          child: FloatingActionButton(
            onPressed: () => Get.toNamed(Routes.takeNote),
            backgroundColor: primaryColor,
            elevation: 0.1,
            child: const Icon(
              Icons.add,
              size: 30,
              color: tertiaryColor,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        drawer: const NavigationDrawer(),
        backgroundColor: tertiaryColor,
        body: Stack(
          children: [
            CustomPaint(
              size: Size(size.width, (340 * 1.7777777777777777).toDouble()),
              painter: MyShape(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Builder(builder: (context) {
                    return IconButton(
                      onPressed: () => Scaffold.of(context).openDrawer(),
                      icon: const Icon(
                        Icons.menu,
                        color: primaryColor,
                        size: 25,
                      ),
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 20,
                    right: 20,
                  ),
                  child: Obx(
                    () => profileController.isLoading.value
                        ? const CircularProgressIndicator()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Hello, ${profileController.userProfile?.username}👋",
                                style: const TextStyle(
                                  color: primaryColor,
                                  fontSize: 20.0,
                                  letterSpacing: 1.0,
                                  fontFamily: 'SFPReg',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              CircleAvatar(
                                maxRadius: 20,
                                minRadius: 20,
                                child: ClipOval(
                                  child: Image.memory(
                                    height: 40,
                                    width: 40,
                                    fit: BoxFit.fitWidth,
                                    profileController.userProfile!.image,
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        day,
                        style: const TextStyle(
                          color: primaryColor,
                          fontSize: 20.0,
                          fontFamily: 'SFPReg',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        " $month,",
                        style: const TextStyle(
                          color: primaryColor,
                          fontSize: 15.0,
                          fontFamily: 'SFPReg',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        " $year",
                        style: const TextStyle(
                          color: primaryColor,
                          fontSize: 15.0,
                          fontFamily: 'SFPReg',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    top: 30,
                    right: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "How do you feel?",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 15.0,
                          fontFamily: 'SFPReg',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "How about Expressing it? 🔻",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 15.0,
                          fontFamily: 'SFPReg',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Expanded(
                  flex: 1,
                  child: LayoutBuilder(
                    builder: ((context, constraints) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  HomeDecor(
                                    height: .3,
                                    constraints: constraints,
                                    title: 'Plan for the day',
                                    svg: 'assets/tasks.svg',
                                  ),
                                  const SizedBox(height: 25),
                                  HomeDecor(
                                    height: .3,
                                    constraints: constraints,
                                    title: 'Take Notes',
                                    svg: 'assets/add_notes.svg',
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  HomeDecor(
                                    height: .65,
                                    constraints: constraints,
                                    title: 'Plan for the day',
                                    svg: 'assets/reminder.svg',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    NotesController notesController = Get.put(NotesController());
    return Drawer(
      backgroundColor: secondaryColor,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context, profileController),
            buildMenuItems(context, notesController),
          ],
        ),
      ),
    );
  }
}

Widget buildHeader(BuildContext context, dynamic profileController) => Material(
      color: blueColor,
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.editProfile);
        },
        child: Container(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .05,
              bottom: MediaQuery.of(context).size.height * .05),
          child: Column(
            children: [
              CircleAvatar(
                maxRadius: 50,
                minRadius: 50,
                child: ClipOval(
                  child: Image.memory(
                    profileController.userProfile!.image,
                    height: 160,
                    width: 160,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "${profileController.userProfile.name}",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1,
                ),
              ),
              Text(
                "${profileController.userProfile.email}",
                style: const TextStyle(
                  fontSize: 16,
                  letterSpacing: 1,
                ),
              ),
              (profileController.userProfile.phone != null)
                  ? Text(
                      "${profileController.userProfile.phone}",
                      style: const TextStyle(
                        fontSize: 16,
                        letterSpacing: 1,
                      ),
                    )
                  : const Text(""),
            ],
          ),
        ),
      ),
    );

Widget buildMenuItems(BuildContext context, dynamic notesController) =>
    Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 10,
        children: [
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Get.toNamed(Routes.home);
            },
          ),
          ListTile(
            leading: const Icon(Icons.book_rounded),
            title: const Text('Take Note'),
            onTap: () {
              Navigator.pop(context);
              Get.toNamed(Routes.takeNote);
            },
          ),
          ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Notes'),
              onTap: () {
                Navigator.pop(context);
                notesController.processFetchNotes();
              }),
          // ListTile(
          //   leading: const Icon(Icons.task),
          //   title: const Text('Tasks'),
          //   onTap: () {},
          // ),
          const Divider(
            color: Colors.black54,
            thickness: 1,
          ),
          ListTile(
            leading: const Icon(Icons.login_rounded),
            title: const Text('Logout'),
            onTap: () {},
          ),
        ],
      ),
    );

class MyShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;
    paint0.shader = ui.Gradient.linear(
        Offset(size.width * 0.50, size.height * 0.07),
        Offset(size.width * 0.50, size.height * 0.87),
        [secondaryColor, secondaryColor, tertiaryColor, tertiaryColor],
        [0.00, 0.52, 0.88, 1.00]);

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.1731875);
    path0.cubicTo(
        size.width * 0.0723889,
        size.height * 0.1529531,
        size.width * 0.1113611,
        size.height * 0.1929687,
        size.width * 0.1795000,
        size.height * 0.1996250);
    path0.cubicTo(
        size.width * 0.2925278,
        size.height * 0.2008437,
        size.width * 0.3416944,
        size.height * 0.1339219,
        size.width * 0.4049167,
        size.height * 0.1368125);
    path0.cubicTo(
        size.width * 0.4800556,
        size.height * 0.1311875,
        size.width * 0.5018889,
        size.height * 0.1959375,
        size.width * 0.5985833,
        size.height * 0.1998906);
    path0.cubicTo(
        size.width * 0.7906667,
        size.height * 0.2043594,
        size.width * 0.9134444,
        size.height * 0.0717656,
        size.width,
        size.height * 0.0849063);
    path0.quadraticBezierTo(size.width, size.height * 0.2679687, size.width,
        size.height * 0.8656250);
    path0.lineTo(0, size.height * 0.8625000);
    path0.quadraticBezierTo(
        0, size.height * 0.6573594, 0, size.height * 0.1731875);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
