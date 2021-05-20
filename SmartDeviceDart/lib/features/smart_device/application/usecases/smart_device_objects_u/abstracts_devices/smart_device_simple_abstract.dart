import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/smart_server_d/protoc_as_dart/smart_connection.pbgrpc.dart';

import 'smart_device_base_abstract.dart';

///  Abstract class for smart devices with on time property
abstract class SmartDeviceSimpleAbstract extends SmartDeviceBaseAbstract {
  SmartDeviceSimpleAbstract(
      String uuid, String smartInstanceName, int onOffPinNumber,
      {int onOffButtonPinNumber})
      : super(smartInstanceName, onOffPinNumber,
            onOffButtonPinNumber: onOffButtonPinNumber);

  ///  How much time the smart device was active (Doing action) continuously
  double howMuchTimeTheDeviceDoingAction;

  @override
  void setDeviceType(DeviceTypes deviceType) => super.setDeviceType(deviceType);

  @override
  Future<String> executeActionString(
      String deviceActionString, DeviceStateGRPC deviceState) async {
    final DeviceActions deviceAction =
        convertWishStringToWishesObject(deviceActionString);
    return executeDeviceAction(deviceAction, deviceState);
  }

  @override
  Future<String> executeDeviceAction(
      DeviceActions deviceAction, DeviceStateGRPC deviceState) async {
    return wishInSimpleClass(deviceAction, deviceState);
  }

  ///  All the wishes that are legit to execute from the simple class
  String wishInSimpleClass(
      DeviceActions deviceAction, DeviceStateGRPC deviceState) {
    if (deviceAction == null) return 'Your wish does not exist on simple class';
    return wishInBaseClass(deviceAction, deviceState);
  }
}
