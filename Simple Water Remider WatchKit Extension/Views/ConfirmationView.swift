//
//  ConfirmationView.swift
//  Simple Water Remider WatchKit Extension
//
//  Created by Salvador Mósca on 23/10/2019.
//  Copyright © 2019 homeland. All rights reserved.
//

import SwiftUI

struct ConfirmationView:View
{
    var viewModel: ConfirmationViewModelProtocol
    
    init(viewModel:ConfirmationViewModelProtocol)
    {
        self.viewModel = viewModel
    }
    
    var body: some View
    {
        Form {
            
            Section {
                List(self.viewModel.plan) { schedule  in
                    ScheduleRow(schedule: schedule)
                }
            }
            
            Section {
                Button(action: {
                    self.viewModel.confirm()
                }) {
                    Text("[Schedule]")
                }
            }
        }
    }
}
