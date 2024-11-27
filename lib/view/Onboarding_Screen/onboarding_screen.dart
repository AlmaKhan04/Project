import 'package:ems/view/Signin_Singup/signin.dart';
import 'package:flutter/material.dart';
import 'package:ems/constants/colors.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget{
  const OnboardingScreen({super.key, required String title});

  @override
  State<OnboardingScreen> createState() => _OnBoarding_ScreenState();
}

class _OnBoarding_ScreenState extends State<OnboardingScreen>{
  final controller = LiquidController(); 
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final pages =[
      OnBoardingPage1(size: size),
      OnBoardingPage2(size: size),
      OnBoardingPage3(size: size),
    ];

    

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: pages,
            liquidController: controller,

            slideIconWidget: const Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
            onPageChangeCallback: OnPageChangeCallback,
          ),

          Positioned(
            bottom: 60.0,
            child: OutlinedButton(
              onPressed: (){
                int nextPage = controller.currentPage + 1;
                controller.animateToPage(page: nextPage);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(10.0),
                iconColor: Colors.white,
              ),
              child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 100, 95, 95),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_forward_ios),
              ),
            )
          ),

          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Signin(title: 'Sign In')),
                );
              },
              child: const Text("Skip", style: TextStyle(color: Colors.grey),),
            )
          ),

          Positioned(
            bottom: 10,
            child: AnimatedSmoothIndicator(
              activeIndex: controller.currentPage,
              count: 3,
              effect: const WormEffect(
                activeDotColor: Colors.black,
                dotHeight: 5.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  OnPageChangeCallback(int activePageIndex){
    setState(() {
      currentPage = activePageIndex;
    });
  }
}

class OnBoardingPage3 extends StatelessWidget {
  const OnBoardingPage3({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: tOnBoardingPage3Color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage('assets/images/onboarding_images/Scalability_and_Flexibility.png'), 
            height: size.height * 0.5,
          ),
          Text(
            'Improved Attendee Engagement and Scalability',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 50.0,
          )
        ],
      )
    );
  }
}

class OnBoardingPage2 extends StatelessWidget {
  const OnBoardingPage2({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: tOnBoardingPage2Color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage('assets/images/onboarding_images/Enhanced_Attendee_Experience.png'), 
            height: size.height * 0.5,
          ),
          Text(
            'Enhanced Attendee Experience and Satisfaction',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 50.0,
          )
        ],
      )  
    );
  }
}

class OnBoardingPage1 extends StatelessWidget {
  const OnBoardingPage1({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: tOnBoardingPage1Color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage('assets/images/onboarding_images/Streamlined_Event_Planning.png'), 
            height: size.height * 0.5,
          ),
          Text(
            'Streamlined Event Planning and Coordination',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 50.0,
          )
        ],
      )  
    );
  }
}