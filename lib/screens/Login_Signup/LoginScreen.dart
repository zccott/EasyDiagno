import 'package:easydiagno/Models/UserModel/loginModel.dart';
import 'package:easydiagno/Models/UserModel/loginResponce.dart';
import 'package:easydiagno/Models/constantShared.dart';
import 'package:easydiagno/Services/UserModule/userLogin.dart';
import 'package:easydiagno/screens/Admin/AdminHome.dart';
import 'package:easydiagno/screens/AppHome/Homescreen.dart';
import 'package:easydiagno/screens/HospitalRegistration/hospitalHome.dart';
import 'package:easydiagno/screens/Login_Signup/SignupScreen.dart';
import 'package:easydiagno/widgets/Textfields/customTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passworController = TextEditingController();
  bool passwordVisible = true;

//Firebase login
  loginCheck() async {
    print('here');
    try {
      print("inside login try");
      //await FirebaseAuth.instance.currentUser!.reload();

      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passworController.text);

      final user = FirebaseAuth.instance.currentUser;
      if (user!.emailVerified) {
        print("email is verified");
        final userModel = UserLoginmodel(
            email: emailController.text, password: passworController.text);
        final check = await userLoginApi(userModel);
        if (check != null) {
          if (check.type == "user") {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              return HomeScreen();
            }));
          } else if (check.type == "hospital") {
            final shared = await SharedPreferences.getInstance();
            shared.setBool("isProfileCompleted", false);
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              return HospitalHome(
                status: profileStatus!,
              );
            }));
          } else if (check.type == "admin") {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              return HospitalHome(
                status: profileStatus!,
              );
            }));
          } else if (check.type == "pending") {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("waiting for admin approval for your hospital"),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.all(10),
                duration: Duration(seconds: 8)));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Something went wrong, please try again"),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.all(10),
                duration: Duration(seconds: 8)));
          }
        }
      } else {
        print("not verified");
        final user = FirebaseAuth.instance.currentUser;
        await user!.sendEmailVerification();
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return buildEmailVerificationDialog();
            });
        // buildEmailVerificationDialog();
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //     content: Text("Email is not verified"),
        //     backgroundColor: Colors.red,
        //     behavior: SnackBarBehavior.floating,
        //     margin: EdgeInsets.all(10),
        //     duration: Duration(seconds: 8)));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Invalid Credentials"),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(10),
            duration: Duration(seconds: 8)));
      }
      //print("Error :    ---- ${e.code}");
    }
  }

  //Email verification alert
  AlertDialog buildEmailVerificationDialog() {
    return AlertDialog(
      title: Text("Email Verification"),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Your email is not verified.Verification email has been sent. Please check your email and click the 'Verified' button once done.",
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () async {
                  // Wait for the email verification to complete
                  await FirebaseAuth.instance.currentUser!.reload();
                  final user = FirebaseAuth.instance.currentUser;
                  if (user!.emailVerified) {
                    // Email is verified, proceed with registration
                    //await apiRequest();

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Registered successfully"),
                        backgroundColor: Colors.blue,
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(10),
                        duration: Duration(seconds: 5),
                      ),
                    );

                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) {
                        return LoginScreen();
                      }),
                    );
                  } else {
                    // Show a message indicating that the email is not verified
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Email is not verified. Please verify your email before logging in.",
                        ),
                        backgroundColor: Colors.red,
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(10),
                        duration: Duration(seconds: 8),
                      ),
                    );
                  }
                },
                child: Text("Verified"),
              ),
              TextButton(
                onPressed: () async {
                  // Resend email verification
                  final user = FirebaseAuth.instance.currentUser;
                  await user!.sendEmailVerification();

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Verification email resent."),
                      backgroundColor: Colors.blue,
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.all(10),
                      duration: Duration(seconds: 5),
                    ),
                  );
                },
                child: Text("Resend"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  final _formkey = GlobalKey<FormState>();
  final String? svgimage =
      '<svg xmlns="http://www.w3.org/2000/svg" data-name="Layer 1" width="744.84799" height="747.07702" viewBox="0 0 744.84799 747.07702" xmlns:xlink="http://www.w3.org/1999/xlink"><path id="fa3b9e12-7275-481e-bee9-64fd9595a50d-203" data-name="Path 1" d="M299.205,705.80851l-6.56-25.872a335.96693,335.96693,0,0,0-35.643-12.788l-.828,12.024-3.358-13.247c-15.021-4.29394-25.24-6.183-25.24-6.183s13.8,52.489,42.754,92.617l33.734,5.926-26.207,3.779a135.92592,135.92592,0,0,0,11.719,12.422c42.115,39.092,89.024,57.028,104.773,40.06s-5.625-62.412-47.74-101.5c-13.056-12.119-29.457-21.844-45.875-29.5Z" transform="translate(-227.576 -76.46149)" fill="#f2f2f2"/><path id="bde08021-c30f-4979-a9d8-cb90b72b5ca2-204" data-name="Path 2" d="M361.591,677.70647l7.758-25.538a335.93951,335.93951,0,0,0-23.9-29.371l-6.924,9.865,3.972-13.076c-10.641-11.436-18.412-18.335-18.412-18.335s-15.315,52.067-11.275,101.384l25.815,22.51-24.392-10.312a135.91879,135.91879,0,0,0,3.614,16.694c15.846,55.234,46.731,94.835,68.983,88.451s27.446-56.335,11.6-111.569c-4.912-17.123-13.926-33.926-24.023-48.965Z" transform="translate(-227.576 -76.46149)" fill="#f2f2f2"/><path id="b3ac2088-de9b-4f7f-bc99-0ed9705c1a9d-205" data-name="Path 22" d="M747.327,253.4445h-4.092v-112.1a64.883,64.883,0,0,0-64.883-64.883H440.845a64.883,64.883,0,0,0-64.883,64.883v615a64.883,64.883,0,0,0,64.883,64.883H678.352a64.883,64.883,0,0,0,64.882-64.883v-423.105h4.092Z" transform="translate(-227.576 -76.46149)" fill="#e6e6e6"/><path id="b2715b96-3117-487c-acc0-20904544b5b7-206" data-name="Path 23" d="M680.97,93.3355h-31a23.02,23.02,0,0,1-21.316,31.714H492.589a23.02,23.02,0,0,1-21.314-31.714H442.319a48.454,48.454,0,0,0-48.454,48.454v614.107a48.454,48.454,0,0,0,48.454,48.454H680.97a48.454,48.454,0,0,0,48.454-48.454h0V141.7885a48.454,48.454,0,0,0-48.454-48.453Z" transform="translate(-227.576 -76.46149)" fill="#fff"/><path id="b06d66ec-6c84-45dd-8c27-1263a6253192-207" data-name="Path 6" d="M531.234,337.96451a24.437,24.437,0,0,1,12.23-21.174,24.45,24.45,0,1,0,0,42.345A24.43391,24.43391,0,0,1,531.234,337.96451Z" transform="translate(-227.576 -76.46149)" fill="#ccc"/><path id="e73810fe-4cf4-40cc-8c7c-ca544ce30bd4-208" data-name="Path 7" d="M561.971,337.96451a24.43594,24.43594,0,0,1,12.23-21.174,24.45,24.45,0,1,0,0,42.345A24.43391,24.43391,0,0,1,561.971,337.96451Z" transform="translate(-227.576 -76.46149)" fill="#ccc"/><circle id="a4813fcf-056e-4514-bb8b-e6506f49341f" data-name="Ellipse 1" cx="364.43401" cy="261.50202" r="24.45" fill="#63beff"/><path id="bbe451c3-febc-41ba-8083-4c8307a2e73e-209" data-name="Path 8" d="M632.872,414.3305h-142.5a5.123,5.123,0,0,1-5.117-5.117v-142.5a5.123,5.123,0,0,1,5.117-5.117h142.5a5.123,5.123,0,0,1,5.117,5.117v142.5A5.123,5.123,0,0,1,632.872,414.3305Zm-142.5-150.686a3.073,3.073,0,0,0-3.07,3.07v142.5a3.073,3.073,0,0,0,3.07,3.07h142.5a3.073,3.073,0,0,0,3.07-3.07v-142.5a3.073,3.073,0,0,0-3.07-3.07Z" transform="translate(-227.576 -76.46149)" fill="#ccc"/><rect id="bb28937d-932f-4fdf-befe-f406e51091fe" data-name="Rectangle 1" x="218.56201" y="447.10197" width="218.552" height="2.047" fill="#ccc"/><circle id="fcef55fc-4968-45b2-93bb-1a1080c85fc7" data-name="Ellipse 2" cx="225.46401" cy="427.41999" r="6.902" fill="#63beff"/><rect id="ff33d889-4c74-4b91-85ef-b4882cc8fe76" data-name="Rectangle 2" x="218.56201" y="516.11803" width="218.552" height="2.047" fill="#ccc"/><circle id="e8fa0310-b872-4adf-aedd-0c6eda09f3b8" data-name="Ellipse 3" cx="225.46401" cy="496.43702" r="6.902" fill="#63beff"/><path d="M660.69043,671.17188H591.62207a4.50493,4.50493,0,0,1-4.5-4.5v-24.208a4.50492,4.50492,0,0,1,4.5-4.5h69.06836a4.50491,4.50491,0,0,1,4.5,4.5v24.208A4.50492,4.50492,0,0,1,660.69043,671.17188Z" transform="translate(-227.576 -76.46149)" fill="#63beff"/><circle id="e12ee00d-aa4a-4413-a013-11d20b7f97f7" data-name="Ellipse 7" cx="247.97799" cy="427.41999" r="6.902" fill="#63beff"/><circle id="f58f497e-6949-45c8-be5f-eee2aa0f6586" data-name="Ellipse 8" cx="270.492" cy="427.41999" r="6.902" fill="#63beff"/><circle id="b4d4939a-c6e6-4f4d-ba6c-e8b05485017d" data-name="Ellipse 9" cx="247.97799" cy="496.43702" r="6.902" fill="#63beff"/><circle id="aff120b1-519b-4e96-ac87-836aa55663de" data-name="Ellipse 10" cx="270.492" cy="496.43702" r="6.902" fill="#63beff"/><path id="f1094013-1297-477a-ac57-08eac07c4bd5-210" data-name="Path 88" d="M969.642,823.53851H251.656c-1.537,0-2.782-.546-2.782-1.218s1.245-1.219,2.782-1.219H969.642c1.536,0,2.782.546,2.782,1.219S971.178,823.53851,969.642,823.53851Z" transform="translate(-227.576 -76.46149)" fill="#3f3d56"/><path d="M792.25256,565.92292a10.09371,10.09371,0,0,1,1.41075.78731l44.8523-19.14319,1.60093-11.81526,17.92157-.10956-1.05873,27.0982-59.19987,15.65584a10.60791,10.60791,0,0,1-.44749,1.20835,10.2346,10.2346,0,1,1-5.07946-13.68169Z" transform="translate(-227.576 -76.46149)" fill="#ffb8b8"/><polygon points="636.98 735.021 624.72 735.021 618.888 687.733 636.982 687.734 636.98 735.021" fill="#ffb8b8"/><path d="M615.96281,731.51778h23.64387a0,0,0,0,1,0,0v14.88687a0,0,0,0,1,0,0H601.076a0,0,0,0,1,0,0v0A14.88686,14.88686,0,0,1,615.96281,731.51778Z" fill="#2f2e41"/><polygon points="684.66 731.557 672.459 732.759 662.018 686.271 680.025 684.497 684.66 731.557" fill="#ffb8b8"/><path d="M891.68576,806.12757h23.64387a0,0,0,0,1,0,0v14.88687a0,0,0,0,1,0,0H876.7989a0,0,0,0,1,0,0v0A14.88686,14.88686,0,0,1,891.68576,806.12757Z" transform="translate(-303.00873 15.2906) rotate(-5.62529)" fill="#2f2e41"/><circle cx="640.3925" cy="384.57375" r="24.56103" fill="#ffb8b8"/><path d="M849.55636,801.91945a4.47086,4.47086,0,0,1-4.415-3.69726c-6.34571-35.22559-27.08789-150.40528-27.584-153.59571a1.42684,1.42684,0,0,1-.01562-.22168v-8.58789a1.489,1.489,0,0,1,.27929-.87207l2.74024-3.83789a1.47845,1.47845,0,0,1,1.14355-.625c15.62207-.73242,66.78418-2.8789,69.25586.209h0c2.48242,3.10351,1.60547,12.50683,1.4043,14.36035l.00977.19336,22.98535,146.99512a4.51238,4.51238,0,0,1-3.71485,5.13476l-14.35644,2.36524a4.52127,4.52127,0,0,1-5.02539-3.09278c-4.44043-14.18847-19.3291-61.918-24.48926-80.38672a.49922.49922,0,0,0-.98047.13868c.25781,17.60546.88086,62.52343,1.0957,78.0371l.02344,1.6709a4.51811,4.51811,0,0,1-4.09277,4.53614l-13.84375,1.25781C849.83565,801.91359,849.695,801.91945,849.55636,801.91945Z" transform="translate(-227.576 -76.46149)" fill="#2f2e41"/><path id="ae7af94f-88d7-4204-9f07-e3651de85c05-211" data-name="Path 99" d="M852.38089,495.2538c-4.28634,2.548-6.85116,7.23043-8.32276,11.9951a113.681,113.681,0,0,0-4.88444,27.15943l-1.55553,27.60021-19.25508,73.1699c16.68871,14.1207,26.31542,10.91153,48.78049-.63879s25.03222,3.85117,25.03222,3.85117l4.49236-62.25839,6.41837-68.03232a30.16418,30.16418,0,0,0-4.86143-4.67415,49.65848,49.65848,0,0,0-42.44229-8.99538Z" transform="translate(-227.576 -76.46149)" fill="#63beff"/><path d="M846.12661,580.70047a10.52561,10.52561,0,0,1,1.50061.70389l44.34832-22.1972.736-12.02551,18.2938-1.26127.98041,27.4126L852.7199,592.93235a10.4958,10.4958,0,1,1-6.59329-12.23188Z" transform="translate(-227.576 -76.46149)" fill="#ffb8b8"/><path id="a6768b0e-63d0-4b31-8462-9b2e0b00f0fd-212" data-name="Path 101" d="M902.76552,508.41151c10.91151,3.85117,12.83354,45.57369,12.83354,45.57369-12.8367-7.06036-28.24139,4.49318-28.24139,4.49318s-3.20916-10.91154-7.06034-25.03223a24.52987,24.52987,0,0,1,5.13436-23.10625S891.854,504.558,902.76552,508.41151Z" transform="translate(-227.576 -76.46149)" fill="#63beff"/><path id="bfd7963f-0cf8-4885-9d3a-2c00bccda2e3-213" data-name="Path 102" d="M889.99122,467.53052c-3.06-2.44837-7.23517,2.00173-7.23517,2.00173l-2.4484-22.03349s-15.30095,1.8329-25.0935-.61161-11.32255,8.87513-11.32255,8.87513a78.57978,78.57978,0,0,1-.30582-13.77092c.61158-5.50838,8.56838-11.01675,22.6451-14.68932S887.6518,439.543,887.6518,439.543C897.44542,444.43877,893.05121,469.97891,889.99122,467.53052Z" transform="translate(-227.576 -76.46149)" fill="#2f2e41"/></svg>';
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formkey,
              child: Container(
                child: Column(
                  children: [
                    Container(
                      width: width / 1.5,
                      height: height / 3.6,
                      child: SvgPicture.string(
                        svgimage!,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    buildTextField(
                        context,
                        "Email",
                        false,
                        IconButton(onPressed: () {}, icon: Icon(null)),
                        emailController,
                        Icon(Icons.mail), (value) {
                      if (value == "") {
                        return "Field can't be empty";
                      } else if (isValidEmail(value!) == false) {
                        return "Enter a valid email";
                      } else {
                        return null;
                      }
                    }),
                    SizedBox(
                      height: 15,
                    ),
                    buildTextField(
                        context,
                        "Password",
                        passwordVisible,
                        IconButton(
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                            icon: passwordVisible
                                ? Icon(Icons.visibility_off_outlined)
                                : Icon(Icons.visibility_outlined)),
                        passworController,
                        Icon(Icons.lock), (value) {
                      if (value == "") {
                        return "Field can't be empty";
                      } else if (value!.length < 6) {
                        return "password must contain atleast 6 characters";
                      } else {
                        return null;
                      }
                    }),

                    SizedBox(
                      height: 15,
                    ),

                    //log in button
                    Container(
                      height: 55,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          print('clicked');
                          //apiCall();
                          if (_formkey.currentState!.validate()) {
                            print('clicked');
                            //checkLogin(context);
                            //await loginCheck();
                            apiCall();
                          }
                        },
                        child: Text("Login",
                            style:
                                TextStyle(fontSize: 17, color: Colors.white)),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          )),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            //width: width * 0.35,
                            child: const Divider(
                              height: 1,
                              thickness: 1,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const Padding(
                            padding: EdgeInsets.only(left: 14, right: 14),
                            child: Text(
                              "or",
                              style: TextStyle(fontSize: 18),
                            )),
                        Expanded(
                          child: Container(
                              width: width * 0.4,
                              child: const Divider(
                                height: 1,
                                thickness: 1,
                                color: Colors.black,
                              )),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Doesn't have an account"),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (ctx) {
                                return SignupScreen();
                              }));
                            },
                            child: const Text("Sign Up",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.blue)))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }

  apiCall() async {
    final loginDetails = UserLoginmodel(
        email: emailController.text, password: passworController.text);
    userType = await userLoginApi(loginDetails);
    await sharedPrefFunc();
    if (userType!.type == "hospital") {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HospitalHome(
          status: profileStatus!,
        ),
      ));
    }
    if (userType!.type == "user") {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ));
    }
    if (userType!.type == "admin") {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AdminHome(),
      ));
    }
  }

  sharedPrefFunc() async {
    print(profileStatus);
    final shared = await SharedPreferences.getInstance();
    await shared.setInt("lid", userType!.lid);
    lid = shared.getInt("lid");
    if (shared.getBool("hospstatus") == null) {
      await shared.setBool("hospstatus", false);
      profileStatus = shared.getBool("hospstatus");
      print("pro status : $profileStatus");
    } else {
      await shared.setBool("hospstatus", false);
      profileStatus = await shared.getBool("hospstatus");
    }
  }
}
