function generateRandom(upperBound: number): number {
  return Math.floor(Math.random() * upperBound);
}

function generateOne(): number {
  return 1;
}

export { generateRandom, generateOne };
