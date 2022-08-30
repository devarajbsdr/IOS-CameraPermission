#import <Foundation/NSException.h>
#import <AVFoundation/AVFoundation.h>

BOOL CameraCheckDone = NO;
BOOL CameraIsAvailable = NO;

void camera_permission()
{
    if ([AVCaptureDevice respondsToSelector:@selector(requestAccessForMediaType:completionHandler:)]) {
        // Completion handler will be dispatched on a separate thread
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if (YES == granted) {
                // User granted access to the camera, continue with app launch
               // [[NSUserDefaults standardUserDefaults] setInteger: 1 forKey: @"CameraAccessGranted"];
                CameraIsAvailable = YES;
                CameraCheckDone = YES;
                UnitySendMessage("CameraAccessManager", "cameraCheck", "YES");
            }
            else {
                CameraIsAvailable = NO;
                CameraCheckDone = YES;
                UnitySendMessage("CameraAccessManager", "cameraCheck", "NO");
                // User denied camera access
                // warn the user that the app requires camera access
                // and ideally provide some guidance about the device Settings
            }

            // Here mark that the camera access check has been completed
            // (no matter if the 'granted' is YES or NO)
           // CameraCheckDone = YES;
        }];
    }
    else {
        // iOS < 7 (camera access always OK)
      //  [[NSUserDefaults standardUserDefaults] setInteger: 1 forKey: @"CameraAccessGranted"];
       CameraCheckDone = YES;
       UnitySendMessage("CameraAccessManager", "cameraCheck", "YES");
        // Continue with app launch...
    }
   
}








