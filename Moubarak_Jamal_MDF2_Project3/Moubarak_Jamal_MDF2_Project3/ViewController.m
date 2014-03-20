//
//  ViewController.m
//  Moubarak_Jamal_MDF2_Project3
//
//  Created by Jamal Moubarak on 3/18/14.
//  Copyright (c) 2014 Jamal Moubarak. All rights reserved.
//

#import "ViewController.h"
#import "ImageViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController ()

@end

@implementation ViewController

-(IBAction)onSelfie:(id)sender
{
    // Picker controller for image capture using camera
    pickerController = [[UIImagePickerController alloc] init];
    if (pickerController != nil)
    {
        pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        pickerController.delegate = self;
        pickerController.allowsEditing = true;
        pickerController.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        
        [self presentViewController:pickerController animated:true completion:nil];
    }
}

-(IBAction)onVideo:(id)sender
{
    // Picker controller for movies
    pickerController = [[UIImagePickerController alloc] init];
    if (pickerController != nil)
    {
        pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        pickerController.delegate = self;
        pickerController.allowsEditing = false;
        pickerController.videoQuality = UIImagePickerControllerQualityTypeMedium;
        pickerController.mediaTypes = [NSArray arrayWithObjects:(NSString *)kUTTypeMovie, nil];
        
        [self presentViewController:pickerController animated:true completion:nil];
    }
}

-(IBAction)onAlbum:(id)sender
{
    //Picker controller to access album
    pickerController = [[UIImagePickerController alloc] init];
    if (pickerController != nil)
    {
        pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        pickerController.delegate = self;
        pickerController.allowsEditing = true;
        
        [self presentViewController:pickerController animated:true completion:nil];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    originalImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    scaledImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    urlString = [info valueForKey:UIImagePickerControllerMediaURL];
    
    if (originalImage != nil)
    {
        // Send images over to ImageViewController
        ImageViewController *imageView = [self.storyboard instantiateViewControllerWithIdentifier:@"imageView"];
        if (imageView != nil)
        {
            imageView.original = originalImage;
            imageView.scaled = scaledImage;
            
            [self dismissViewControllerAnimated:NO completion:^{[self presentViewController:imageView animated:YES completion:nil];
            }];
        }
    }
    else if (urlString != nil)
    {
        // Save movie to album
        videoURL = [urlString path];
        UISaveVideoAtPathToSavedPhotosAlbum(videoURL, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
    }
}

- (void)video:(NSString *)videoURL didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error != nil)
    {
        // Error alert for movie
        [self myAlert:@"Error saving SELFIE VIDEO!"];
    }
    else
    {
        // Success alert for movies
        [self myAlert:@"SELFIE VIDEO! has been saved"];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)myAlert:(NSString *)alertView
{
    //My alert view
    alert = [[UIAlertView alloc]
                 initWithTitle:alertView
                 message:nil
                 delegate:nil
                 cancelButtonTitle:@"OK"
                 otherButtonTitles:nil];
    if (alert != nil)
    {
        [alert show];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
