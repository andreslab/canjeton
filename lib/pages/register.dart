import '../widgets/input_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../api/auth.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  //key que se agrega al Form para acceder a funciones
  final _formKey = GlobalKey<FormState>();
  final _authAPI = AuthAPI();

  var _username = '', _email = '', _password = '';
  var _isFetching = false;

  @override
  void initState(){
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  _submit() async{
    if (_isFetching) return;
    final isValid = _formKey.currentState.validate();
    if (isValid){

      setState(() {
        _isFetching = true;
      });
      //call request
      final isOk = await _authAPI.register(context, name : _username, email : _email, password: _password);
      
      setState(() {
        _isFetching = false;
      });
      if (isOk){
        print("REGISTER");
        Navigator.pushNamed(context, "home");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    //captura el tamano de la pantalla
    final size = MediaQuery.of(context).size;

    // TODO: implement build
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          //cuando le da tap fuera del teclado
          FocusScope.of(context).requestFocus(FocusNode());
        },
              child: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: <Widget>[
              Positioned(
                right: -size.width * 0.25,
                top: -size.width * 0.36,
                child: Container()
              ),
              Positioned(
                left: -size.width * 0.35,
                top: -size.width * 0.34,
                child: Container(),
              ),
              SingleChildScrollView(
                child: Container(
                  width: size.width,
                  height: size.height,
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                                width: 90,
                                height: 90,
                                margin: EdgeInsets.only(top: size.width * 0.3),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26, blurRadius: 25)
                                    ])),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: 350, minWidth: 350),
                              child: Form(
                                key: _formKey,
                                                              child: Column(children: <Widget>[
                                  InputText(label: "Nombre y Apellido",
                                  validator: (String text) {
                                    //solo acepta letras y numeros, validado con expresion regular
                                    if (RegExp(r'^[a-zA-Z0-9]+$').hasMatch(text)) {
                                      _username = text;
                                      return null;
                                    }
                                    return "Campo inválido";
                                    },),
                                  SizedBox(height: 20,),
                                  InputText(label: "Dirección de correo",
                                  validator: (String text) {
                                    if (text.contains("@")) {
                                      _email = text;
                                      return null;
                                    }
                                    return "Correo inválido";
                                    },
                                    inputType: TextInputType.emailAddress,),
                                  SizedBox(height: 20,),
                                  InputText(label: "Contraseña",
                                  validator: (String text) {
                                     if (text.isNotEmpty && text.length > 5) {
                                      _password = text;
                                      return null;
                                    }
                                    return "Contraseña inválido";
                                  },
                                  isSecure: true,)
                                ],),
                              )
                            ),
                            SizedBox(height: 30,),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: 350, minWidth: 350),
                              child: CupertinoButton(
                                padding: EdgeInsets.symmetric(vertical: 17),
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(4),
                                onPressed: () => _submit(),
                                child: Text("Registrarse",
                                    style: TextStyle(fontSize: 18)),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text("o", textAlign: TextAlign.center,),
                            SizedBox(height: 10,),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: 350, minWidth: 350),
                              child: CupertinoButton(
                                padding: EdgeInsets.symmetric(vertical: 17),
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(4),
                                onPressed: () => print("Facebook login"),
                                child: Text("Facebook",
                                    style: TextStyle(fontSize: 18)),
                              ),
                            ),
                            SizedBox(height: 10,),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: 350, minWidth: 350),
                              child: CupertinoButton(
                                padding: EdgeInsets.symmetric(vertical: 17),
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(4),
                                onPressed: () => print("Google login"),
                                child: Text("Google",
                                    style: TextStyle(fontSize: 18)),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text("Al crear una cuenta acepta los nuestros\n términos de uso y política de privacidad", textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
                            /*Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Already have a account",
                                style: TextStyle(fontSize: 16,
                                color: Colors.black54)),
                                CupertinoButton(
                                  child: Text("Sign in",
                                  style: TextStyle(fontSize: 16, color: Colors.pinkAccent)),
                                  onPressed: ()=>Navigator.pop(context),
                                )
                              ],
                            ),*/
                            SizedBox(height: size.height*0.03,)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
              /*,Positioned(
                left: 10,
                top: 10,
                child: SafeArea(
                                  child: CupertinoButton(
                    onPressed: () =>Navigator.pop(context),
                    child: Icon(Icons.arrow_back,
                    color: Colors.white,),
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(30),
                    padding: EdgeInsets.all(10),
                  ),
                ),
              )*/
            ,_isFetching ? Positioned.fill(
                child: Container(
                  color: Colors.black45,
                  child: CupertinoActivityIndicator(
                    radius: 15,
                  ),
                ),
              ) : Container()
            ],
          ),
        ),
      ),
    );
  }
}
