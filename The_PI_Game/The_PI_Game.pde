// KLL engineering sep.2018 on win7 / processing 3.4

// https://en.wikipedia.org/wiki/Buffon%27s_needle
// https://www.youtube.com/watch?v=sJVivjuMfWA
// https://mste.illinois.edu/activity/buffon/

// so if PI = 2 l n / t h  and t = 2 l then PI = n / h ( sticks / hits )

// play ground
float match_stick_length = 50.0; 
float [] linesY = {0,0,0,0,0,0};
int line = 0, step = 1;

int play = 0, hits = 0;
float sumsticks = 0.0, sumhits = 0.0, now = 0.0, avg = 0.0;

class match_stick {
  float x1,y1,x2,y2,rot;
  boolean hit;
  match_stick (float tx1, float ty1, float tx2, float ty2, float trot, boolean thit) 
             {  x1 = tx1; y1 = ty1;  x2 = tx2;  y2 = ty2;  rot = trot; hit = thit; }
  void display() {
   if ( hit ) { stroke(255,0,0); } else { stroke(100,100,100); }            // if cross line use RED
   strokeWeight(6);
   line(x1,y1,x2,y2);
   }
}

match_stick[] match_sticks;
int sticks = 22;                                                            // 22/7 = 3.14.. // 355/113 = 3.141592..

//_________________________________________________________
void init_matchsticks() { 
 match_sticks = new match_stick[sticks];

 for (int i = 0; i < sticks; i = i+1) {   match_sticks[i] = new match_stick(0,0,0,0,0,false); } 
 for (int i = 0; i < 6; i = i+1)      {   linesY[i] = i * match_stick_length * 2.0 ;  }
}

//_________________________________________________________
void update_match_sticks() {
  play++;
  for (int i = 0; i < sticks; i = i+1) { 
    match_sticks[i].x1  = random(match_stick_length+20,width-match_stick_length-20);
    match_sticks[i].y1  = random(match_stick_length+20,height-match_stick_length-20);
    match_sticks[i].rot = random(TWO_PI);
    match_sticks[i].x2  = match_sticks[i].x1 + match_stick_length * sin(match_sticks[i].rot);
    match_sticks[i].y2  = match_sticks[i].y1 + match_stick_length * cos(match_sticks[i].rot);
    match_sticks[i].hit = false; 
    
    for (int k = 1; k < 6; k = k+1) {
      if ((match_sticks[i].y1 > match_sticks[i].y2) && (match_sticks[i].y2 <= linesY[k]) && (match_sticks[i].y1 >= linesY[k])) { match_sticks[i].hit = true; } 
      if ((match_sticks[i].y1 < match_sticks[i].y2) && (match_sticks[i].y1 <= linesY[k]) && (match_sticks[i].y2 >= linesY[k])) { match_sticks[i].hit = true; } 
      }
   }
   hits = 0;
   for (int i = 0; i < sticks; i = i+1) {  if (match_sticks[i].hit) { hits++; } }
   if (hits > 0 ) { 
     now = float(sticks)/float(hits);
     sumhits += hits;
     sumsticks += sticks;
     avg = sumsticks/sumhits; 
    }
}

//_________________________________________________________
void draw_plane(boolean dofill) {
  stroke(255,255,255); strokeWeight(2);  
  if(dofill) {fill(255,255,255);} else { noFill(); }
  rect(20,20, width-40,height-40);
  stroke(100,100,0); strokeWeight(2);
  for (int i = 1; i < 6; i = i+1) { line(30,linesY[i],width-30,linesY[i]); }
}


//_________________________________________________________
void show_test_sticks() {
   float x1,x2,y1,y2;
   stroke(100,100,100);
   strokeWeight(6);
   for (int i = 1; i < 5; i = i+1) {
      x1 = 40+i*10; y1 = linesY[i]; x2 = 40+i*10; y2 = linesY[i]+match_stick_length;
      line(x1,y1,x2,y2);  
      x1 = 45+i*10; y1 = linesY[i]+match_stick_length; x2 = 45+i*10; y2 = linesY[i+1];
      line(x1,y1,x2,y2);  
   }
}

//_________________________________________________________
void show_match_sticks() {
  textAlign(LEFT);
  for (int i = 0; i < sticks; i = i+1) {  match_sticks[i].display(); }
  text(" throw: ",10,height-7); text(play,   70,height-7);
  text(" hits: ",110,height-7); text(hits,  150,height-7);
  text(" of ",   180,height-7); text(sticks,210,height-7);
  text(" this ", 240,height-7); text(now,   280,height-7);
  text(" avg: " ,340,height-7); text(avg,   390,height-7);

}

//_________________________________________________________ SETUP
void setup() {
  size(800, 600, P3D);
  story_setup();
  init_matchsticks();
}


//_________________________________________________________ DRAW
void draw() {
  background(0,0,80);
  draw_button("next");
  if ( step == 5 ) { draw_parameter_button("sticks"); }
  
  if ( step == 1 ) { draw_chapter(0,10);  }
  if ( step == 2 ) { draw_chapter(11,13);  }
  if ( step == 3 ) { draw_plane(true); show_test_sticks(); }
  if ( step == 4 ) { draw_plane(false); draw_chapter(14,25);  } 
  if ( step == 5 ) { draw_plane(true); if (play > 0) { show_match_sticks(); } } 
}
