import javax.swing.JOptionPane;                       // needed for askI()

float bx= width-70, by= height-20, bwx=70, bwy=20;                                  // operation button
float bx2=0,by2=0;                                                                  // parameter button

//_________________________________________________________
void draw_button(String buttonask) {
  bx= width-70; by= height-20; bwx=70; bwy=20;
  stroke(200,200,200); strokeWeight(2); fill(0,200,200);
  rect(bx,by,bwx,bwy);
  textAlign(CENTER); textFont(font, 14); fill(255,255,0);
  text(buttonask,bx+bwx/2,height-5);
}

//_________________________________________________________
void draw_parameter_button(String buttonask) {
  bx2= width-150; by2= height-20; bwx=70; bwy=20;
  stroke(200,200,200); strokeWeight(2); fill(0,200,200);
  rect(bx2,by2,bwx,bwy);
  textAlign(CENTER); textFont(font, 14); fill(255,255,0);
  text(buttonask,bx2+bwx/2,by2+14);
}

//_________________________________________________________________ 
void mouseReleased() {                                              
  if (mouseButton == LEFT)   {
     if (overRect(bx,by,bwx,bwy))  { 
        //println("click"); 
        if ( step == 5 ) {
            update_match_sticks();
          } else { step++; y = y0; }
        //print(" step "); println(step);
       }
     if ( step == 5 ) {
     if (overRect(bx2,by2,bwx,bwy))  {
       //println("new sticks");
       sticks = askI("sticks",sticks);
       init_matchsticks();
       play = 0; sumsticks=0; sumhits=0;
       } }
    }
  }

//_________________________________________________________________ mouse position over rectangle yes/no
boolean overRect(float x, float y, float width, float height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

// for button menu ask setpoint input
//_________________________________________________________________ askI  call: A = askI("A",A);
int askI(String ask,int I){
  println(" check for integer input window, might be hidden behind main window");
  String r = JOptionPane.showInputDialog(null, "new Setpoint for "+ask+" (now "+I+" )", "Input (INT)", JOptionPane.QUESTION_MESSAGE);
  if(r == null ){ print(" NULL "); r = str(I); }                           // handle CANCEL
  try { I = Integer.parseInt(r); } catch(NumberFormatException e) { println("you did not enter a int number!"); }
  println("new "+ask, I);
return I;
}
