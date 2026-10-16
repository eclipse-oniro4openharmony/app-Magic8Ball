export class Magic8Ball<T> {
  private readonly answers: T[];
  private readonly randomValue: () => number;

  constructor(answers: T[], randomValue: () => number = () => Math.random()) {
    if (answers.length === 0) {
      throw new Error('Magic 8 Ball requires at least one answer');
    }
    this.answers = answers;
    this.randomValue = randomValue;
  }

  drawAnAnswer(): T {
    const index: number = Math.floor(this.randomValue() * this.answers.length);
    return this.answers[index];
  }
}
