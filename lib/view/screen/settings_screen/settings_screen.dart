
import 'dart:collection';

import 'package:doctor_app/view/widget/auth/custom_button.dart';
import 'package:doctor_app/view/widget/auth/is_logined.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {

  var myMarkers = HashSet<Marker>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(29.97560441931587, 31.23482477331727),
    zoom: 17.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children:
             [
               Container(
                 height: MediaQuery.of(context).size.height/ 3.5,
                 child: GoogleMap(
                   scrollGesturesEnabled: false,
                   markers: myMarkers,
                   initialCameraPosition: _kGooglePlex,
                   zoomControlsEnabled: false,
                   //mapType: MapType.terrain,
                   onMapCreated: (GoogleMapController googleMapController)
                   {
                     setState(() {
                       myMarkers.add(
                         const Marker(
                           markerId: MarkerId('1'),
                           position: LatLng(29.97560441931587, 31.23482477331727),
                           infoWindow: InfoWindow(
                             title: 'اباتشي للاستثمار والتنمية العمرانية',
                           ),
                         ),
                       );
                     });
                   },
                   //   mapType: MapType.hybrid,
                   // myLocationButtonEnabled: false,
                 ),
               ),
               Container(
                 width: double.infinity,
                 child: CustomButtonAuth(
                     text: 'Log out',
                   onPressed: (){
                       signOut(context);
                   },
                 ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}
