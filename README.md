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
1.	You can add optional parameters like UserId, Phone Number, etc., at any time and update the instance of Sign3Intelligence.
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

## Get Session ID

1. The Session ID is the unique identifier of a user's app session and serves as a reference point when retrieving the device result for that session.
2. The Session ID follows the OS lifecycle management, in line with industry best practices. This means that a user's session remains active as long as the device maintains it, unless the user terminates the app or the device runs out of memory and has to kill the app.

 ### For Swift
 ```swift
Sign3SDK.getInstance().getSessionId()
```
 ### For Objective-C
```objectove-c
[[Sign3SDK getInstance] getSessionId]
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
    "deviceId": "19D298EB-51E6-447A-9126-75D141CF5BE9",
    "requestId": "53D0BD3F-9D30-472E-91E1-27F8D6962404"
    "mirroredScreen": false,
    "vpn": false,
    "geoSpoofed": true,
    "jailbroken": false,
    "simulator": true,
    "hooking": true,
    "gpsLocation": {
        "longitude": 72.8561644,
        "altitude": 0,
        "latitude": 19.0176147
    },
    "appTampering": true,
    "cloned": true,
    "proxy": false,
}
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

- **requestId**: A unique identifier for the specific request.
- **deviceId**: A unique identifier for the device.
- **vpn**: Indicates whether a VPN is active on the device.
- **proxy**: Indicates whether a proxy server is in use.
- **simulator**: Indicates if the app is running on an simulator.
- **mirroredScreen**: Indicates if the device's screen is being mirrored.
- **cloned**: Indicates if the user is using a cloned instance of the app.
- **geoSpoofed**: Indicates if the device's location is being faked.
- **jailbroken**: Indicates if the device has been jailbroken, which could compromise its security and integrity.
- **hooking**: Indicates if the app has been altered by malicious code.
- **appTampering**: Indicates if the app has been modified in an unauthorized way.
- **gpsLocation**: Details of the device's current GPS location, including latitude, longitude, and address information.

<br>

## Changelog
### 1.0.0
 - First stable release
