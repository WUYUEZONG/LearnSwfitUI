//
//  Grid.swift
//  FoodPicker
//
//  Created by mntechMac on 2022/11/28.
//

import SwiftUI

struct GridA: View {
    var body: some View {
        Grid {
            GridRow {
                Color.pink.gridCellColumns(2)
                Grid {
                    Color.blue
                    Color.blue
                    Color.blue
                }
                
            }
            
            Grid {
                GridRow {
                    Color.pink
                    Color.pink
                    Grid {
                        GridRow {
                            Color.blue
                            Color.blue
                        }
                        
                        Color.blue
                        Color.blue
                    }.gridCellColumns(2)
                }
            }
            
            
            
        }
    }
}

struct GridA_Previews: PreviewProvider {
    static var previews: some View {
        GridA()
    }
}
