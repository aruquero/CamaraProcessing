import processing.video.*;

Capture cam;
int aux;
int value;
PFont f; 
void setup() { 
  size(640, 480);
  cam = new Capture(this, 640, 480);
  cam.start();
  aux = 1;
  value = 0;
  f = createFont("Arial",16,true);
}

void draw() {
  if(value == 0){
    background(255);
    textFont(f);
    fill(0);
    text("Pulsa la tecla 'Enter' para empezar",width/2-180,200);
    text("Pulsa la tecla 'espacio' para dibujar 4 cámaras simultaneas", width/2-180, 230);
    text("Pulsa las flechas del teclado para cambiar la vista de la cámara", width/2-180, 260);
    text("Pulsa el click del ratón para poder mover la cámara libremente", width/2-180,290);
  }else{
    tint(256,256,256);
    background(0);
    if (cam.available() == true) {
      cam.read();
    }
    if(aux < 0){
      image(cam, mouseX, mouseY, width/2, height/2); 
    }else{
      if(aux==0){
        image(cam, 0, 0);
      }
      if(aux==1){
        scale(-1,1);
        image(cam,-width,0);
      }
      if(aux == 3){
        scale(-1,-1);
        image(cam,-width,-height);
      }
      if(aux == 2){
  
        tint(256,0,0);
        image(cam,0,0,width/2,height/2);
  
        tint(0,256,0);
        image(cam,width/2,0,width/2,height/2);
  
        tint(0,0,256);
        image(cam,0,height/2,width/2,height/2);
  
        tint(256,0,256);
        image(cam,width/2,height/2,width/2,height/2);
      }
    }
  }
}

void mousePressed(){
  aux*=-1;
}
void keyPressed(){
  if(key == ' '){
    aux = 2;
  }
  if(keyCode == LEFT){
    aux = 1;
  }
  if(keyCode == RIGHT){
    aux = 0;
  }
  if(keyCode == UP){
    aux = 3;
  }
  if(keyCode == DOWN){
    aux = 0;
  }
  if(keyCode == ENTER){
    value = 1;
  }
}
