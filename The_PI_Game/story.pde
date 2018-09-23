StringList story;
// start from https://www.openprocessing.org/sketch/54577#
// text field STARWARS theme
float ang = PI/4;
PFont font;
float y0 = 200, y = y0;
float z = -200;
float x = 400;
float linesp = 50;

void story_setup(){
//chapter 1  
  story = new StringList();
  story.append("KLL_Play_here_And_now:");
  story.append("The PI Game");
  story.append(" ");
  story.append("A long Time Ago,");
  story.append("In a Galaxy far far away ");
  story.append(" ");
  story.append("Princess CoSinus wanted to");
  story.append("create a match stick Game");
  story.append("to honor her Papa,");
  story.append("the mighty Emperor");
  story.append("OverLord PI ");
//chapter 2
  story.append("she used a white sheet of paper");
  story.append("and draw parallel lines ");
  story.append("at a distance of 2 match stick");
//chapter 3
  story.append("so, how to play?");
  story.append(" ");
  story.append("use N match sticks,");
  story.append("hold them over the paper");
  story.append("and let them fall down on it");
  story.append(" ");
  story.append("now count how many of them");
  story.append("do cross a line");
  story.append(" ");
  story.append("repeat that often ");
  story.append("and average the results");
  story.append("PI is about sticks / hits ");

  story.append(" ");
  
  font = loadFont("Verdana-Bold-48.vlw");
  textFont(font, 40);
  textMode(MODEL);

}


//_________________________________________________________
void draw_chapter(int a, int b) {
  rotateX(ang);
  stroke(0);
  strokeWeight(5);
  directionalLight(250, 207, 63, 0, -200, -200);
  textAlign(CENTER); textFont(font, 40);
  line =  0; 
  for (int i=a; i <= b; i++) {
    text(story.get(i),x, y+line*linesp, z);
    line++;
  }
  
  y--;

}
