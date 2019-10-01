import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _acontroller = TextEditingController();
  final TextEditingController _hcontroller = TextEditingController();
  final TextEditingController _wcontroller = TextEditingController();
  var _currencies = ['Female', 'Male'];
  var _currentItemSelected = 'Male';
  var _currencies2 = ['Mifflin','Harris'];
  var _currentItemSelected2 = 'Harris';
  var _current =["I am sedentary (little or no exercise)","I am lightly active (light exercise or sports 1-3 days per week)", "I am moderately active (moderate exercise or sports 3-5 days per week)", "I am very active (hard exercise or sports 6-7 days per week)", "I am super active (very hard exercise or sports and a physical job)"];
  var _currentItemSelectedt = "I am sedentary (little or no exercise)";
  
 
  //String gender = "";
  //String equation ="";
  double a =0.0;
  double h =0.0;
  double w =0.0;
  double result =0.0;
  double calories = 0.0;
  //String level ="";


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'Material App',
      
      home: Scaffold
      (
        appBar: AppBar(
          title: Text('BMR Calculator (Metric)'),
        
        ),

        body: Center(
          
          child: Column(
            children: <Widget>[
              Text('Gender:'),
             DropdownButton<String> (
               items: _currencies.map((String dropDownStringItem){
                 return DropdownMenuItem<String>(
                   value: dropDownStringItem,
                   child: Text(dropDownStringItem),
                 );
               }).toList(),

               onChanged: (String newValueSelected) {
                 _downDownItemSelected(newValueSelected);
                                
                                },
                 
                                 value: _currentItemSelected,
                 
                              ), 
               Text('BMR Equation:'),
               DropdownButton<String> (
               items: _currencies2.map((String dropDownStringItem){
                 return DropdownMenuItem<String>(
                   value: dropDownStringItem,
                   child: Text(dropDownStringItem),
                 );
               }).toList(),

               onChanged: (String newValueSelected) {
                 _downnDownItemSelected(newValueSelected); 
                                                 },
                                  
                                                  value: _currentItemSelected2,
                                  
                                               ), 
           
                 
                                                Text('Age:'),
                                                TextField(
                                                  keyboardType: TextInputType.number,
                                                  
                                                  decoration: InputDecoration(
                                                    labelText:'Enter your age e.g 25',
                                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)) ),
                                                  controller: _acontroller,
                                                  ),
                                                Text('Height:'),
                                                TextField(
                                                 keyboardType: TextInputType.number,
                                                  decoration: InputDecoration(
                                                    labelText:'Enter your height e.g 167.5',
                                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)) ),   
                                                  controller: _hcontroller,),
                                                Text('Weight:'),
                                                TextField(
                                                 keyboardType: TextInputType.number,
                                                  decoration: InputDecoration(
                                                    labelText:'Enter your weight e.g 50',
                                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)) ),             
                                                  controller: _wcontroller,),

                                                  Text('Pleasee Select your activity level :'),
                                                   DropdownButton<String>(
                                                        items: _current.map((String dropDownStringItem){
                                                        return DropdownMenuItem<String>(
                                                          value: dropDownStringItem,
                                                          child: Text(dropDownStringItem),
                                                        );

                                                        }).toList(),

                                                        onChanged: (String newValueSelected){
                                                          _dropDownnnItemSelected(newValueSelected);
                                                                                                                   
                                                                                                                  },
                                                                                                                  
                                                                                                                   value: _currentItemSelectedt,
                                                          
                                                          
                                                          
                                                                                                             ),
                                                                           
                                                                           
                                                                           
                                                                           
                                                                                                                           RaisedButton(
                                                                                                                             child: Text("Calculate BMR"),
                                                                                                                             onPressed: _onPress,
                                                                                                                                           ),
                                                                                                                                           Text(" Your BMR Results: $result"),
                                                                                                                                           Text("Your Maintenance calories per day: $calories"),
                                                                                                                    
                                                                           
                                                                                                              
                                                                           
                                                                           
                                                                                                                                         ],
                                                                                                                                       ), 
                                                                                                                                     ),
                                                                                                                                   ),
                                                                                                                                 );
                                                                                                                               }
                                                                                                                              String format(double result) {
                                                                                                                                return result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 2);
                                                                                                                              }
                                                                                                                              
                                                                                                                               void _onPress() {
                                                                                                                                 setState((
                                                                                                                    
                                                                                                                                 ) {
                                                                                                                                   a= double.parse(_acontroller.text);
                                                                                                                                   h= double.parse(_hcontroller.text);
                                                                                                                                   w= double.parse(_wcontroller.text);
                                                                                                                                  if( _currentItemSelected.contains('Male') && _currentItemSelected2.contains('Harris') )
                                                                                                                                  {
                                                                                                                                      result = (10 * w) + (6.25 * h) - (5 * a) + 5;
                                                                                                                                      if(_currentItemSelectedt.contains("I am sedentary (little or no exercise)")) {
                                                                                                                                        calories= result *1.2 ; 
                                                                                                                                      }
                                                                                                                                      else if(_currentItemSelectedt.contains("I am lightly active (light exercise or sports 1-3 days per week)")){
                                                                                                                                        calories= result * 1.375;
                                                                                                                                      }
                                                                                                                                      else if(_currentItemSelectedt.contains("I am moderately active (moderate exercise or sports 3-5 days per week")){
                                                                                                                                        calories= result * 1.55;
                                                                                                                                      }
                                                                                                                                      else if(_currentItemSelectedt.contains("I am very active (hard exercise or sports 6-7 days per week)")){
                                                                                                                                        calories= result * 1.725;
                                                                                                                                      }
                                                                                                                                      else{
                                                                                                                                        calories= result * 1.9;
                                                                                                                                      }
                                                                                                                                      
                                                                                                                                  }
                                                                                                                                  else if(_currentItemSelected.contains('Female') && _currentItemSelected2.contains('Harris') )
                                                                                                                                  {
                                                                                                                                    result = (10 * w) + (6.25 * h)- (5 *a) -161;
                                                                                                                                   if(_currentItemSelectedt.contains("I am sedentary (little or no exercise)")) {
                                                                                                                                        calories= result *1.2 ; 
                                                                                                                                      }
                                                                                                                                      else if(_currentItemSelectedt.contains("I am lightly active (light exercise or sports 1-3 days per week)")){
                                                                                                                                        calories= result * 1.375;
                                                                                                                                      }
                                                                                                                                      else if(_currentItemSelectedt.contains("I am moderately active (moderate exercise or sports 3-5 days per week")){
                                                                                                                                        calories= result * 1.55;
                                                                                                                                      }
                                                                                                                                      else if(_currentItemSelectedt.contains("I am very active (hard exercise or sports 6-7 days per week)")){
                                                                                                                                        calories= result * 1.725;
                                                                                                                                      }
                                                                                                                                      else{
                                                                                                                                        calories= result * 1.9;
                                                                                                                                      }
                                                                                                                                  }
                                                                                                                                   else if(_currentItemSelected.contains('Male') && _currentItemSelected2.contains('Mifflin') )
                                                                                                                                  {
                                                                                                                                    result = (10 * w) + (6.25 * h)- (5 *a) +5;
                                                                                                                                   if(_currentItemSelectedt.contains("I am sedentary (little or no exercise)")) {
                                                                                                                                        calories= result *1.2 ; 
                                                                                                                                      }
                                                                                                                                      else if(_currentItemSelectedt.contains("I am lightly active (light exercise or sports 1-3 days per week)")){
                                                                                                                                        calories= result * 1.375;
                                                                                                                                      }
                                                                                                                                      else if(_currentItemSelectedt.contains("I am moderately active (moderate exercise or sports 3-5 days per week")){
                                                                                                                                        calories= result * 1.55;
                                                                                                                                      }
                                                                                                                                      else if(_currentItemSelectedt.contains("I am very active (hard exercise or sports 6-7 days per week)")){
                                                                                                                                        calories= result * 1.725;
                                                                                                                                      }
                                                                                                                                      else{
                                                                                                                                        calories= result * 1.9;
                                                                                                                                      }
                                                                                                                                  }
                                                                                                                                  else if(_currentItemSelected.contains("Female") && _currentItemSelected2.contains("Mifflin") )
                                                                                                                                  {
                                                                                                                                    result = (10 * w) + (6.25 * h)- (5 *a) -161;
                                                                                                                                   if(_currentItemSelectedt.contains("I am sedentary (little or no exercise)")) {
                                                                                                                                        calories= result *1.2 ; 
                                                                                                                                      }
                                                                                                                                      else if(_currentItemSelectedt.contains("I am lightly active (light exercise or sports 1-3 days per week)")){
                                                                                                                                        calories= result * 1.375;
                                                                                                                                      }
                                                                                                                                      else if(_currentItemSelectedt.contains("I am moderately active (moderate exercise or sports 3-5 days per week")){
                                                                                                                                        calories= result * 1.55;
                                                                                                                                      }
                                                                                                                                      else if(_currentItemSelectedt.contains("I am very active (hard exercise or sports 6-7 days per week)")){
                                                                                                                                        calories= result * 1.725;
                                                                                                                                      }
                                                                                                                                      else{
                                                                                                                                        calories= result * 1.9;
                                                                                                                                      }
                                                                                                                                  }


                                                                                                                                
                                                                                                                                            



                                                                                                                                 });
                                                                                                                                
                                                                                                                                 
                                                                                                               }
                                                                                                             
                                                                                                               void _downDownItemSelected(String newValueSelected) {
                                                                                                                  setState(() {
                                                                                                                        this._currentItemSelected = newValueSelected; 
                                                                                                                });
                                                                                                               }
                                                                                            
                                                                                              void _downnDownItemSelected(String newValueSelected) {
                                                                                                   setState(() {
                                                                                                           this._currentItemSelected2 = newValueSelected; 
                                                                                               });
                                                                                              }
                                                          
                                                            void _dropDownnnItemSelected(String newValueSelected) {
                                                                         setState(() {
                                                                                 this._currentItemSelectedt = newValueSelected;
                                                             });
                                                            }

                                                          
                 
                  
}