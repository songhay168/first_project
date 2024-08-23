import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_project/basic_modules/rdmUser/rdmUserProfile_screen.dart';
import 'package:first_project/basic_modules/rdmUser/rdmUser_Model.dart';
import 'package:first_project/basic_modules/rdmUser/rdmUser_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RdmUserScreen extends StatefulWidget {
  const RdmUserScreen({super.key});

  @override
  State<RdmUserScreen> createState() => _RdmUserScreenState();
}

class _RdmUserScreenState extends State<RdmUserScreen> {
  @override
  void initState() {
    super.initState();
    if (mounted) {
      Future.delayed(Duration(seconds: 1), () {
        context.read<RdmUserLogic>().enableLoading();
        context.read<RdmUserLogic>().fetch();
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("All User", style: TextStyle(color: Colors.white)),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    bool loading = context.watch<RdmUserLogic>().loading;
    String? errorMessage = context.watch<RdmUserLogic>().errorMessage;

    debugPrint("loading: $loading");

    if (loading) {
      return Center(child: CircularProgressIndicator());
    } else if (errorMessage != null) {
      {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(errorMessage),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<RdmUserLogic>().fetch();
                },
                child: Text("Retry"),
              ),
            ],
          ),
        );
      }
    } else {
      List<Result> items = context.watch<RdmUserLogic>().fakeUser.results;
      return _buildData(items);
    }
  }
  // Widget _buildBody() {
  //   return Center(
  //     child: FutureBuilder<List<ProductModel>>(
  //       future: ProductService.fechData(),
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.done) {
  //           return _buildData(snapshot.data);
  //         } else {
  //           return CircularProgressIndicator();
  //         }
  //       },
  //     ),
  //   );
  // }

  Widget _buildData(List<Result>? items) {
    if (items == null) {
      return Center(
        child: Text("Something went wrong"),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<RdmUserLogic>().fetch();
      },
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(items[index]),
                ),
              );
            },
            child: _buildItemList(items[index]),
          );
        },
      ),
    );
  }
}

Widget _buildItemList(Result item) {
  return Card(
    color: Colors.white,
    child: ListTile(
      leading: SizedBox(
        width: 50,
        height: 50,
        child: CachedNetworkImage(
          imageUrl: item.picture.large,
          placeholder: (x, y) => Container(
            color: Colors.grey,
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        // Image.network(
        //   item.image,
        //   fit: BoxFit.cover,
        // ),
      ),
      title: Text(item.name.first + " " + item.name.last),
      subtitle: Text(" ${item.location.city}, ${item.location.country}"),
      //trailing: Text("${item.rating.rate}/5"),
    ),
  );
}
