//
//  MatchView.swift
//  The English Premier League
//
//  Created by Soliman Yousry on 08/12/2022.
//

import SwiftUI
import Kingfisher

public struct MatchView: View {
    @ObservedObject private var viewModel  : MatchsListViewModel = HomeDIContainer.matchsListViewModel()
    private let match: Match?
    
    init(match: Match?) {
        self.match = match
    }
    
    public var body: some View {
        VStack(alignment:.listRowSeparatorTrailing) {
            
            VStack(alignment: .trailing) {
                Image(systemName: viewModel.isFavorite(match: match!) ? "star.fill" : "star")
                    .foregroundColor( viewModel.isFavorite(match: match!) ? .yellow : .black)
                    .padding(8)
                    .padding(.leading,5)
                    .font(.system(size: 15))
                    .onTapGesture {
                        guard let match = match else{
                            return
                        }
                        viewModel.toggleFav(item: match)
                    }
            }
            
            HStack(alignment: .center) {
                VStack(alignment: .center) {
                    imageView(imageURL: URL( string: match?.homeTeam?.crest ?? ""))
                        .frame(width: 70, height: 45)
                    Text(match?.homeTeam?.shortName ?? "")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                }.frame(minWidth: 0, maxWidth: .infinity)
                
                Spacer()
                
                if match?.status == .finished {
                        Text("\(match?.score ?? "")")
                            .font(.largeTitle)
                } else {
                    Spacer()
                    VStack {
                        Text("Time")
                            .font(.headline).padding(.bottom,8)
                        
                        Text(match?.time ?? "")
                            .font(.headline)
                    }
                    
                }
                
                Spacer()
                
                VStack(alignment: .center) {
                    imageView(imageURL: URL( string: match?.awayTeam?.crest ?? ""))
                        .frame(width: 70, height: 45)
                    
                    Text(match?.awayTeam?.shortName ?? "" )
                        .font(.title3)
                        .multilineTextAlignment(.center)
                }.frame(minWidth: 0, maxWidth: .infinity)
            }.padding(8)
        }.background(
            RoundedRectangle(cornerRadius:  5, style: .continuous)
                .fill(Color.white)
                .shadow(color: Color.black.opacity( 0.4), radius: 0.4)
            
        ).padding(8)
                
    }
    
    
    
}

private func imageView(imageURL: URL?) -> some View {
    KFImage.url(imageURL)
        .resizable()
        .background(.white)
        .frame(width: 40, height: 40)
        .clipShape(Circle())
}






struct MatchView_Previews: PreviewProvider {
    static var previews: some View {
        let match =  Match(id: 1, homeTeam: Area( id:nil,name: "mmm", shortName: "Afc", crest: "https://crests.football-data.org/354.png", tla: ""), awayTeam: Area( id:nil,name: "mmm", shortName: "Afc", crest: "https://crests.football-data.org/354.png", tla: ""), time: "12:12", status: .finished, score: "0  -  2", compareDate: "1")
        MatchView(match:match)
    }
}
