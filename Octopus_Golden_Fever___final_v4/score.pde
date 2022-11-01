class HighScore
{
  String[] lines;
  String[] linesName;

  String typing = "";
  String saved = "";

  HighScore()
  {
    lines = loadStrings("highScore.txt");
    linesName = loadStrings("highScoreName.txt");
  }

  void update()
  {
    fill(255);
    text("Current score: " + score, 120, 220);
    text("Your name: ", 120, 240);
    text(typing, 220, 240);
    showScore();
  }

  void keyPressed()
  {   
    if (key == '\n' ) {
      saved = typing; 
      typing = ""; 
      if (parseInt(lines[lines.length-1]) < score)
      {
        lines[lines.length-1] = str(score);
        linesName[linesName.length-1] = saved;
        for (int i=lines.length-1; i>0; i--)
        {
          if (parseInt(lines[i]) > parseInt(lines[i-1]))
          {
            String setScoreLower = lines[i-1];
            String setScoreLowerName = linesName[i-1];
            lines[i-1] = lines[i];
            linesName[i-1] = linesName[i];
            lines[i] = setScoreLower;
            linesName[i] = setScoreLowerName;
          }
        }
      }
      saveStrings("highScore.txt", lines);
      saveStrings("highScoreName.txt", linesName);
      currentScreen = 0;
    } else {
      typing = typing + key;
    }
  }

  void showScore()
  {
    textSize(24);
    fill(255);
    text("***HIGH SCORE***", 150, 450);
    for (int i = 0; i < lines.length; i++)
    {
      text(lines[i], 120, 500 + 25*i);
      text(linesName[i], 220, 500 + 25*i);
    }
  }
}
