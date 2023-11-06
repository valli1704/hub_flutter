import 'package:flutter/material.dart';
import 'package:hub_flutter/colors.dart';
import 'package:hub_flutter/constant_file.dart';
import 'package:hub_flutter/screens/add_business_description.dart';
import 'package:hub_flutter/screens/location.dart';
import 'package:hub_flutter/utilities.dart';
import 'package:hub_flutter/widgets/CustomContainer.dart';
import 'package:hub_flutter/widgets/custom_padding.dart';
import 'package:hub_flutter/widgets/custom_sizedBox.dart';
import 'package:hub_flutter/widgets/custom_text.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class GoogleLocation extends StatefulWidget {
  const GoogleLocation({super.key});

  @override
  State<GoogleLocation> createState() => _GoogleLocationState();
}

var location = LatLng(13.10036341910801, 80.2675463495713);

class _GoogleLocationState extends State<GoogleLocation> {
  Position? currentPosition;
  GoogleMapController? newGooleMapController;
  double? latitude;
  double? longitude;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  getMarkers(double latitude, double longitude) {
    MarkerId markerId = MarkerId(latitude.toString() + longitude.toString());
    Marker _marker = Marker(
        markerId: markerId,
        position: LatLng(latitude, longitude),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(
          snippet: "valli",
        ),
        onTap: () {});
    setState(() {
      markers[markerId] = _marker;
      _marker;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    // locateLocation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              CustomContainer(
                  gradientColor: true,
                  height: 1.3,
                  width: double.infinity,
                  child: Column(
                    children: [
                      CustomSizedBox(height: 0.05, width: 0),
                      Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FGL.png?alt=media&token=9f42df4f-44dd-4395-81b6-5f1c38257596',
                        height: 100,
                      ),
                      CustomSizedBox(height: 0.02, width: 0),
                      CustomContainer(
                          height: 1,
                          width: double.infinity,
                          child: CustomPadding(
                            left: 0.03,
                            right: 0.03,
                            top: 0,
                            bottom: 0,
                            child: Column(
                              children: [
                                CustomText(
                                  text: 'Google Location',
                                  color: OverAllBgColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                                CustomSizedBox(height: 0.02, width: 0),
                                CustomText(
                                  text: '2 of 6 completed',
                                  color: OverAllBgColor,
                                ),
                                Container(
                                  width: double.infinity,
                                  color: OverAllBgColor,
                                  height: 0.03,
                                ),
                                CustomSizedBox(height: 0.1, width: 0),
                                CustomText(
                                  text: 'PIN YOUR BUSINESS LOCATION',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                CustomSizedBox(height: 0.05, width: 0),
                                CustomText(
                                  text: 'Add Map Location',
                                  fontSize: 20,
                                ),
                                CustomSizedBox(height: 0.02, width: 0),
                                CustomText(
                                  text: 'For Your Business',
                                  fontSize: 20,
                                ),
                                CustomSizedBox(height: 0.02, width: 0),
                                // Image.asset('assets/map.png',height: 200,),
                                CustomContainer(
                                  height: 0.3,
                                  width: 0.55,
                                  child: Expanded(
                                    child: GoogleMap(
                                        initialCameraPosition: CameraPosition(
                                          target: LatLng(13.10036341910801,
                                              80.2675463495713),
                                          zoom: 11,
                                        ),
                                        onMapCreated:
                                            (GoogleMapController controller) {
                                          newGooleMapController = controller;
                                        },
                                        myLocationEnabled: true,
                                        zoomControlsEnabled: true,
                                        zoomGesturesEnabled: true,
                                        markers: Set<Marker>.of(markers.values),
                                        onTap: (tapped) {
                                          markers.clear();
                                          latitude = tapped.latitude;
                                          longitude = tapped.longitude;
                                          getMarkers(tapped.latitude,
                                              tapped.longitude);
                                        }),
                                  ),
                                ),
                                CustomSizedBox(height: 0.03, width: 0),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/person.jpg',
                                      height: 50,
                                    ),
                                    CustomSizedBox(height: 0, width: 0.05),
                                    InkWell(
                                      child: Image.network(
                                          "https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2FLefi.png?alt=media&token=6ce0a918-d370-46ac-8569-13be12e85940"),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    CustomSizedBox(height: 0, width: 0.05),
                                    CustomText(
                                      text: 'SWIPE',
                                      color: OverAllBgColor,
                                    ),
                                    CustomSizedBox(height: 0, width: 0.05),
                                    InkWell(
                                      child: Image.network(
                                          "https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2FRight.png?alt=media&token=6f429db7-33c2-4063-865b-f0f8417a4acc"),
                                      onTap: () {
                                        if (latitude == null &&
                                            longitude == null||latitude == "" &&
                                            longitude == "") {
                                          Utilities.showToastError(
                                              "please plot the marker");
                                        } else {
                                          Appconstant.latitude=latitude;
                                          Appconstant.longitude=longitude;
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    AddBusiness(),
                                              ));
                                        }
                                      },
                                    )
                                  ],
                                )
                              ],
                            ),
                          )),
                    ],
                  ))
            ],
          ),
        ));
  }
}
