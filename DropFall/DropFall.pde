//Drop Fall

Drop[] drops = new Drop[50];

void setup(){
  // Window initialization
  size(720, 720);
  frameRate(90);
  noFill();
  // Creating objects
  for(int i = 0; i < drops.length; i++){
   drops[i] = new Drop();
  }
}

void draw(){
  background(#003366); // #0A3040
  
  // Prints the drops on screen and update their state
  for(int i = 0; i < drops.length; i++){
    drops[i].show();
    drops[i].update();
  }
}
