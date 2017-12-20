import oscP5.*;
import netP5.*;

OscP5 sendVar1;
OscP5 sendVar2;
OscP5 sendVar3;
NetAddress pureData;

//import hypermedia.net.*;
//UDP udpPD;

int dirVar;
int colVar1r;
int colVar2g;
int colVar3b;
color fillVar;

void setup(){
  size (300, 300);
  noStroke();
  cursor(CROSS);
  rectMode(CORNERS);
  sendVar1 = new OscP5(this,9999);
  pureData = new NetAddress("127.0.0.1",6666);
  dirVar = 3;
  //colVar1r = 0;
  //colVar2g = 100;
  //colVar3b = 200;
  //background(125,125,125);
}

void draw() {
  fillVar = color(colVar1r,colVar2g,colVar3b);
  background (map (red(fillVar),0,255,255,0),map (green(fillVar),0,255,255,0),map (blue(fillVar),0,255,255,0), 40);
  if (dirVar == 0) {
      colVar1r = int(map(mouseX,0,width,0,255));
      colVar2g = int(map(mouseY,0,width,0,255));
      fill(0);
      rect(width*.25, 0, width*.75, height*.25);
      //break;
    //case '1':
  } else if (dirVar == 1) {
    //LEFT
      colVar1r = int(map(mouseY,0,width,0,255));
      colVar3b = int(map(mouseX,0,width,0,255));
      fill(0);
      rect(0, height*.25, width*.25, height*.75);
      //break;
    //case '2':
      } else if (dirVar == 2) {
    //RIGHT
      colVar2g = int(map(mouseX,0,width,0,255));
      colVar3b = int(map(mouseY,0,width,0,255));
      fill(0);
      rect(width*.75, height*.25, width, height*.75);
      //break;
    //case '3':
      } else {
        dirVar = 3;
    //DOWN  
      colVar1r = int(random(0,255));
      colVar2g = int(random(0,255));
      colVar3b = int(random(0,255));
      fill(0);
      rect(width*.25, height*.75, width*.75, height);
      //break;
  }
  fill(fillVar);
  rect(width*.25, height*.25, width*.75, height*.75);
  //println(colVar2g,dirVar,mouseX,mouseY,fillVar + ",r=" + red(fillVar) + ",g=" + green(fillVar) + ",b=" + blue(fillVar));
  sendVar1.send(new OscMessage("/pdR1send").add(red(fillVar)),pureData);
  sendVar1.send(new OscMessage("/pdG2send").add(green(fillVar)),pureData);
  sendVar1.send(new OscMessage("/pdB3send").add(blue(fillVar)),pureData);
  //OscMessage.send(new OscMessage("/pdR1send").add(red(fillVar)),pureData);
  //OscMessage.send(new OscMessage("/pdG2send").add(green(fillVar)),pureData);
  //OscMessage.send(new OscMessage("/pdB3send").add(blue(fillVar)),pureData);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      dirVar = 0;
    } else if (keyCode == LEFT) {
      dirVar = 1;
    } else if (keyCode == RIGHT) {
      dirVar = 2;
    } else if (keyCode == DOWN) {
      dirVar = 3;
  } else {
  }
  }
}