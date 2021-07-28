import 'package:api_app/modules/Search_Module/Search_Screen.dart';
import 'package:api_app/modules/Web_View/Web_View_Screen.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';

Widget BuildArticleItem(article,context)=> InkWell(
  onTap: (){
    Navigate(context,WebViewScreen(article['url']));
  },
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        Container(

          width: 120.0,

          height: 120.0,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10.0,),

            image: DecorationImage(

              image: NetworkImage('${article['urlToImage']}'),

              fit: BoxFit.cover,



              ),

            ),

          ),

        SizedBox(width: 20.0,),

        Expanded(

          child: Container(

            height: 120.0,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.start,

              children: [

                Expanded(

                  child: Text('${article['title']}',style:  Theme.of(context).textTheme.bodyText1,

                                maxLines: 4,

                                overflow: TextOverflow.ellipsis,

                              ),



                  ),

                Text('${article['publishedAt']}',style: TextStyle(

                  color: Colors.grey,

                  fontSize: 18.0,

                  fontWeight: FontWeight.w600,

                  ),

                     ),

              ],

              ),

            ),

          )

      ],

      ),

    ),
);
Widget articleBuilder(list,context,{isSearch=false})=> ConditionalBuilder(
  condition: list.length > 0 ,
  builder: (context)=>ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context,index)=>BuildArticleItem(list[index],context),
      separatorBuilder: (context,index)=> Padding(
        padding: const EdgeInsetsDirectional.only
          (start: 20.0
           ),
        child: Container(
          width: double.infinity,
          height: 1.0,
          color: Colors.grey[300],


          ),
        ),
      itemCount: 15
      ) ,
  fallback: (context)=>isSearch ? Container():Center(child: CircularProgressIndicator()),


  );

Widget defaultFormField({
  @required TextEditingController Controller,
  @required TextInputType type,
  @required Function validate,
  @required String label,
  @required IconData prefix,
  Function onSubmit,
  Function onChange,
  Function onTap,
  bool isclckable=true,

}) => TextFormField(
  controller: Controller,
  keyboardType: type,
  onFieldSubmitted: onSubmit,
  onChanged: onChange,
  validator: validate,
  onTap: onTap,
  enabled: isclckable,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(prefix,),
    border: OutlineInputBorder(),
    ),

  );

void Navigate(context,Widget)=> Navigator.push(context, MaterialPageRoute(builder: (context)=> Widget));


