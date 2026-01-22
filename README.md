import SwiftUI

struct Creature {
    var sdmg : Int
    var bdmg : Int
    var def : Int
    var health : Int
    var speed : Int
}



var tempUp = 0


struct ContentView: View {
    
    @State var animals = ["Dragon", "Werewolf", "Phoenix", "Rabbit"]    
    @State var earSelected = ""
    @State var headSelected = ""
    @State var armSelected = ""
    @State var bodySelected = ""
    @State var legSelected = ""

    @State var player: Creature 
    
    func setEars() {
        if earSelected == "Dragon" {
            tempUp = 1
        } else if earSelected == "Werewolf" {
            tempUp = 2
        } else if earSelected == "Phoenix" {
            tempUp = 3
        } else if earSelected == "Rabbit" {
            tempUp = 4
        }
    }
    
    var body: some View {
        HStack {
        VStack {
            //EARS
            HStack {
                VStack {
                    Picker("Please choose a color", selection: $earSelected) {
                        ForEach(animals, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.palette)
                    .frame(maxWidth: 500)
                    Text("\(earSelected)")
                }
             
            }
            //HEAD
            HStack {
                VStack {
                    Picker("Please choose a color", selection: $headSelected) {
                        ForEach(animals, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.palette)
                    .frame(maxWidth: 500)
                    Text("\(headSelected)")
                }
                
            }
            //ARMS
            HStack {
                Button(action: {
                    player.bdmg = 10
                }, label: {
                        Text("Dragon Arms")
                            .frame(width: 100, height: 100)
                            .background(.black)
                    })
                Button(action: {
                    player.bdmg = 13
                }, label: {
                    Text("Werewolf Arms")
                        .frame(width: 100, height: 100)
                        .background(.black)
                })
                Button(action: {
                    player.bdmg = 17
                }, label: {
                    Text("Phoenix Arms")
                        .frame(width: 100, height: 100)
                        .background(.black)
                })
                Button(action: {
                    player.bdmg = 15
                }, label: {
                    Text("Rabbit Arms")
                        .frame(width: 100, height: 100)
                        .background(.black)
                })
            }
            //BODY
            HStack {
                Button(action: {
                    player.def = 10
                }, label: {
                    Text("Dragon Body")
                        .frame(width: 100, height: 100)
                        .background(.black)
                })
                Button(action: {
                    player.def = 13
                }, label: {
                    Text("Werewolf Body")
                        .frame(width: 100, height: 100)
                        .background(.black)
                })
                Button(action: {
                    player.def = 17
                }, label: {
                    Text("Phoenix Body")
                        .frame(width: 100, height: 100)
                        .background(.black)
                })
                Button(action: {
                    player.def = 15
                }, label: {
                    Text("Rabbit Body")
                        .frame(width: 100, height: 100)
                        .background(.black)
                })
            }
            //LEGS
            HStack {
                Button(action: {
                    player.sdmg = 15
                }, label: {
                    Text("Dragon Legs")
                        .frame(width: 100, height: 100)
                        .background(.black)
                })
                Button(action: {
                    player.sdmg = 20
                }, label: {
                    Text("Werewolf Legs")
                        .frame(width: 100, height: 100)
                        .background(.black)
                })
                Button(action: {
                    player.sdmg = 10
                }, label: {
                    Text("Phoenix Legs")
                        .frame(width: 100, height: 100)
                        .background(.black)
                })
                Button(action: {
                    player.sdmg = 13
                }, label: {
                    Text("Rabbit Legs")
                        .frame(width: 100, height: 100)
                        .background(.black)
                })
            }
            
            HStack {
               
            }
        }
            VStack {
                Image("squirrel")
                Text("Basic damage: \(player.bdmg)\nSpecial Damage: \(player.sdmg)\nDefense: \(player.def)\nHealth: \(player.health)\nSpeed: \(player.speed)")
                    .frame(width: 200)
            }
        }
        
        Button(action: {
            if tempUp == 1 {
                player.sdmg += 5
            } else if tempUp == 2 {
                player.bdmg += 5
            } else if tempUp == 3 {
                player.health += 5
            } else if tempUp == 4 {
                player.speed += 5
            }
            tempUp = 0
            setEars()
            earSelected = ""
        }, label: {
            Text("Go!")
        })
        
    }
}



