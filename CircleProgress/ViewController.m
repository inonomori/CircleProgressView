//
//  ViewController.m
//  drawLine
//
//  Created by zhefu wang on 3/13/14.
//  Copyright (c) 2014 zhefu wang. All rights reserved.
//

#import "ViewController.h"
#import "CircleProgressView.h"

#define TAG_CIRCLE_PROGRESS_VIEW 777

@interface ViewController ()

@property (nonatomic) CGFloat p;

@end

@implementation ViewController

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
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    CircleProgressView *v = [[CircleProgressView alloc] initWithFrame:CGRectMake(20, 72, 280, 313)];
    [v setTag:TAG_CIRCLE_PROGRESS_VIEW];
    [self.view addSubview:v];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
- (IBAction)touched:(id)sender
{
    CircleProgressView *v = (CircleProgressView*)[self.view viewWithTag:TAG_CIRCLE_PROGRESS_VIEW];
    v.angle+=10;
}
@end
