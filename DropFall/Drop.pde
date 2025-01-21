class Drop{
  // For position
  float x;
  float y;
  // To track radius and his max extension
  float minPossibleRadius = 50;
  float maxPossibleRadius = 400;
  float radius;
  float maxRadius;
  // To fix and track color and stroke thickness
  float baseDropColor = 192; //#80DDF2
  float baseDropWeight = 5;
  float dropColor;
  float dropWeight;
  
  // Drop constructor
  public Drop(){
    x = random(0, width);
    y = random(0, height);
    radius = 0;
    maxRadius = random(minPossibleRadius, maxPossibleRadius);
    dropColor = baseDropColor;
    dropWeight = baseDropWeight;
  }
  
  // Update the state of the drop increasing his radius and adjusting stroke and color based on radius
  public void update(){
    // Updating values(radius, stroke and color)
    radius += 1;
    dropWeight = map(radius, 0, maxRadius, baseDropWeight, 0);
    dropColor = map(radius, 0, maxRadius, 255, 0);
    // If the radius reach his max extension(chosen at drop instancing): reset and re-randomize the drop
    if(radius >= maxRadius){
      x = random(0, width);
      y = random(0, height);
      radius = 0;
      maxRadius = random(minPossibleRadius, maxPossibleRadius);
      dropColor = baseDropColor;
      dropWeight = baseDropWeight;
    }
  }
  
  // Shows the drop on screen
  public void show(){
    strokeWeight(dropWeight);
    stroke(baseDropColor, dropColor);
    circle(x, y, radius);
  }
}
