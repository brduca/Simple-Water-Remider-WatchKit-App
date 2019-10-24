//
//  HostingController.swift
//  Simple Water Remider WatchKit Extension
//
//  Created by Salvador Mósca on 21/10/2019.
//  Copyright © 2019 homeland. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI

class HostingController: WKHostingController<ContentView>
{
    override var body: ContentView
    {
        return ContentView(viewModel: ContentViewModel(notificationService: NotificationsService(),
                                                       plannerService: PlannerService(),
                                                       applicationSettings: ApplicationSettings.shared)
        )
    }
}
