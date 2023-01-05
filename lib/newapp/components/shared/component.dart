import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/newapp/models/webScreen.dart';

Widget buildItm(artical, context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => webViewScreen(artical['url'])));
    },
    child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                width: double.infinity,
                height: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(
                      "${artical['urlToImage']}",
                    ),
                    fit: BoxFit.cover,
                  ),
                )),
            SizedBox(
              height: 2,
            ),
            Text(
              ' ${artical['title']}',
              maxLines: 2,
              textDirection: TextDirection.rtl,
              overflow: TextOverflow.ellipsis,
              //style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              '${artical['publishedAt']}',
              // textScaleFactor: 2,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            // Expanded(
            //   child: Container(
            //     height: 40,
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       //mainAxisSize: MainAxisSize.min,
            //       children: [
            // Text(
            //   ' ${artical['title']}',
            //   maxLines: 3,
            //   overflow: TextOverflow.ellipsis,
            //   style: Theme.of(context).textTheme.bodyText1,
            // ),
            // Text(
            //   '${artical['publishedAt']}',
            //   // textScaleFactor: 2,
            //   style: TextStyle(
            //     color: Colors.grey,
            //     fontSize: 16,
            //   ),
            // ),
            //   ],
            // ),
            // ),
            // )
          ],
        )),
  );
}

Widget ArticalBuilder(items, context) {
  return ConditionalBuilder(
    condition: items.length > 0,
    fallback: (context) => Center(child: CircularProgressIndicator()),
    builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildItm(items[index], context),
        separatorBuilder: (context, index) => Container(
              height: 1,
              color: Colors.grey[300],
            ),
        itemCount: items.length),
  );
}

Widget defaultTextField({
  @required Function validate,
  @required TextInputType textType,
  @required String label,
  @required IconData prefixIcon,
  @required TextEditingController controller,
  Function onChange,
}) {
  return TextFormField(
      keyboardType: textType,
      validator: validate,
      onChanged: onChange,
      decoration: InputDecoration(
        labelText: label,
//suffixIcon: Icon(Icons.remove_red_eye),
        prefixIcon: Icon(prefixIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ));
}
