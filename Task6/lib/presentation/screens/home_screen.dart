import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:task6/presentation/widgets/app_bar.dart';
import 'package:task6/providers/state_provider.dart';
import '../size_configuration.dart';
import 'google_map_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = '/';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Color color = Theme.of(context).primaryColor;

    var wonders = context.read<StateProvider>().getWonders();

    return Scaffold(
      appBar: Header(
        paddingTop: SizeConfig.height * 0.03,
        color: color,
        title: 'World Wonders',
      ).build(context),
      body: SingleChildScrollView(

        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(5),
            shrinkWrap: true,
            itemBuilder: (_, index) => Card(
                  child: ListTile(
                    leading: const Icon(Icons.map_outlined),
                    title: Text(wonders[index].name),
                    subtitle: Text(wonders[index].description),
                    onTap: () => {
                      context.read<StateProvider>().changeState(
                          wonders[index].name,
                          wonders[index].description,
                          wonders[index].latLong),
                      Navigator.pushNamed(context, Maps.routeName),
                    },
                  ),
                ),
            itemCount: wonders.length),
      ),
    );
  }
}
