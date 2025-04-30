# Sign3 SDK Integration Guide for iOS

The Sign3 SDK is an iOS-based fraud prevention toolkit designed to assess device security, detecting potential risks such as rooted devices, VPN connections, or remote access and much more. Providing insights into the device's safety, it enhances security measures against fraudulent activities and ensures a robust protection system.
<br>

## Requirements
- iOS 13.0 or higher
- [Access WiFi Information entitlement](https://developer.apple.com/documentation/bundleresources/entitlements/com_apple_developer_networking_wifi-info) 
- [Location permission](https://developer.apple.com/documentation/corelocation/)
- [iCloud](https://developer.apple.com/documentation/CloudKit)

> __NOTE:__ If the listed permissions are unavailable for the application, the corresponding values will not be collected, potentially limiting the reliability of Device Intelligence. We recommend enabling as many permissions as possible based on your use case to enhance the accuracy and completeness of the data collected.

<br>

## Installation

#### Using CocoaPods

1. To integrate Sign3Intelligence into your Xcode project using CocoaPods, specify it in your Podfile
2. Checkout the [latest_version](https://github.com/ashishgupta6/sign3intelligence-ios-sdk-swift-package/tree/main?tab=readme-ov-file#changelog)
```
pod 'Sign3Intelligence', '~> <latest_version>'
```

#### Using Swift package manager

URL for the repository: https://github.com/ashishgupta6/sign3intelligence-ios-sdk-swift-package

<br>

## Integration

The SDK can be imported like any other library:

### For Swift
``` swift
import Sign3Intelligence
```
### For Objective-C
``` objective-c
#import "Sign3Intelligence/Sign3Intelligence-Swift.h"
```

## Initializing the SDK

1. Initialize the SDK in your **AppDelegate** class within the **application(_:didFinishLaunchingWithOptions:)** method.
2. Use the ClientID and Client Secret shared with the credentials document.

### For Swift
``` swift
let options = Options.Builder()
    .setClientId("<SIGN3_CLIENT_ID>")
    .setClientSecret("<SIGN3_CLIENT_SECRET>")
    .setEnvironment(Environment.PROD) // For Prod: Environment.PROD, For Dev: Environment.DEV
    .build()

Sign3SDK.getInstance().initAsync(options: options){isInitialize in
    // To check if the SDK is initialized correctly or not
}
```
### For Objective-C
``` objective-c
OptionBuilder *builder = [[OptionBuilder alloc] init];
builder = [builder setClientId:@"<SIGN3_CLIENT_ID>"];
builder = [builder setClientSecret:@"<SIGN3_CLIENT_SECRET>"];
builder = [builder setEnvironment:EnvironmentPROD];
Options *options = [builder build];

[[Sign3SDK getInstance] initAsyncWithOptions:options completion:^(BOOL isInitialize) {
    // Handle initialization result
    NSLog(@"TAG_Initialization status: %@", isInitialize ? @"YES" : @"NO");
}];
```

## Optional Parameters
1.    You can add optional parameters like UserId, Phone Number, etc., at any time and update the instance of Sign3Intelligence.
3. Once the options are updated, they get reset. Clients need to explicitly update the options again to ingest them, or else the default value of OTHERS in userEventType will be sent to the backend.
4. You need to call **getIntelligence()** function whenever you update the options.
5. To update the Sign3Intelligence instance with optional parameters, including additional attributes, you can use the following examples.

### For Swift
``` swift
Sign3SDK.getInstance().updateOptions(updateOption:  UpdateOption.Builder()
    .setPhoneNumber("1234567890")
    .setUserId("12345")
    .setPhoneInputType(PhoneInputType.GOOGLE_HINT)
    .setOtpInputType(OtpInputType.AUTO_FILLED)
    .setUserEventType(UserEventType.TRANSACTION)
    .setMerchantId("1234567890")
    .setAdditionalAttributes(
        ["SIGN_UP_TIMESTAMP": String(Date().timeIntervalSince1970 * 1000),
         "SIGNUP_METHOD": "PASSWORD",
         "REFERRED_BY": "UserID",
         "PREFERRED_LANGUAGE": "English"
        ]
).build())
```
### For Objective-C
``` objective-c
UpdateOptionBuilder *builder = [[UpdateOptionBuilder alloc] init];
builder = [builder setPhoneNumber:@"1234567890"];
builder = [builder setUserId:@"vy53jbdg8"];
builder = [builder setPhoneInputType:PhoneInputTypeMANUAL];
builder = [builder setOtpInputType:OtpInputTypeCOPY_PASTED];
builder = [builder setUserEventType:UserEventTypeLOGIN];
builder = [builder setMerchantId:@"1234567890"];
NSDictionary *additionalAttributes = @{
    @"SIGN_UP_TIMESTAMP": [NSString stringWithFormat:@"%f", [[NSDate date] timeIntervalSince1970] * 1000],
    @"SIGNUP_METHOD": @"PASSWORD",
    @"REFERRED_BY": @"UserID",
    @"PREFERRED_LANGUAGE": @"English"
};
builder = [builder setAdditionalAttributes:additionalAttributes];
UpdateOption *updateOption = [builder build];
[[Sign3SDK getInstance] updateOptionsWithUpdateOption:updateOption];
```

## Fetch Device Intelligence Result

1. To fetch the device intelligence data refer to the following code snippet.
2. Create a class that inherits from IntelligenceResponseListener and override the onSuccess and onError methods. Create an instance of the Sign3 class. Pass the instance to the getIntelligence method.
3. IntelligenceResponse and IntelligenceError models are exposed by the SDK.

 ### For Swift
``` swift

let listener = Sign3()
Sign3SDK.getInstance().getIntelligence(listener: listener)

class Sign3: IntelligenceResponseListener{
    
    func onSuccess(response: IntelligenceResponse) {
        if let jsonString = response.toJson() {
            DispatchQueue.main.async {
                // Do something with the response
            }
        }
    }
    
    func onError(error: IntelligenceError) {
        // Something went wrong, handle the error message
    }
}
```
 ### For Objective-C
``` objective-c
Sign3 *listener = [[Sign3 alloc] init];
[[Sign3SDK getInstance] getIntelligenceWithListener:self.listener];

@interface Sign3 : NSObject <IntelligenceResponseListener>
@end

@implementation Sign3

- (void)onErrorWithError:(IntelligenceError * _Nonnull)error {
    // Something went wrong, handle the error message
}

- (void)onSuccessWithResponse:(IntelligenceResponse * _Nonnull)response {
    dispatch_async(dispatch_get_main_queue(), ^{
        // Do something with the response
    });
}
@end
```

<br>

## Sample Device Result Response

### Successful Intelligence Response

```response
{
    "sessionId": "f91b7d20-5e33-4f87-b1e0-145c6b0c8d42",
    "deviceId": "cf679f71-6358-4bf8-9b37-65e22e912053",
    "requestId": "315189c4-2767-48ed-83ec-fafc77defaad",
    "simulator": false,
    "jailbroken": false,
    "vpn": false,
    "geoSpoofed": false,
    "appTampering": true,
    "hooking": true,
    "proxy": false,
    "mirroredScreen": false,
    "gpsLocation": {
        "latitude": 28.5128729642046,
        "longitude": 77.08840542816685,
        "altitude": 237.2448616027832
    },
    "cloned": true,
    "additionalData": {},
    "clientUserIds": [
        "difansd23r32",
        "2390ksdfaksd"
    ],
    "sign3UserIds": [
        "13asefnn324"
    ],
    "newDevice": false,
    "ip": "106.219.161.71",
    "ipDetails": {
        "country": "IN",
        "fraudScore": 27.0,
        "city": "New Delhi",
        "isp": null,
        "latitude": 28.60000038,
        "region": "National Capital Territory of Delhi",
        "asn": "",
        "longitude": 77.19999695
    },
    "factoryReset": false,
    "factoryResetTime": 1745067328
    "deviceRiskScore": 99.50516,
    "sessionRiskScore": 99.50516,
}
```
### Error Response

```error
{
  "requestId": "53D0BD3F-9D30-472E-91E1-27F8D6962404",
  "errorMessage": "Sign3 Server Error"
}
```

<br>

## Intelligence Response

The intelligence response includes the following keys:

- **sessionId**: A Session ID uniquely tracks an app session until it's closed or killed.
- **requestId**: A unique identifier for the specific request.
- **newDevice**: Indicates if the device is new.
- **deviceId**: A unique identifier for the device.
- **vpn**: Indicates whether a VPN is active on the device.
- **proxy**: Indicates whether a proxy server is in use.
- **simulator**: Indicates if the app is running on an emulator.
- **mirroredScreen**: Indicates if the device's screen is being mirrored.
- **cloned**: Indicates if the user is using a cloned instance of the app.
- **geoSpoofed**: Indicates if the device's location is being faked.
- **jailbroken**: Indicates if the device has been modified for root access.
- **sessionRiskScore**: A score representing the risk level of the session.
- **hooking**: Indicates if the app has been altered by malicious code.
- **factoryReset**: Indicates if a suspicious factory reset has been performed.
- **appTampering**: Indicates if the app has been modified in an unauthorized way.
- **clientUserIds**: An array of user IDs assigned by the client that a device has seen till now.
- **gpsLocation**: Details of the device's current GPS location, including latitude, longitude, and address information.
- **ip**: The current IP address of the device.
- **ipDetails**: Object added to capture ip related information and fraudScore related to ip address.
- **sign3UserIds**: This will contain Sign3 generated userIds list till now the device has seen. Note: The logic for generating userId will be configured as per your business logic and can be customized.
- **deviceRiskScore**: The risk score of the device. Note: sessionRiskScore is derived from the latest state of the device but deviceRiskScore also factors in the historical state of the device (whether a device was rooted in any of the past sessions).
- **additionalData**: Reserved for any extra or custom data not present in the IntelligenceResponse, providing a customized response based on specific requirements.

<br>

