import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../model/footballmatch.dart';

class LineupColumn extends StatelessWidget {
  final Group team;

  LineupColumn(this.team);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          if (team.formation != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                  Container(
                  
                  height: 45,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: [
                      Text(
                        "T-shirt Color : ",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),


                         ...team.team!.map((Team team) {
            return                       FaIcon(FontAwesomeIcons.tshirt,color: Color(int.parse("0xff${team.colors!.player!.primary}")));

          }).toList(),
         

                     ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black54.withOpacity(0.8),
                  ),
                ),

                Container(
                  
                  height: 45,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Text(
                    team.formation!,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          Divider(),
          Container(
            height: 600,
            width: 600,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.network(
                    "https://i.pinimg.com/736x/52/a4/64/52a464bb04426e358c4eb31f54551a31.jpg"),
    
                Positioned(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 5,
                    runSpacing: 5,
                    direction: Axis.horizontal,
                    children: [
                      Wrap(
                         alignment: WrapAlignment.center,
                        direction: Axis.horizontal,
                        children: [
                          
                                   ...team.startXI!.map((StartXI player) {



                            return SizedBox(
                              
                              width: 120,
                              child: Column(
                                children: [

                                  CircleAvatar(
                                    
                            backgroundImage: NetworkImage(
                                "https://thumbs.dreamstime.com/b/avatar-man-soccer-player-graphic-sports-clothes-front-view-over-isolated-background-illustration-73244786.jpg"), //NetworkImage
                            radius: 30,
                            
                          ), //Circle


                                   Text(player.player!.name!,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
                    
                                    
              
                                ],
                              ),
                            );
          }).toList(),

                 

                         
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            
            title: Text(team.coach!.name!),
            subtitle: const Text('Coach'),
            leading: const CircleAvatar(
              child:        CircleAvatar(
                                    
                            backgroundImage: NetworkImage(
                                "https://thumbs.dreamstime.com/b/concept-businessman-football-manage-vector-design-manager-suit-his-open-hand-over-white-background-eps-42227867.jpg"), //NetworkImage
                            radius: 30,
                            
                          ),
              backgroundColor: Colors.white,
            ),
          ),
          const Divider(),
          const Text(
            'Main Team',
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
          ),
          ...team.startXI!.map((StartXI player) {
            return ListTile(
                             title: Text(player.player!.name!, style: TextStyle(color: Colors.white),textAlign: TextAlign.center,
              ),
              leading: const CircleAvatar(
                child:         CircleAvatar(
                                    
                            backgroundImage: NetworkImage(
                                "https://thumbs.dreamstime.com/b/avatar-man-soccer-player-graphic-sports-clothes-front-view-over-isolated-background-illustration-73244786.jpg"), //NetworkImage
                            radius: 30,
                            
                          ),
                // backgroundColor: getPosColor(player.pos),
              ),
              trailing: CircleAvatar(
                child: Text(
                  '${player.player!.number ?? ''}',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.amber,
              ),
            );
          }).toList(),
          Divider(),
          if (team.substitutes != null && team.substitutes!.length > 1)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Substitutes',
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
              ),
            ),
          if (team.substitutes != null && team.substitutes!.length > 1)
            ...team.substitutes!.map((StartXI player) {
              return ListTile(
                title: Text(player.player!.name!, style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
                leading: const CircleAvatar(
                  child:         CircleAvatar(
                                    
                            backgroundImage: NetworkImage(
                                "https://thumbs.dreamstime.com/b/avatar-man-soccer-player-graphic-sports-clothes-front-view-over-isolated-background-illustration-73244786.jpg"), //NetworkImage
                            radius: 30,
                            
                          ),
                 ),
                trailing: CircleAvatar(
                  child: Text(
                    '${player.player!.number ?? ''}',
                    style: TextStyle(color: Colors.amber),
                  ),
                  backgroundColor: Colors.white,
                ),
              );
            }).toList()
        ],
      ),
    );
  }
}
