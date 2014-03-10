//
//  CRViewController.h
//  TestAssetLibrary
//
//  Created by Jason Ravel on 3/10/14.
//

#import <UIKit/UIKit.h>
#import "CRVPanoramaImagePicker.h"
#import <ShipLib/ShipLib.h>


@interface CRViewController : UIViewController <SYSincerelyControllerDelegate>
{
}

@property (weak, nonatomic) IBOutlet UIImageView *selectedImage;
@property (strong, nonatomic) UIImage *sincerely_image;


- (IBAction)btnOpenImagePicker:(id)sender;
- (IBAction)sendtoSincerely:(id)sender;

@end
