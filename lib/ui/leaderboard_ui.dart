import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dengue_app/bloc/user_bloc.dart';
import 'package:dengue_app/custom_widgets/loading_screen.dart';
import 'package:dengue_app/custom_widgets/network_image.dart';
import 'package:dengue_app/logic/user.dart';
import 'package:dengue_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LeaderBoardPage extends StatefulWidget {
  @override
  LeaderBoardPageState createState() {
    return new LeaderBoardPageState();
  }
}

class LeaderBoardPageState extends State<LeaderBoardPage> {
  UserBLoC userBLoC;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userBLoC = UserBLoCProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: userBLoC.leaderBoardStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator());
              return ListView.builder(
                itemBuilder: (_, i) => ListTile(
                      title:
                          Text(snapshot.data.documents[i].data["displayName"]),
                      subtitle: Text(
                          "Points ${snapshot.data.documents[i].data['points']} | Rank ${i + 1}"),
                      leading: DefParameterNetworkImage(
                        imageUrl: snapshot.data.documents[i].data['photoUrl'],
                        isCover: false,
                        width: 40.0,
                        height: 40.0,
                        needProgress: false,
                      ),
                      trailing: _buildTrailingBadge(i),
                    ),
                itemCount: snapshot.data.documents.length,
              );
            },
          ),
        ),
        StreamBuilder<User>(
          stream: userBLoC.userStream,
          builder: (_, snapshot) => Container(
                color: Colors.amber,
                child: ListTile(
                  title: Text("${snapshot.data?.displayName}"),
                  subtitle: Text("Points ${snapshot.data?.points}"),
                  leading: CircleAvatar(
                    child: StreamBuilder<User>(
                      stream: userBLoC.userStream,
                      builder: (context, snapshotUser) =>
                          StreamBuilder<QuerySnapshot>(
                              stream: userBLoC.leaderBoardStream,
                              builder: (context, snapshot) {
                                if (!snapshot.hasData)
                                  return AnimatedLoadingScreen(AnimationFile.GlowLoading);
                                for (int i = 0;
                                    i < snapshot.data.documents.length;
                                    i++) {
                                  if (snapshot.data.documents[i].documentID ==
                                      snapshotUser.data?.id) {
                                    return Text("${i + 1}");
                                  }
                                }
                                return Text("N");
                              }),
                    ),
                  ),
                ),
              ),
        )
      ],
    );
  }

  Widget _buildTrailingBadge(int index) {
    if (index >= 10) {
      return null;
    } else if (index >= 3) {
      return Icon(FontAwesomeIcons.gift);
    } else {
      return Icon(FontAwesomeIcons.medal);
    }
  }
}
