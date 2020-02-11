import 'package:flutter/material.dart';

class Mail{
  final String sender;
  final String subject;
  final String content;
  Mail(this.sender,this.subject,this.content);
}


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'gmail',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(mails: null)
      //MyHomePage(title: 'Primary'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final List<Mail> mails;
  MyHomePage({Key key, @required this.mails}) : super(key: key);

  //final String title;
  
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1;
  List<Icon> _icons = [
    Icon(Icons.star,size:25,color:Colors.yellow),
    Icon(Icons.star_border,size: 25)
  ];

  void _isFav() {
    setState(() {
      _counter++;
      if(_counter%2==0)
      {
        _counter=0;
      }
      else
      {
        _counter=1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
       
        title: Text('Primary'),
        leading: IconButton(
          tooltip: 'Menu',
          icon: Icon(Icons.menu,color: Colors.white,),
          onPressed: null,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search,
            color: Colors.white,
          ),
          onPressed: null,
          )
        ],      
      ),

      body: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left:14,right:14,top:15,bottom:5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.account_circle,
                size: 55,
                color: Colors.red,),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10,top:5),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Sender"),
                          Text("Time"),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Mail Subject"),
                              Text("Main Content")
                            ],
                          ),
                          IconButton(
                            icon: _icons[_counter],
                            tooltip: 'favorite',
                            onPressed: _isFav,
                            )
                        ],
                      )//row
                    ],//widget
                  ),//column
                ),//padding
              )//expanded
            ],//widget[]
          ),//row
        ),//padding,
      Divider(color: Colors.grey,)
      ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: 
          (context)=>SecoundRoute()));
        },
        tooltip: 'write',
        child: Icon(Icons.create)),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


//------------------------------------------------------------//
class SecoundRoute extends StatelessWidget{


  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Write"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add,color: Colors.white,), 
            onPressed: (){
              Mail('james','Hello there','안녕하세요 감사해요 잘있어요 다시만나요!');
              Navigator.pop(context);
            },
            )
        ],
      ),
      body:SafeArea(
        top: false,
        bottom: false,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Enter your name',
                labelText: 'Sender',
              ),
            ),
            TextFormField(decoration: InputDecoration(
              icon: Icon(Icons.subject),
              hintText:'Enter subject of mail',
              labelText: 'Subject'
            ),),
            TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: 20,
            textInputAction: TextInputAction.newline,
            decoration: InputDecoration(
              icon: Icon(null),
              hintText: 'Enter Main content here',
              border: OutlineInputBorder()
              //labelText: 'Content',
            ),)
          ]
        )
      )
    );
  }
}