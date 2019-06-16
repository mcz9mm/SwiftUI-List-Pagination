//
//  ListRow.swift
//  SwiftUI-List-Pagination
//
//  Created by MataraiKaoru on 2019/06/16.
//  Copyright © 2019 MataraiKaoru. All rights reserved.
//

import SwiftUI

struct ListRow : View {
    var model: RowData

    var body: some View {
        HStack {
            Spacer()

            if !model.isEndIndex {
                Text("LIST ROW")
                    .font(.headline)
            } else {
                Text("BOTTOM ROW")
                    .font(.headline)
                    .color(Color.blue)
            }

            Spacer()
        }
        .frame(height: 60)
    }
}

#if DEBUG
struct ListRow_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            ListRow(model: RowData(id: UUID(), isEndIndex: false))
            ListRow(model: RowData(id: UUID(), isEndIndex: true))
        }
        .previewLayout(.fixed(width: 400, height: 60))
    }
}
#endif
