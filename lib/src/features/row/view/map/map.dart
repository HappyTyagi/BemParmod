import 'dart:typed_data';

import 'package:bem/src/components/card/map_parcel_pin.dart';
import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/app_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:label_marker/label_marker.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'dart:async';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:location/location.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

/// Google Map Widget to show Map.
class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

/// Stateful Widget Class for Map Location
class _MapScreenState extends State<MapScreen> {
  ///Initializing all variables
  Completer<GoogleMapController> _controller = Completer();
  CustomInfoWindowController _customInfoWindowController = CustomInfoWindowController();
  static const LatLng _center = LatLng(39.762240356504705, -87.22888127893277);
  static const CameraPosition _initialPosition = CameraPosition(target: _center, zoom: 17);
  Set<Marker> _markers = {};
  List<LatLng> latLong = [LatLng(39.763230041884924, -87.23237890365469), LatLng(39.76104450093413, -87.23104852809477), LatLng(39.76115996521041, -87.22677845170087)];
  LatLng _currentLatLong = _center;
  MapType _currentMapType = MapType.normal;
  var initialIndex = 1;
  List<LatLng> polylineCoordinates = [];

  void _onMapTypeButtonPressed(int index) {
    _customInfoWindowController.hideInfoWindow!();
    setState(() {
      _currentMapType = _currentMapType == MapType.normal ? MapType.satellite : MapType.normal;
      initialIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    // initialize loadData method
    loadData();
  }

  Future _getCurrentLocation() async {
    Location location = Location();
    bool serviceEnabled = await location.serviceEnabled();

    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    PermissionStatus permissionGranted = await location.hasPermission();

    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    var locationData = await location.getLocation();
    print(locationData);

    setState(() {
      _currentLatLong = LatLng(locationData.latitude!, locationData.longitude!);
    });
  }

  void onDirectionTap(LatLng destination) async {
    _customInfoWindowController.hideInfoWindow!();
    await _getCurrentLocation();

    /// Draw a polyLine from current location to parcel location
    getPolyPointsFromCurrentLocation(destination);
  }

  void getPolyPointsFromCurrentLocation(LatLng destination) async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        MapInformation.googleAPiKey, PointLatLng(_currentLatLong.latitude, _currentLatLong.longitude), PointLatLng(destination.latitude, destination.longitude));
    print(result.points);

    ///For Testing on Emulator
    // PolylineResult result =
    //     await polylinePoints.getRouteBetweenCoordinates(MapInformation.googleAPiKey, PointLatLng(39.763230041884924, -87.23237890365469), PointLatLng(39.76104450093413, -87.23104852809477));

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }

      setState(() {});
    }
  }

  // created method for displaying custom markers according to index
  loadData() async {
    for (int i = 0; i < latLong.length; i++) {
      LabelMarker marker = await LabelMarker(
        label: "#" + i.toString(),
        textStyle: const TextStyle(color: colorWhite, fontSize: 40),
        markerId: MarkerId(i.toString()),
        position: latLong[i],
        backgroundColor: color3A71FF,
        draggable: false,
        onTap: () {
          _customInfoWindowController.addInfoWindow!(
            MapParcelDetailsPin(
                name: 'abc',
                onClick: () {
                  ///ToDO : get LatLong from the Parcel details
                  onDirectionTap(LatLng(39.763230041884924, -87.23237890365469));
                }),
            latLong[i],
          );
        },
      );

      _markers.addLabelMarker(marker).then((value) {
        setState(() {});
      });
    }
  }

  /// Method to capture Map Camera Movement
  void _onCameraMove(CameraPosition position) {
    _customInfoWindowController.onCameraMove!();
  }

  ///Listener to handle on camera created events
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    _customInfoWindowController.googleMapController = controller;
  }

  ///Dispose all containers before View disposed.
  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  ///UI Creation for Map View
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: _initialPosition,
          mapType: _currentMapType,
          markers: _markers,
          onMapCreated: _onMapCreated,
          onCameraMove: _onCameraMove,
          buildingsEnabled: false,
          onTap: (position) {
            _customInfoWindowController.hideInfoWindow!();
          },
          myLocationEnabled: true,
          zoomControlsEnabled: true,
          zoomGesturesEnabled: true,
          polylines: {
            Polyline(polylineId: const PolylineId('route'), points: polylineCoordinates, color: color3A71FF, width: 6),
          },
          gestureRecognizers: Set()
            ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
            ..add(Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()))
            ..add(Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
            ..add(Factory<VerticalDragGestureRecognizer>(() => VerticalDragGestureRecognizer())),
        ),
        CustomInfoWindow(
          controller: _customInfoWindowController,
          height: 360,
          width: 400,
          offset: 55,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              Container(
                decoration: whiteContainer(radius: 8),
                padding: const EdgeInsets.all(8),
                child: ToggleSwitch(
                  minWidth: 150.0,
                  cornerRadius: 8.0,
                  activeBgColors: const [
                    [color3A71FF],
                    [color3A71FF]
                  ],
                  activeFgColor: Colors.white,
                  inactiveBgColor: colorWhite,
                  inactiveFgColor: colorBlack,
                  initialLabelIndex: initialIndex,
                  totalSwitches: 2,
                  labels: const ['Satellite view', 'Street view'],
                  radiusStyle: true,
                  onToggle: (index) {
                    _onMapTypeButtonPressed(index!);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
