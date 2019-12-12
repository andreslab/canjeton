import 'package:canjeton/pages/navigator.dart';

import '../widgets/input_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../api/auth.dart';
import '../api/coupon.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //key que se agrega al Form para acceder a funciones
  final _formKey = GlobalKey<FormState>();
  final _authAPI = AuthAPI();
  final _couponAPI = CouponAPI();

  var _email = '', _password = '';
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
      final isOk = await _authAPI.login(context, email : _email, password: _password);
      
      setState(() {
        _isFetching = false;
      });
      if (isOk){
        print("LOGIN");
        Navigator.pushNamed(context, "navigator");
      }
    }
  }

  _loginWithoutUser() async{
    
    print("call coupons");
      //call request
    final data = await _couponAPI.getCouponsList(context);
      
    if (data != null){
      print("LIST COUPON SUCCESS");
      print(data.toString());
      Navigator.pushNamed(context, "navigator", arguments: DataCoupon(data));
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
                            /*Text("Hello again. \nWelcome back",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w300)),*/
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
                                  InputText(label: "Correo electrónico",
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
                                    return "Contraseña invalida";
                                  },
                                  isSecure: true,)
                                ],),
                              )
                            ),
                            SizedBox(height: 40,),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: 350, minWidth: 350),
                              child: CupertinoButton(
                                padding: EdgeInsets.symmetric(vertical: 17),
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(4),
                                onPressed: () => _submit(),
                                child: Text("Ingresar",
                                    style: TextStyle(fontSize: 20)),
                              ),
                            ),
                            SizedBox(height: 20,),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: 350, minWidth: 350),
                              child: CupertinoButton(
                                padding: EdgeInsets.symmetric(vertical: 17),
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(4),
                                onPressed: () => _loginWithoutUser(),
                                child: Text("Ingreso sin credenciales",
                                    style: TextStyle(fontSize: 20)),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("No posee una cuenta",
                                style: TextStyle(fontSize: 16,
                                color: Colors.black54)),
                                CupertinoButton(
                                  child: Text("regístrate",
                                  style: TextStyle(fontSize: 16, color: Colors.pinkAccent)),
                                  onPressed: ()=>Navigator.pushNamed(context, "register"),
                                )
                              ],
                            ),
                            SizedBox(height: size.height*0.03,)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
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
