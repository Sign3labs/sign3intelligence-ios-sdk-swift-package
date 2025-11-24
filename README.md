# IdentityFraud SDK Integration Guide for iOS

The IdentityFraud SDK is an iOS-based fraud prevention toolkit designed to assess device security, detecting potential risks such as jailbroken devices, app tampering, VPN connections, or screen mirroring and much more. Providing insights into the device's safety, it enhances security measures against fraudulent activities and ensures a robust protection system. 

<br>

## Recommended
- iOS 15.0 or higher
- [Access WiFi Information entitlement](https://developer.apple.com/documentation/bundleresources/entitlements/com_apple_developer_networking_wifi-info) 
- [Location permission](https://developer.apple.com/documentation/corelocation/)
- [iCloud](https://developer.apple.com/documentation/CloudKit)

> __NOTE:__ If the listed permissions are unavailable for the application, the corresponding values will not be collected, potentially limiting the reliability of Device Intelligence. We recommend enabling as many permissions as possible based on your use case to enhance the accuracy and completeness of the data collected.

<br>

## Installation

#### Using XCFramework
 - Download the latest `IdentityFraud.xcframework` from the release page or from your provided SDK package.
 - Drag and drop `IdentityFraud.xcframework` into your Xcode project’s `General` tab under `Frameworks, Libraries, and Embedded Content` section and set it to `Embed & Sign`.
 - Ensure your project’s Build Settings → Framework Search Paths includes the folder containing the `IdentityFraud.xcframework` (if needed), then clean and rebuild your project.

<br>

## Integration

The SDK can be imported like any other library:

### For Swift
``` swift
import IdentityFraud
```

### For Objective-C
``` objective-c
#import "IdentityFraud/IdentityFraud-Swift.h"
```

<br>

## Initializing the SDK

1. Initialize the SDK in your **AppDelegate** class within the **application(_:didFinishLaunchingWithOptions:)** method.
2. Use the ClientID and Client Secret shared with the credentials document.

### For Swift
``` swift
if #available(iOS 15.0, *) {
    let options = Options.Builder()
        .setClientId("<CLIENT_ID>")
        .setClientSecret("<CLIENT_SECRET>")
        .setEnvironment(Environment.PROD) // For Prod: Environment.PROD, For Dev: Environment.DEV
        .build()

    IdentitySDK.getInstance().initAsync(options: options){isInitialize in
        // To check if the SDK is initialized correctly or not
    }
}
```

### For Objective-C
``` objective-c
if #available(iOS 15.0, *) {
    OptionBuilder *builder = [[OptionBuilder alloc] init];
    builder = [builder setClientId:@"<CLIENT_ID>"];
    builder = [builder setClientSecret:@"<CLIENT_SECRET>"];
    builder = [builder setEnvironment:EnvironmentPROD];
    Options *options = [builder build];

    [[IdentitySDK getInstance] initAsyncWithOptions:options completion:^(
        BOOL isInitialize
    ) {
        // Handle initialization result
        NSLog(@"TAG_Initialization status: %@", isInitialize ? @"YES" : @"NO");
    }];
}
```

<br>

## Optional Parameters
1. You can add optional parameters like UserId, Phone Number, etc., at any time and update the instance of IdentityFraud.
3. Once the options are updated, they get reset. Clients need to explicitly update the options again to ingest them, or else the default value of OTHERS in userEventType will be sent to the backend.
4. You need to call **getIntelligence()** function whenever you update the options.
5. To update the IdentityFraud instance with optional parameters, including additional attributes, you can use the following examples.

### For Swift
``` swift
if #available(iOS 15.0, *) {
    IdentitySDK.getInstance().updateOptions(updateOption:  UpdateOption.Builder()
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
}
```

### For Objective-C
``` objective-c
if #available(iOS 15.0, *) {
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
    [[IdentitySDK getInstance] updateOptionsWithUpdateOption:updateOption];
}
```

<br>

## Get Session ID

1. The Session ID is the unique identifier of a user's app session and serves as a reference point when retrieving the device result for that session.
2. The Session ID follows the OS lifecycle management, in line with industry best practices. This means that a user's session remains active as long as the device maintains it, unless the user terminates the app or the device runs out of memory and has to kill the app.

### For Swift

 ```swift
if #available(iOS 15.0, *) {
    let sessionId = IdentitySDK.getInstance().getSessionId()
}
```

### For Objective-C

 ```objective-c
if #available(iOS 15.0, *) {
    NSString *sessionId = [[IdentitySDK getInstance] getSessionId];
}
```

<br>

## Fetch Device Intelligence Result

1. To fetch the device intelligence data refer to the following code snippet.
2. Create a class that inherits from IntelligenceResponseListener and override the onSuccess and onError methods. Create an instance of the IdentityFraud class. Pass the instance to the getIntelligence method.
3. IntelligenceResponse and IntelligenceError models are exposed by the SDK.

 ### For Swift
``` swift
if #available(iOS 15.0, *) {
    IdentitySDK.getInstance().getIntelligence(listener: IdentityFraud())
    
    class IdentityFraud: IntelligenceResponseListener{
        
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
}
```

 ### For Objective-C
``` objective-c
if #available(iOS 15.0, *) {
    IdentityFraud *listener = [[IdentityFraud alloc] init];
    [[IdentitySDK getInstance] getIntelligenceWithListener:self.listener];
    
    @interface IdentityFraud : NSObject <IntelligenceResponseListener>
    @end
    
    @implementation IdentityFraud
    
    - (void)onErrorWithError:(IntelligenceError * _Nonnull)error {
        // Something went wrong, handle the error message
    }
    
    - (void)onSuccessWithResponse:(IntelligenceResponse * _Nonnull)response {
        dispatch_async(dispatch_get_main_queue(), ^{
            // Do something with the response
        });
    }
    @end
}
```

<br>

## Sample Device Result Response

### Successful Intelligence Response

```response
{
    "deviceRiskScore": 49.83302,
    "geoSpoofed": true,
    "vpn": false,
    "hooking": true,
    "appAnalytics": {
        "affinity": {
            "entertainment": 0.5
        }
    },
    "simulator": true,
    "proxy": false,
    "newDevice": true,
    "factoryReset": false,
    "sessionRiskScore": 63.636364,
    "clientUserIds": [],
    "ip": "106.194.108.233",
    "jailbroken": false,
    "requestId": "1b1459a5-bc57-45c7-8a24-4a8fbde6777d",
    "gpsLocation": {
        "altitude": 0,
        "longitude": 72.8561644,
        "latitude": 19.0176147
    },
    "deviceId": "872dcb31-7a38-426d-8a66-88bb70024a80",
    "ipDetails": {
        "isp": "Patna (Police Colony)",
        "asn": "45609",
        "fraudScore": 0,
        "city": "Patna (Police Colony)",
        "region": "Patna (Police Colony)",
        "longitude": 85.0818,
        "country": "Patna (Police Colony)",
        "latitude": 25.5819
    },
    "sessionId": "02430cb5-84b9-4750-b48e-08a2dcf0814d",
    "cloned": true,
    "deviceMeta": {
        "cpuType": "ARM64 CPU",
        "product": "iPhone 7"
        "iOSVersion": "18.2",
        "totalRAM": "9.42 GB",
        "brand": "Apple",
        "model": "iPhone",
        "storageAvailable": "62949584896",
        "screenResolution": "1320x2868",
        "storageTotal": "494384795648"
    },
    "factoryResetTime": 1746337162,
    "appTampering": true,
    "mirroredScreen": false
}
```

### Error Response

```error
{
  "requestId": "53D0BD3F-9D30-472E-91E1-27F8D6962404",
  "errorMessage": "IdentityFraud Server Error"
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
- **deviceRiskScore**: The risk score of the device. Note: sessionRiskScore is derived from the latest state of the device but deviceRiskScore also factors in the historical state of the device (whether a device was rooted in any of the past sessions).
- **additionalData**: Reserved for any extra or custom data not present in the IntelligenceResponse, providing a customized response based on specific requirements.
- **deviceMeta**: Contains all device-related information such as brand, model, screen resolution, total storage, etc.  
- **appAnalytics**: An object containing an affinity field, which holds key-value pairs where each key is a category (e.g., entertainment, tech, gaming), and the value is a floating-point number between 0 and 1 representing the user's affinity score for that category. Higher scores indicate stronger interest, and lower scores suggest less interest. These scores are based on the apps installed on the user's device.
<br>



