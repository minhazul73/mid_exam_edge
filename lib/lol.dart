import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RipplingController extends GetxController {
  @override
  void onInit() {
    super.onInit();

  }
}

class Rippling extends StatelessWidget {
  Rippling({super.key});

  var flag = false.obs;
  var firstContainerSize = 0.0.obs;
  var secondContainerSize = 0.0.obs;

  @override
  Widget build(BuildContext context) {
    var size = Get.size;

    Future.delayed(Duration(milliseconds: 333), () {
      firstContainerSize.value = size.width * .55; // Final size for first container
      secondContainerSize.value = size.width * .47; // Final size for second container
    });

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: size.width,
                  height: size.height,
                  child: Obx(() => Stack(
                    alignment: Alignment.center,
                    children: [

                      AnimatedPositioned(
                        duration: Duration(milliseconds: 555),
                        curve: Curves.ease,
                        top: flag.value ? 16 + size.width * .22 : 21,
                        left: flag.value ? size.width * .5 - 40 : 21,
                        child: GestureDetector(
                          onTap: () => flag.value = true,
                          child: AnimatedOpacity(
                            opacity: flag.value ? 1 : 0,
                            duration: Duration(milliseconds: 333),
                            curve: flag.value ? Curves.easeInQuint : Curves.easeOutQuint,
                            child: Text("Ripples",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),


                      // First container (large)
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 555),
                        curve: Curves.linearToEaseOut,
                        bottom: flag. value ? 155 : size.height * .50 - firstContainerSize.value * .5,
                        right: flag.value ? 41 : size.width * .50 - firstContainerSize.value * .5,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 555),
                          curve: Curves.ease,
                          width: flag.value ? size.width * .38 : firstContainerSize.value,
                          height: flag.value ? size.width * .32 : firstContainerSize.value,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(flag.value ? 100 : 1000),
                          ),
                          child: AnimatedOpacity(
                            duration: Duration(milliseconds: 333),
                            opacity: flag.value ? 1 : 0,
                          ),
                        ),
                      ),


                      // Second container (medium)
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 555),
                        curve: Curves.ease,
                        right: flag.value ? 41 : size.width * .5 - size.width * .47 * .5,
                        top: flag.value ? 144 : size.height * .5 - size.width * .47 * .5,

                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 555),
                          curve: Curves.ease,
                          width: flag.value ? size.width * .38 : secondContainerSize.value,
                          height: flag.value ? size.width * .50 : secondContainerSize.value,
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(1000),
                          ),
                          child: GestureDetector(
                              onTap: () => flag.value = false,
                              child: AnimatedOpacity(
                                  duration: Duration(milliseconds: 333),
                                  opacity: flag.value ? 1 : 0,
                                  child: Icon(Icons.autorenew_rounded, color: Colors.white70, size: 80,))),
                        ),
                      ),


                      // Third container (small)
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 555),
                        curve: Curves.ease,
                        top: flag.value ? 144 : size.height * .5 - size.width * .38 * .5,
                        left: flag.value ? 41 : size.width * .5 - size.width * .38 * .5,

                        child: GestureDetector(
                          onTap: () => flag.value = true,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 555),
                            curve: Curves.ease,
                            width: size.width * .38,
                            height: flag.value ? size.width * .85 : size.width * .38,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(1000),
                            ),
                            child: Center(
                              child: AnimatedOpacity(
                                opacity: 1,
                                duration: Duration(milliseconds: 555),
                                curve: Curves.linearToEaseOut,
                                child: Text("Go",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
