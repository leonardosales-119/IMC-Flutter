import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home() ,
  ));
}


class Home  extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> {
  //controladores
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  //chave
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

 
 String _infoText = "Informe seus dados";
 
 void _calcular(){
  setState(() {
    
  
    
 
   double weight = double.parse(weightController.text);
   double height = double.parse(heightController.text) / 100;

   
   double imc = weight / (height * height);
   
  
        if (imc < 18.6){

          _infoText = "Abaixo do peso (${imc.toStringAsPrecision(4)}) ";
        }
        
        else if(imc >= 18.6 && imc < 25 ){_infoText = "peso saudável (${imc.toStringAsPrecision(4)}) ";}
        else if(imc >=25 && imc < 29.9){_infoText = "Sobrepeso (${imc.toStringAsPrecision(4)}) ";}
        else if(imc >=30 && imc < 39.9){_infoText = "Obeso (${imc.toStringAsPrecision(4)}) ";}
        else if(imc >=40){_infoText = "Muito obeso (${imc.toStringAsPrecision(4)}) ";}
        

          });
        }

 
 
 
 
 
 
  void _resetFields(){
    
    //colocando o texto como vazio 
    weightController.text ="";
    heightController.text ="";
    setState(() {
      _infoText = "informe o seus dados";
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculadora IMC"),
      
      centerTitle: true,
      backgroundColor: Colors.green,
      actions:<Widget> [IconButton(icon: Icon(Icons.refresh),
      onPressed: _resetFields,
      )
      ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),

        child: Form (
          key: _formkey,
          child: Column (
        //os elementos tentaram preencher todo o campo
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[Icon(Icons.person_outline,size: 120.0, color: Colors.green),
        
        TextFormField(keyboardType: TextInputType.number, 
        decoration: InputDecoration(
          labelText: "Peso (kg)",
          labelStyle: TextStyle(color: Colors.green),
          ),
          
        textAlign: TextAlign.center,
        style:TextStyle(color: Colors.green,fontSize: 25.0),
        controller: weightController,
        validator: (value){
          if(value.isEmpty){
            return"Insira seu peso";
          }
        } ,
        ),

         TextFormField(keyboardType: TextInputType.number, 
        decoration: InputDecoration(
          labelText: "Altura (cm)",
          labelStyle: TextStyle(color: Colors.green),
          ),
          
        textAlign: TextAlign.center,
        style:TextStyle(color: Colors.green,fontSize: 25.0),
        controller: heightController,
        validator: (value){
          if(value.isEmpty){
            return"Insira sua altura";
          }
        } ,
        ),

        Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 25.0),
          child:Container(
          height: 50.0,
          child:RaisedButton(
          onPressed: () {
            //validação dos campos
            if(_formkey.currentState.validate()){_calcular();}
            },
          child: Text("Calcular", style:TextStyle(color:Colors.white, fontSize: 25.0), 
          ),
          
          color: Colors.green,
        )
        ),
        ),
        Text(_infoText,textAlign: TextAlign.center,
        style: TextStyle(color: Colors.green, fontSize: 25.0),
      )
      ],
      ),
        ),
      )

    );
  }
}