import { generateOne, generateRandom } from '../../src/index';

describe('Generate a Random', () => {
  it('should generate a random number excluding the upper bound', async () => {
    const rand = generateRandom(10);
    expect(rand).toBeLessThan(10);
  });
});

describe('Generate a 1', () => {
  it('should always return 1', async () => {
    const num = generateOne();
    expect(num).toBe(1);
  });
});
