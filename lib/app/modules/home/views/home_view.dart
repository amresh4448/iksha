import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final homec = Get.put(HomeController());
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(45.521563, -122.677433);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: PreferredSize(
        preferredSize: Size(100, 90),
        child: AppBar(
          elevation: 0,
          title: const Text('BUs Route 113'),
          centerTitle: true,
          actions: const [
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: CircleAvatar(
                radius: 50,
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10, left: 15, right: 15),
              child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12,
                  ),
                  child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _center,
                      zoom: 11.0,
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12, left: 15, right: 0),
              child: Row(
                children: [
                  Container(
                    height: 300,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 233, 222, 205),
                    ),
                    child: Stops(),
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Column(
                        children: [
                          FaIcon(FontAwesomeIcons.ticket),
                          Text("New Ticket")
                        ],
                      )),
                  // ElevatedButton(
                  //     onPressed: () {},
                  //     child: const Column(
                  //       children: [Icon(Icons.adf_scanner), Text("Scan Pass")],
                  //     ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Stops extends StatelessWidget {
  Stops({super.key});
  final homec = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Stepper(
      controlsBuilder: (context, controller) {
        return const SizedBox.shrink();
      },
      elevation: 0,
      physics: BouncingScrollPhysics(),
      currentStep: homec.index.value,
      onStepTapped: (int index) {
        homec.chnageIndex(index);
      },
      steps: <Step>[
        Step(
          title: const Text('stop 1'),
          content: Container(
            alignment: Alignment.centerLeft,
            child: const Text('stop 1'),
          ),
        ),
        const Step(
          title: Text('Stop 2'),
          content: Text('sub details 2'),
        ),
      ],
    );
  }
}

class NavDrawer extends StatelessWidget {
  final homec = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.50,
        child: Drawer(
          elevation: 0,
          child: Container(
            color: Colors.blue,
            child: ListView(
              children: <Widget>[
                const Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      'Settings',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                  thickness: 1,
                ),
                ListTile(
                  leading: Text(
                    "Sound",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  title: Obx(
                    () => CupertinoSwitch(
                      // This bool value toggles the switch.
                      value: homec.switchValue.value,
                      activeColor: CupertinoColors.activeGreen,
                      onChanged: (bool? value) {
                        homec.changeSwitch(value);
                      },
                    ),
                  ),
                ),
                ListTile(
                  leading: Text(
                    "Vibration",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  title: Obx(
                    () => CupertinoSwitch(
                      // This bool value toggles the switch.
                      value: homec.switchValue.value,
                      activeColor: CupertinoColors.activeGreen,
                      onChanged: (bool? value) {
                        homec.changeSwitch(value);
                      },
                    ),
                  ),
                ),
                ListTile(
                  leading: Text(
                    "Vibration",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  title: Obx(
                    () => CupertinoSwitch(
                      // This bool value toggles the switch.
                      value: homec.switchValue.value,
                      activeColor: CupertinoColors.activeGreen,
                      onChanged: (bool? value) {
                        homec.changeSwitch(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
