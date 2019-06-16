//
//  LoadingRow.swift
//  SwiftUI-List-Pagination
//
//  Created by MataraiKaoru on 2019/06/16.
//  Copyright © 2019 MataraiKaoru. All rights reserved.
//

import SwiftUI

struct LoadingRow : View {
    @State var isLoading: Bool

    var body: some View {
        HStack {
            Spacer()
            LoadingView(isLoading: isLoading)
            Spacer()
        }
    }
}

#if DEBUG
struct LoadingRow_Previews : PreviewProvider {
    static var previews: some View {
        LoadingRow(isLoading: true)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
#endif
