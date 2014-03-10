//
//  CRViewController.m
//  TestAssetLibrary
//
//  Created by Jason Ravel on 3/10/14.
//

#import "CRViewController.h"

@interface CRViewController ()

@property (nonatomic) BOOL hasPresentedImagePicker; // not needed anymore, since picker doesn't open automatically
@property (strong, nonatomic) CRVPanoramaImagePicker *panoramaImagePicker;


@end

@implementation CRViewController

@synthesize hasPresentedImagePicker, selectedImage, panoramaImagePicker;

- (void)viewDidLoad
{
    [super viewDidLoad];
    hasPresentedImagePicker = NO;
    panoramaImagePicker = [[CRVPanoramaImagePicker alloc] init];
    
    [panoramaImagePicker setDisablePortraitImages:YES];
    
    [panoramaImagePicker setGotPanoramaImage:^(UIImage * image) {
        
        [selectedImage setImage: image];
     
        
        [self dismissViewControllerAnimated:YES completion:nil];
    
        
 
        
    }];
    
 
}



- (void)viewDidAppear:(BOOL)animated
{
    // prevent the image picker from appearing every time the view appears
    if (!hasPresentedImagePicker)
    {
        hasPresentedImagePicker = YES;
        
//        [self presentImagePicker];
    }
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)presentImagePicker
{
    [self presentViewController:panoramaImagePicker animated:YES completion:nil];
}

- (IBAction)btnOpenImagePicker:(id)sender {
    [self presentImagePicker];
}

- (IBAction)sendtoSincerely:(id)sender {
    
   if(selectedImage.image != nil)
   {

    //Sincerely
    SYSincerelyController *controller = [[SYSincerelyController alloc] initWithImages:[NSArray arrayWithObject:selectedImage.image]
                                                                              product:SYProductTypePostcard
                                                                       applicationKey:@"IF2YPB1DHA4MFSM29DEWO366CP1USYE1ZDHLWOOB"
                                                                             delegate:self];
    
    if (controller) {
        [self presentViewController:controller animated:YES completion:NULL];
    }
       
   }
   else
   {
       UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Wait!" message: @"Select a Panorama First!" delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
       [alert show];
   }
}


//Sincerely delegate protocol methods
- (void)sincerelyControllerDidFinish:(SYSincerelyController *)controller {
    /*
     * Here I know that the user made a purchase and I can do something with it
     */
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)sincerelyControllerDidCancel:(SYSincerelyController *)controller {
    /*
     * Here I know that the user hit the cancel button and they want to leave the Sincerely controller
     */
    

    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)sincerelyControllerDidFailInitiationWithError:(NSError *)error {
    /*
     * Here I know that incorrect inputs were given to initWithImages:product:applicationKey:delegate;
     */
    
    NSLog(@"Error: %@", error);
}

@end
