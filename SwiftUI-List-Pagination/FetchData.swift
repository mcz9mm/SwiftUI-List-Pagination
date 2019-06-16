//
//  FetchData.swift
//  SwiftUI-List-Pagination
//
//  Created by MataraiKaoru on 2019/06/16.
//  Copyright © 2019 MataraiKaoru. All rights reserved.
//

import SwiftUI
import Combine

func fetchData(page: Int, count: Int) -> AnyPublisher<([RowData]), RequestError> {

    AnyPublisher<([RowData]), RequestError> { subscriber in

        print("PAGE: \(page)")
        print("COUNT: \(count)")

        // fetch api data...
        // sample project is return mock data
        var models = [RowData]()
        for _ in 1...count {
            let model = RowData(id: UUID())
            models.append(model)
        }

        if models.isEmpty {
            subscriber.receive(completion: .failure(.loadFail))
        } else {

            // In the sample we are delaying purposely
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                _ = subscriber.receive(models)
                subscriber.receive(completion: .finished)
            }
        }
    }
}
