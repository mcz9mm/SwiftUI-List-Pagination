//
//  ContentView.swift
//  SwiftUI-List-Pagination
//
//  Created by MataraiKaoru on 2019/06/16.
//  Copyright © 2019 MataraiKaoru. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @EnvironmentObject private var viewModel: RowDataViewModel
    @State private var pageIndex = 0
    private let count = 20

    var body: some View {

        NavigationView {
            List {
                ForEach(self.viewModel.rowDataModels) { rowData in
                    if rowData.isEndIndex {
                        ListRow(model: rowData).onAppear {
                            if !self.viewModel.isLoading {
                                self.pageIndex += 1
                                self.viewModel.fetch(page: self.pageIndex, count: self.count)
                                print("==========\(self.pageIndex)==========")
                            }
                        }
                    } else {
                        ListRow(model: rowData)
                    }
                }
                LoadingRow(isLoading: true)
                }
                .navigationBarTitle(Text("Pagination:\(pageIndex)"), displayMode: .large)
            }
            .onAppear {
                guard self.viewModel.rowDataModels.isEmpty else {
                    return
                }
                self.viewModel.fetch(page: self.pageIndex, count: self.count)
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
        .environmentObject(RowDataViewModel())
    }
}
#endif
