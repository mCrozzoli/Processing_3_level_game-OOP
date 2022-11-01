class Scene
{
  float backPosY = 0;

  int SceneWidth = 500;
  int SceneHeight = 800;

  String[] imageNamesLevel_1;
  PImage[] backgroundLevel_1;
  String[] imageNamesLevel_2;
  PImage[] backgroundLevel_2;
  String[] imageNamesLevel_3;
  PImage[] backgroundLevel_3;

  Scene()
  {
    String[] imageNamesLevel_1 = {"img11.png", "img12.png", "img13.png", "img14.png", "img15.png", "img16.png"};
    backgroundLevel_1 = new PImage[imageNamesLevel_1.length];
    for (int i=0; i < imageNamesLevel_1.length; i++) 
    {
      String imageName = imageNamesLevel_1[i];
      backgroundLevel_1[i] = loadImage(imageName);
    }

    String[] imageNamesLevel_2 = {"img21.png", "img22.png", "img23.png", "img24.png", "img25.png", "img26.png"};
    backgroundLevel_2 = new PImage[imageNamesLevel_2.length];
    for (int i=0; i < imageNamesLevel_2.length; i++) 
    {
      String imageName = imageNamesLevel_2[i];
      backgroundLevel_2[i] = loadImage(imageName);
    }

    String[] imageNamesLevel_3 = {"img31.png", "img32.png", "img33.png", "img34.png", "img35.png", "img36.png"};
    backgroundLevel_3 = new PImage[imageNamesLevel_3.length];
    for (int i=0; i < imageNamesLevel_3.length; i++) 
    {
      String imageName = imageNamesLevel_3[i];
      backgroundLevel_3[i] = loadImage(imageName);
    }
  }

  void display(int selector, float offsetX, int levelID)
  { 
    if (levelID == 0) {
      image(backgroundLevel_1[selector], round(offsetX), round(backPosY));
    } else if (levelID == 1) {
      image(backgroundLevel_2[selector], round(offsetX), round(backPosY));
    } else if (levelID == 2) {
      image(backgroundLevel_3[selector], round(offsetX), round(backPosY));
    }
  }
}
