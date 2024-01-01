import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:label_marker/label_marker.dart';

/// Google Map Widget to show Map.
class MapParcelDetails extends StatefulWidget {
  const MapParcelDetails({super.key});

  @override
  State<MapParcelDetails> createState() => _MapParcelDetailsState();
}

/// Stateful Widget Class for Map Location on Parcel Details Screen
class _MapParcelDetailsState extends State<MapParcelDetails> {
  ///Initializing all variables
  late GoogleMapController _controller;
  static const LatLng _center = LatLng(39.762240356504705, -87.22888127893277);
  static const CameraPosition _initialPosition = CameraPosition(target: _center, zoom: 17);
  Set<Marker> _markers = Set();

  @override
  void initState() {
    super.initState();

    // initialize loadData method
    addInitialMarker();
  }

  addInitialMarker() async {
    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(32, 32)),
      "assets/images/map_pin.png",
    );

    var marker = Set<Marker>();

    marker.add(Marker(
      //add first marker
      markerId: MarkerId("123"),
      position: _center, //position of marker
      icon: markerbitmap, //Icon for Marker
    ));

    setState(() {
      _markers = marker;
    });
  }

  // created method for displaying custom markers according to index
  showLatLong() async {
    LabelMarker marker = await LabelMarker(
      label: _center.latitude.toString() + ', ' + _center.longitude.toString(),
      textStyle: const TextStyle(color: colorWhite, fontSize: 40),
      markerId: MarkerId("123"),
      position: _center,
      backgroundColor: color3A71FF,
      draggable: false,
      onTap: () {},
    );

    _markers.clear();
    _markers.addLabelMarker(marker).then((value) {
      setState(() {});
    });
  }

  /// Method to capture Map Camera Movement
  void _onCameraMove(CameraPosition position) {}

  void moveToParcelLocation() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(_initialPosition));
  }

  ///Listener to handle on camera created events
  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  ///Dispose all containers before View disposed.
  @override
  void dispose() {
    super.dispose();
  }

  ///UI Creation for Map View
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: _initialPosition,
          mapType: MapType.normal,
          markers: _markers,
          onMapCreated: _onMapCreated,
          onCameraMove: _onCameraMove,
          buildingsEnabled: false,
          onTap: (position) {
            addInitialMarker();
          },
          myLocationEnabled: true,
          zoomControlsEnabled: true,
          zoomGesturesEnabled: true,
          gestureRecognizers: Set()
            ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
            ..add(Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()))
            ..add(Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
            ..add(Factory<VerticalDragGestureRecognizer>(() => VerticalDragGestureRecognizer())),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Align(
            alignment: Alignment.topRight,
            child: ElevatedButton(
                onPressed: () {
                  showLatLong();
                  moveToParcelLocation();
                },
                child: Text(
                  autoPopulate,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorWhite,
                      ),
                )),
          ),
        ),
      ],
    );
  }
}
