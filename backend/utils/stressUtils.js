// NOTE: 스트레스 수준 판별 함수
const getStressLevel = (frequencyRatio) => {
  if (
    (frequencyRatio >= 0.3 && frequencyRatio <= 0.4) ||
    (frequencyRatio >= 0.6 && frequencyRatio <= 0.7)
  ) {
    return "initial_stress";
  } else if (frequencyRatio > 0.4 && frequencyRatio < 0.6) {
    return "normal";
  } else {
    return "high_stress";
  }
};

module.exports = { getStressLevel };
