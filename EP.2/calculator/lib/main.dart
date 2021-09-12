import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("แอพคำนวณ"),backgroundColor: Colors.black,),
        body: Home(),
      ),
      
    );
  }
}


class Home extends StatefulWidget {
  // const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var ctl_width = TextEditingController(); // ช่องเก็บข้อมูล
  var ctl_height = TextEditingController();
  var ctl_long = TextEditingController();

  var result = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    result.text = 'ผลลัพธ์การคำนวณแสดงผลจุดนี้';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        children: [
            // ข้อความแสดงผลให้กรอกข้อมูล
            Center(child: Text("กรุณากรอกข้อมูล",style: TextStyle(fontSize: 30),)),
            SizedBox(height: 20,),
            // ช่องกรอกข้อมูล ความกว้าง
            Center(child: TextField(
              controller: ctl_width,
              decoration: InputDecoration(
                labelText: 'ความกว้าง (ซ.ม.)',
                border: OutlineInputBorder()
              ),
            ),),
            SizedBox(height: 20,),
            // ช่องกรอกข้อมูล ความสูง
            Center(child: TextField(
              controller: ctl_height,
              decoration: InputDecoration(
                labelText: 'ความสูง (ซ.ม.)',
                border: OutlineInputBorder()
              ),
            ),),
            SizedBox(height: 20,),
            // ช่องกรอกข้อมูล ความยาว
            Center(child: TextField(
              controller: ctl_long,
              decoration: InputDecoration(
                labelText: 'ความยาว (ซ.ม.)',
                border: OutlineInputBorder()
              ),
            ),),

            SizedBox(height: 20,),

            // ปุ่มคำนวณ
            ElevatedButton(onPressed: () {

                  print(ctl_width.text);
                  print(ctl_height.text);
                  print(ctl_long.text);
                  setState(() {
                      var v1 = int.parse(ctl_width.text) ;
                      var v2 = int.parse(ctl_height.text) ;
                      var v3 = int.parse(ctl_long.text) ;
                      var calc = v1 * v2 * v3;
                      print("Result: $calc");
                      result.text = "กล่องขนาด $v1 x $v2 x $v3\nมีปริมาตร: $calc ลบ.ซ.ม.";

                    
                  });

            }, child: Text('คำนวณ',style: TextStyle(fontSize: 30),)),
            SizedBox(height: 20,),

            Center(child: Text(result.text, style: TextStyle(fontSize: 20, color: Colors.green),),)


            
        ],
        
      ),
    );
  }
}