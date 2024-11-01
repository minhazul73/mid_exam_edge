import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Assignment extends StatelessWidget {
  const Assignment({super.key});

  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    RxBool menuClicked = false.obs;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: (){
                      menuClicked.value = ! menuClicked.value;

                    },
                    child: Icon(Icons.menu)),
                SizedBox(height: size.width * .077,),
                SizedBox(
                    width: size.width * .80,
                    height: size.height * .69,
                    child: Obx(() => Stack(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 340),
                          curve: Curves.easeOut,
                          width: menuClicked.value ? size.width : size.width * .39,
                          height: size.height * .80,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(menuClicked.value ? 55: 100)
                          ),
                        ),
                        AnimatedPositioned(

                          duration: const Duration(milliseconds: 340),
                          curve: Curves.easeOut,
                          right: 0,
                          top:menuClicked.value ? 100 : 0,
                          child: Padding(
                            padding: EdgeInsets.all( menuClicked.value ?17 :0),
                            child: AnimatedContainer(

                              duration: const Duration(milliseconds: 340),
                              curve: Curves.easeOut,
                              width:menuClicked.value ? size.width -100-34: size.width * .39,
                              height:menuClicked.value ? size.width * .90 -66 -34 : size.height * .38,
                              decoration: BoxDecoration(
                                  color: Colors.brown,
                                  borderRadius: BorderRadius.circular(menuClicked.value ? 55 :100)
                              ),
                            ),
                          ),
                        ),
                        AnimatedPositioned(

                          duration: const Duration(milliseconds: 340),
                          curve: Curves.easeOut,
                          bottom:menuClicked.value ? size.width *1.1 - size.width * 0.29: 0,
                          right: menuClicked.value ? 17 : 0,
                          child: AnimatedContainer(

                            duration: const Duration(milliseconds: 340),
                            curve: Curves.easeOut,
                            width:menuClicked.value ? size.width *0.12 : size.width * .39,
                            height:menuClicked.value ? size.width *0.12 : size.height * .29,
                            decoration: BoxDecoration(
                                color: Color(0xff4b4b4b),
                                borderRadius: BorderRadius.circular(100)
                            ),
                          ),
                        ),
                      ],
                    ),)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
