//
//  MatchsListView.swift
//  The English Premier League
//
//  Created by Soliman Yousry on 08/12/2022.
//

import SwiftUI

struct MatchsListView: View {
    @ObservedObject private var viewModel  : MatchsListViewModel = HomeDIContainer.matchsListViewModel()
    @State private var isFavorite:Int = 0 
    
    init(){
            UISegmentedControl.appearance().selectedSegmentTintColor = .orange
        }
    var body: some View {
        VStack() {
            
            HStack(alignment: .top) {
                segmentedView()
            }
            
            Spacer()
            switch viewModel.state {
            case .Loading:
                ProgressView()
            case .showMatchesGroup(let matchesGroup):
                matchesGroupView(matchesGroup: matchesGroup)
            case .ShowFavorite(let matchesGroup):
                matchesGroupView(matchesGroup: matchesGroup)
            case .Failure(let error):
                Text(error)
            }
            Spacer()
                
        }.onAppear{
            viewModel.getMatches()
        }
        
    }
    
    
    private func segmentedView() -> some View{
        VStack{
            Picker("", selection: $isFavorite ) {
                Text(Strings.SegmentedView.all).tag(0)
                Text(Strings.SegmentedView.favorite).tag(1)
                }
            .pickerStyle(.segmented).padding(8).onChange(of: isFavorite) { newValue in
                viewModel.isFavorite.toggle()
            }
        }
        
    }
    
    
    private func matchesGroupView(matchesGroup:[MatchsGroup]) -> some View {
        List() {
            ForEach(matchesGroup, id: \.self) { group in
                Section(group.sectionTitle, content: {
                    ForEach(group.matches, id: \.self) { match in
                        MatchView(match: match)
                    }
                })
            }.listRowSeparator(.hidden)
            }.listStyle(.grouped).listRowSeparator(.hidden)
            .background(Color.clear)
    }
   
    
}

struct MatchsListView_Previews: PreviewProvider {
    static var previews: some View {
        MatchsListView()
    }
}
