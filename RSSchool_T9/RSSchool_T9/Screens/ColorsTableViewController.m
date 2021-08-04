//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Iaroslav Denisenko
// On: 02.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "ColorsTableViewController.h"
#import "UIColor+Hex.h"
#import "Settings.h"

static NSString *identifier = @"Cell";

@interface ColorsTableViewController ()

@property (nonatomic, copy) NSArray <NSString *> *colors;

@end

@implementation ColorsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupDataSource];
}

- (void) setupDataSource {
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:identifier];
    self.colors = @[
        @"#BE2813",
        @"#3802DA",
        @"#467C24",
        @"#808080",
        @"#8E5AF7",
        @"#F07F5A",
        @"#F3AF22",
        @"#3DACF7",
        @"#E87AA4",
        @"#0F2E3F",
        @"#213711",
        @"#511307",
        @"#92003B"
    ];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.colors.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    NSString *colorHex = self.colors[indexPath.row];
    cell.textLabel.text = colorHex;
    cell.textLabel.textColor = [UIColor colorFromHexString:colorHex];
    
    if ([colorHex isEqualToString:Settings.shared.color]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }

    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    Settings.shared.color = self.colors[indexPath.row];
    [tableView reloadData];
}


@end
