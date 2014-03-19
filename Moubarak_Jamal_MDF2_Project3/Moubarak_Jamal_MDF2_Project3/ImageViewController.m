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
    UIImageWriteToSavedPhotosAlbum(_original, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    UIImageWriteToSavedPhotosAlbum(_scaled, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

-(IBAction)onCancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error != nil)
    {
        [self newAlert:@"Error saving image."];
    }
    else{
        [self newAlert:@"Photos were saved to album."];
    }
         [self dismissViewControllerAnimated:YES completion:nil];
}
         
- (void)newAlert:(NSString *)alert
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@""
                                                       message:alert
                                                      delegate:nil
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
    if (alertView != nil)
    {
        [alertView show];
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
