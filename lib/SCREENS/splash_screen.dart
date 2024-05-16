
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:signio/models/intro_page_model.dart';
import 'package:signio/screens/sign_in/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splashScreen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _IntropageState();
}

class _IntropageState extends State<SplashScreen> {
  List<IntroPageModel> intropages=[
    IntroPageModel(
      title: "Online banking system",
      description: "Do all your banking transactions online !",
      imagePath :"assets/images/splash2.png",
    ),
    IntroPageModel(
      title: "GO DIGITAL, SIGN SECURELY",
      description: "Digitalize your signing process today with the first electronic signature.",
      imagePath :"assets/images/splash 3.png",
    ),
    IntroPageModel(
      title: "Collect your cheque online !",
      description: "Now, with SIGNIO , you can collect all your checks online and verify the signatures on them through artificial intelligence.",
      imagePath :"assets/images/splash 4.png",
    )


  ];
  late int indexValue;
  PageController pageController = PageController();
  @override
  void initState() {
    indexValue=0;
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              //top area
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 20,
                      //color:Colors.green,
                      child: Row(
                        children: List.generate(3, (index) =>
                            AnimatedContainer(duration: Duration(
                              microseconds: 300,
                            ),
                              height: 10,
                              width:  index==indexValue? 60: 20,
                              margin: EdgeInsets.only(right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:index==indexValue? Colors.amber[900]
                                    :Colors.grey[300],
                              ),
                            ),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignInScreen.routeName);
                    },
                    child: Text("skip",style:TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    ),
                  ),

                ],
              ),

              //center area
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (value){
                    setState(() {
                      indexValue=value;
                    });
                  },
                  itemCount: intropages.length,
                  itemBuilder: (context,index)=>_customPageviewItem(context,
                    title: "${intropages[index].title}",
                    description: "${intropages[index].description}",
                    imagePath: "${intropages[index].imagePath}",



                  ),),
              ),

              //bottom area
              Container(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (indexValue != 0) // Condition to hide the back arrow when index is 0
                      GestureDetector (
                        onTap: (){
                          if(indexValue >0 ){
                            pageController.previousPage(duration: Duration(
                                milliseconds: 300)
                              , curve: Curves.easeIn,);
                          }
                        },

                        child: Container(
                          height: 80,
                          width: 80,
                          decoration:  BoxDecoration(
                            color: Colors.amber[900],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(Icons.arrow_back,color: Colors.white,
                          ),
                        ),
                      ),
                    GestureDetector(
                      onTap: () {
                        if (indexValue == 2) {
                          Navigator.push(
                            context,
                            Navigator.pushNamed(context, SignInScreen.routeName) as Route<Object?>)
                          ;
                        } else {
                          if (indexValue < 2) {
                            pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          }
                        }
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 80,
                        width: indexValue ==0?  MediaQuery.of(context).size.width*.55:
                        80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.amber[900],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child : indexValue == 00
                            ?
                        Text("Start",style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        ) : const  Icon(
                          Icons.arrow_forward,color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _customPageviewItem(context,{
    required String title,
    required String description,
    required String imagePath,
  }

      )
  {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*.5,
          child: Image.asset("$imagePath"),
        ),
        Text("$title",style: TextStyle(
            fontWeight:FontWeight.bold,
            fontSize: 20
        ),),
        Text("$description"
          ,style: TextStyle(fontSize: 16,
            color: Colors.grey,),

        ),
      ],
    );
  }
}
