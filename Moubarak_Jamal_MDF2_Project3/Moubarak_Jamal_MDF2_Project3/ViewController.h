//
//  ViewController.h
//  Moubarak_Jamal_MDF2_Project3
//
//  Created by Jamal Moubarak on 3/18/14.
//  Copyright (c) 2014 Jamal Moubarak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    UIImagePickerController *pickerController;
    
    UIImage *originalImage;
    UIImage *scaledImage;
    NSURL *urlString;
    NSString *videoURL;
    UIAlertView *alertView;
}

-(IBAction)onSelfie:(id)sender;
-(IBAction)onVideo:(id)sender;
-(IBAction)onAlbum:(id)sender;

@end
