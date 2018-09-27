
import 'package:dengue_app/logic/post.dart';
import 'package:dengue_app/ui/postcard.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      PostCard(
        post: Post(
          user: "Jim Nasium",
          caption:
              "Limits marked led silent dining her she far. Sir but elegance marriage dwelling likewise position old pleasure men. Dissimilar themselves simplicity no of contrasted as. Delay great day hours men. Stuff front to do allow to asked he. ",
          mediaLink:
              "https://www.trulawn.co.uk/wp-content/uploads/spring-garden-resize-1280x720.jpg",
          likes: 3,
          shares: 4,
        ),
      ),
      PostCard(
        post: Post(
          user: "Will Power",
          caption:
              "Affronting everything discretion men now own did. Still round match we to. Frankness pronounce daughters remainder extensive has but. Happiness cordially one determine concluded fat. Plenty season beyond by hardly giving of.",
          mediaLink:
              "https://www.wikihow.com/images/5/59/Clean-rusty-garden-tools-Intro.jpg",
          likes: 16,
          shares: 3,
        ),
      ),
      PostCard(
        post: Post(
          user: "Cliff Hanger",
          caption:
              "Consulted or acuteness dejection an smallness if. Outward general passage another as it. Very his are come man walk one next. Delighted prevailed supported too not remainder perpetual who furnished. Nay affronting bed projection compliment instrument. ",
          mediaLink:
              "https://www.palmers.co.nz/wp-content/uploads/bfi_thumb/Autumn-garden-niqnooeadwzjf7upqytznjh6lc2lk87zbmuo3xmxtk.jpg",
          likes: 26,
          shares: 3,
        ),
      ),
      PostCard(
        post: Post(
          user: "Bud Jet",
          caption:
              "Do so written as raising parlors spirits mr elderly. Made late in of high left hold. Carried females of up highest calling.",
          mediaLink:
              "https://timbercreekfarmer.com/wp-content/uploads/2016/06/weeds1.png",
          likes: 6,
          shares: 8,
        ),
      ),
      SizedBox(
        height: 75.0,
        child: Center(
          child: Text("No more post to show."),
        ),
      )
    ]);
  }
}