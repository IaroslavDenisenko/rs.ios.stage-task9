//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Iaroslav Denisenko
// On: 02.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "SettingsViewController.h"
#import "ColorsTableViewController.h"
#import "Settings.h"

@interface SettingsViewController ()


@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Settings";
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    
    if (indexPath.row == 0) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"SwitchCell"];
        cell.accessoryView = [self setupDrawingSwitch];
        cell.textLabel.text = @"Draw stories";
    } else {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ColorCell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"Stroke color";
    }
    
    cell.textLabel.font = [UIFont systemFontOfSize:17.0];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 1) {
        ColorsTableViewController * colorsVC = [[ColorsTableViewController alloc] initWithStyle:UITableViewStyleInsetGrouped];
        [self.navigationController pushViewController:colorsVC animated:true];
    }
}

#pragma mark - Private methods

- (UISwitch *)setupDrawingSwitch {
    UISwitch *drawingSwitch = [UISwitch new];
    [drawingSwitch addTarget:self
                      action:@selector(switchToggled:)
            forControlEvents:UIControlEventValueChanged];
    drawingSwitch.on = true;
    return drawingSwitch;
}

- (void)switchToggled:(UISwitch *)sender {
    Settings.shared.isDrawing = sender.on;
}

@end
