//
//  ImageViewController.m
//  Moubarak_Jamal_MDF2_Project3
//
//  Created by Jamal Moubarak on 3/18/14.
//  Copyright (c) 2014 Jamal Moubarak. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    // Set the original and scaled images
    originalImageView.image = _original;
    scaledImageView.image = _scaled;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onSave:(id)sender
{
    // Save the images to the album
    UIImageWriteToSavedPhotosAlbum(_original, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    UIImageWriteToSavedPhotosAlbum(_scaled, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

-(IBAction)onCancel:(id)sender
{
    // Cancel and dismiss the viewController
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    //Show alert if there is an error
    if (error != nil)
    {
        [self myAlert:@"Error saving SELFIE!"];
    }
    else{
        //Show alert on success
        [self myAlert:@"SELFIE has been saved"];
    }
         [self dismissViewControllerAnimated:YES completion:nil];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
