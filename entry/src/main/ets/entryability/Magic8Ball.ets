export class Magic8Ball {
  private answersArray = ["It is certain", "It is\ndecidedly so", "Without a doubt", "Yes, definitely", "You may\nrely on it",
    "As I see it,\nyes", "Most likely", "Outlook good", "Yes", "Signs point\nto yes", "Reply hazy,\ntry again", "Ask again later",
    "Better not\ntell you now", "Cannot\npredict now", "Concentrate\nand ask again", "Don’t count\non it", "My reply is no",
    "My sources\nsay no", "Outlook\nnot so good", "Very doubtful"]

  private random(edge: number) : number {
    let result = Math.floor(Math.random() * edge) ;
    return result;
  }

  drawAnAnswer(): string{
    return this.answersArray[this.random(this.answersArray.length)];
  }
}