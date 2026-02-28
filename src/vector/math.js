export function dot(a, b) {
  let sum = 0;
  for (let i = 0; i < a.length; i += 1) {
    sum += a[i] * b[i];
  }
  return sum;
}

export function magnitude(v) {
  return Math.sqrt(dot(v, v));
}

export function cosineSimilarity(a, b) {
  if (!Array.isArray(a) || !Array.isArray(b) || a.length !== b.length || a.length === 0) {
    return 0;
  }

  const denominator = magnitude(a) * magnitude(b);
  if (denominator === 0) {
    return 0;
  }

  return dot(a, b) / denominator;
}
