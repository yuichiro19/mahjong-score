window.addEventListener('load', () => {
    const userScoreInput = document.getElementById("user-score");
    const guest1ScoreInput = document.getElementById("guest1-score");
    const guest2ScoreInput = document.getElementById("guest2-score");
    const guest3ScoreInput = document.getElementById("guest3-score");
    const userRankInput = document.getElementById("user-rank");
    const guest1RankInput = document.getElementById("guest1-rank");
    const guest2RankInput = document.getElementById("guest2-rank");
    const guest3RankInput = document.getElementById("guest3-rank");
    function makeRanking(){
      const userInputValue = userScoreInput.value;
      const guest1Inputvalue = guest1ScoreInput.value;
      const guest2InputValue = guest2ScoreInput.value;
      const guest3InputValue = guest3ScoreInput.value;
      const scoreArray = [userInputValue, guest1Inputvalue, guest2InputValue, guest3InputValue];
      const sorted = scoreArray.slice().sort(function(a, b){return b -a});
      const ranks = scoreArray.slice().map(function(x){return sorted.indexOf(x) + 1});
      userRankInput.value = ranks[0];
      guest1RankInput.value = ranks[1];
      guest2RankInput.value = ranks[2];
      guest3RankInput.value = ranks[3];
    }
    userScoreInput.addEventListener("input", makeRanking)
    guest1ScoreInput.addEventListener("input", makeRanking)
    guest2ScoreInput.addEventListener("input", makeRanking)
    guest3ScoreInput.addEventListener("input", makeRanking)
  });