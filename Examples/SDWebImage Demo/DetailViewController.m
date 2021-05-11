/*
 * This file is part of the SDWebImage package.
 * (c) Olivier Poitrey <rs@dailymotion.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "DetailViewController.h"
#import <SDWebImage/SDWebImage.h>

@interface DetailViewController ()

@property (strong, nonatomic) IBOutlet SDAnimatedImageView *imageView;
@property (strong, nonatomic) UIImageView *sysImageView;
@end

@implementation DetailViewController

- (void)configureView {
    if (!self.imageView.sd_imageIndicator) {
        self.imageView.sd_imageIndicator = SDWebImageProgressIndicator.defaultIndicator;
    }
#warning -Use UIImageView to load image (hit the SDAnimatedImage) form memory cache , UIImageView can not play animation with SDAnimatedImage.
    //fix: SDWebImageManager.m  line:134
    [self.imageView sd_setImageWithURL:self.imageURL
                      placeholderImage:nil
                               options:SDWebImageProgressiveLoad];
    self.imageView.shouldCustomLoopCount = YES;
    self.imageView.animationRepeatCount = 0;
}

- (void)configureSysView {
    self.sysImageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    self.sysImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.sysImageView];
    if (!self.sysImageView.sd_imageIndicator) {
        self.sysImageView.sd_imageIndicator = SDWebImageProgressIndicator.defaultIndicator;
    }
    [self.sysImageView sd_setImageWithURL:self.imageURL
                      placeholderImage:nil
                               options:SDWebImageProgressiveLoad];
    NSLog(@"current detail url extension: %@",self.imageURL.pathExtension);
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self configureView];
#warning -For this issue
    [self configureSysView];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem.alloc initWithTitle:@"Toggle Animation"
                                                                            style:UIBarButtonItemStylePlain
                                                                           target:self
                                                                           action:@selector(toggleAnimation:)];
}

- (void)toggleAnimation:(UIResponder *)sender {
    self.imageView.isAnimating ? [self.imageView stopAnimating] : [self.imageView startAnimating];
}

@end
