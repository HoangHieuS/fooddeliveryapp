import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/controllers.dart';
import 'package:food_delivery/models/models.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/utils.dart';
import 'package:food_delivery/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({Key? key}) : super(key: key);

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactPersonName = TextEditingController();
  final TextEditingController _contactPersonNumber = TextEditingController();
  late bool _isLogged;
  CameraPosition _cameraPosition =
      const CameraPosition(target: LatLng(10.77155, 106.69838), zoom: 17);
  late LatLng _initialPosition = LatLng(10.77155, 106.69838);

  @override
  void initState() {
    super.initState();
    _isLogged = Get.find<AuthController>().userLoggedIn();
    if (_isLogged && Get.find<UserController>().userModel == null) {
      Get.find<UserController>().getUserInfo();
    }
    if (Get.find<LocationController>().addressList.isNotEmpty) {
      Get.find<LocationController>().getUserAddress();
      _cameraPosition = CameraPosition(
        target: LatLng(
          double.parse(Get.find<LocationController>().getAddress['latitude']),
          double.parse(Get.find<LocationController>().getAddress['longitude']),
        ),
      );
      _initialPosition = LatLng(
        double.parse(Get.find<LocationController>().getAddress['latitude']),
        double.parse(Get.find<LocationController>().getAddress['longitude']),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address page'),
        backgroundColor: AppColors.mainColor,
      ),
      body: GetBuilder<UserController>(builder: (userController) {
        if (userController.userModel != null &&
            _contactPersonName.text.isEmpty) {
          _contactPersonName.text = '${userController.userModel?.name}';
          _contactPersonNumber.text = '${userController.userModel?.phone}';
          if (Get.find<LocationController>().addressList.isNotEmpty) {
            _addressController.text =
                Get.find<LocationController>().getUserAddress().address;
          }
        }
        return GetBuilder<LocationController>(builder: (locationController) {
          _addressController.text = '${locationController.placemark.name ?? ''}'
              '${locationController.placemark.locality ?? ''}'
              '${locationController.placemark.postalCode ?? ''}'
              '${locationController.placemark.country ?? ''}';
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: Dimensions.height20 * 7,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(
                    left: Dimensions.width5,
                    right: Dimensions.width5,
                    top: Dimensions.height5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius5),
                    border: Border.all(
                      width: 2,
                      color: AppColors.mainColor,
                    ),
                  ),
                  child: Stack(
                    children: [
                      GoogleMap(
                        // mapType: MapType.hybrid,
                        initialCameraPosition:
                            CameraPosition(target: _initialPosition, zoom: 17),
                        zoomControlsEnabled: false,
                        compassEnabled: false,
                        indoorViewEnabled: true,
                        mapToolbarEnabled: false,
                        myLocationEnabled: true,
                        onCameraIdle: () {
                          locationController.updatePosition(
                              _cameraPosition, true);
                        },
                        onCameraMove: ((position) =>
                            _cameraPosition = position),
                        onMapCreated: (GoogleMapController controller) {
                          locationController.setMapController(controller);
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: Dimensions.width20, top: Dimensions.height20),
                  child: SizedBox(
                    height: Dimensions.height45 + Dimensions.height5,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: locationController.addressTypeList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            locationController.setAddressTypeIndex(index);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.width20,
                              vertical: Dimensions.height10,
                            ),
                            margin: EdgeInsets.only(right: Dimensions.width10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                Dimensions.radius5,
                              ),
                              color: Theme.of(context).cardColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[200]!,
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Icon(
                              index == 0
                                  ? Icons.home_filled
                                  : index == 1
                                      ? Icons.work
                                      : Icons.location_on,
                              color:
                                  locationController.addressTypeIndex == index
                                      ? AppColors.mainColor
                                      : Theme.of(context).disabledColor,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.height20),
                Padding(
                  padding: EdgeInsets.only(left: Dimensions.width20),
                  child: BigText(text: 'Delevery Address'),
                ),
                SizedBox(height: Dimensions.height10),
                AppTextField(
                  textController: _addressController,
                  hintText: 'Your address',
                  icon: Icons.map,
                  iconColor: AppColors.yellowColor,
                ),
                SizedBox(height: Dimensions.height20),
                Padding(
                  padding: EdgeInsets.only(left: Dimensions.width20),
                  child: BigText(text: 'Contact person name'),
                ),
                SizedBox(height: Dimensions.height10),
                AppTextField(
                  textController: _contactPersonName,
                  hintText: 'Your name',
                  icon: Icons.person,
                  iconColor: AppColors.yellowColor,
                ),
                SizedBox(height: Dimensions.height20),
                Padding(
                  padding: EdgeInsets.only(left: Dimensions.width20),
                  child: BigText(text: 'Contact person number'),
                ),
                SizedBox(height: Dimensions.height10),
                AppTextField(
                  textController: _contactPersonNumber,
                  hintText: 'Your number',
                  icon: Icons.phone,
                  iconColor: AppColors.yellowColor,
                ),
              ],
            ),
          );
        });
      }),
      bottomNavigationBar: GetBuilder<LocationController>(
        builder: (locationController) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: Dimensions.height20 * 8,
                padding: EdgeInsets.only(
                  top: Dimensions.height30,
                  bottom: Dimensions.height30,
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                ),
                decoration: BoxDecoration(
                  color: AppColors.buttonBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20 * 2),
                    topRight: Radius.circular(Dimensions.radius20 * 2),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        AddressModel _addressModel = AddressModel(
                          addressType: locationController.addressTypeList[
                              locationController.addressTypeIndex],
                          contactPersonName: _contactPersonName.text,
                          contactPersonNumber: _contactPersonNumber.text,
                          address: _addressController.text,
                          latitude:
                              locationController.position.latitude.toString(),
                          longitude:
                              locationController.position.longitude.toString(),
                        );
                        locationController
                            .addAdress(_addressModel)
                            .then((response) {
                          if (response.isSuccess) {
                            Get.toNamed(RouteHelper.getInitial());
                            Get.snackbar('Address', 'Added Successfully');
                          } else {
                            Get.snackbar('Address', 'Could not save address');
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                          top: Dimensions.height20,
                          bottom: Dimensions.height20,
                          left: Dimensions.width20,
                          right: Dimensions.width20,
                        ),
                        child: BigText(
                          text: 'Save address',
                          color: Colors.white,
                          size: Dimensions.font26,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: AppColors.mainColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
