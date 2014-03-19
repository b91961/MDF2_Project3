//
//  ImageViewController.h
//  Moubarak_Jamal_MDF2_Project3
//
//  Created by Jamal Moubarak on 3/18/14.
//  Copyright (c) 2014 Jamal Moubarak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewController : UIViewController
{
    IBOutlet UIImageView *originalImageView;
    IBOutlet UIImageView *scaledImageView;
}

-(IBAction)onSave:(id)sender;
-(IBAction)onCancel:(id)sender;

@property(nonatomic, strong)UIImage *original;
@property(nonatomic, strong)UIImage *scaled;

@end
