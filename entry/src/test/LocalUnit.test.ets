import { describe, it, expect } from '@ohos/hypium';
import { Magic8Ball } from '../main/ets/entryability/Magic8Ball';

export default function localUnitTest() {
  describe('Magic8Ball', () => {
    it('draws only supplied answers', 0, () => {
      const answers: string[] = ['Yes', 'Maybe', 'No'];
      const ball: Magic8Ball<string> = new Magic8Ball<string>(answers);
      for (let index: number = 0; index < 100; index++) {
        expect(answers.includes(ball.drawAnAnswer())).assertTrue();
      }
    });

    it('includes first and last answers at random boundaries', 0, () => {
      const answers: string[] = ['Yes', 'Maybe', 'No'];
      const first: Magic8Ball<string> = new Magic8Ball<string>(answers, () => 0);
      const last: Magic8Ball<string> = new Magic8Ball<string>(answers, () => 0.999999);
      expect(first.drawAnAnswer()).assertEqual('Yes');
      expect(last.drawAnAnswer()).assertEqual('No');
    });

    it('rejects an empty answer set', 0, () => {
      expect(() => new Magic8Ball<string>([])).assertThrowError('Magic 8 Ball requires at least one answer');
    });
  });
}
