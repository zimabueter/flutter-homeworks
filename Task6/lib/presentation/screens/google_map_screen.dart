import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/src/provider.dart';
import 'package:task6/presentation/widgets/app_bar.dart';
import 'package:task6/providers/state_provider.dart';
import '../size_configuration.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);
  static String routeName = '/map';

  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    SizeConfig().init(context);

    return Scaffold(
      appBar: Header(
        paddingTop: SizeConfig.height * 0.03,
        color: color,
        title: 'World Wonders',
      ).build(context),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: context.watch<StateProvider>().latLong,
              zoom: 6,
            ),
            markers: <Marker>{
              Marker(
                markerId:
                    MarkerId(context.watch<StateProvider>().latLong.toString()),
                position: context.watch<StateProvider>().latLong,
                infoWindow: InfoWindow(
                    title: context.watch<StateProvider>().name,
                    snippet: context.watch<StateProvider>().description),
                icon: BitmapDescriptor.defaultMarker,
              ),
            },
          ),
        ],
      ),
    );
  }
}
