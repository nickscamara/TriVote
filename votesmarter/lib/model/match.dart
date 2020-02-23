class Match{
  String name;
  String pcentage;
  String score;
  String opponent;
  String opponentScore;
  String date;
  String urImg;
  String opponentImg;

  Match({this.date, this.name,this.pcentage,this.score,this.opponent,this.opponentScore,this.urImg,this.opponentImg});


}
List<Match> matchLists = 

 [new Match(name: "Caleb",score: "300",pcentage: "100%",date: "February 25th, 2020",opponent: "Will",opponentScore: "240",urImg:  "assets/caleb.jpeg",
                                opponentImg: "assets/sawyer.jpeg"),
new Match(name: "Caleb",score: "250",pcentage: "99%",date: "February 27th, 2020",opponent: "Nick",opponentScore: "220",urImg:  "assets/caleb.jpeg",
                                opponentImg: "assets/nicolas.jpeg"),
new Match(name: "Caleb",score: "220",pcentage: "97%",date: "February 28th, 2020",opponent: "Jackie",opponentScore: "180",urImg:  "assets/caleb.jpeg",
                                opponentImg: "assets/img/roullete.png"),];




