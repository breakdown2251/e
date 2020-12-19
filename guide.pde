void command_gcode(boolean is_g,boolean is_m,float g,float m,float x,float y,float z,float i,float j,float current_x,float current_y){
  if(is_g){
    switch (int(g)){
      case 0:
        if(x==0 && y==0){break;}
        else g0(x, y);
        println("g0");        
        break;
        
      case 1:
        if(x==0 && y==0){break;}
        else g1(x, y);
        println("g1");
        break;
        
      case 2:
        println("g2");
        g2(current_x, current_y, x, y, i, j);
        break;
        
      case 3:
        println("g3");
        g3(current_x, current_y, x, y, i, j);
        break;
      } }
    
  if(is_m){
    switch (int(m)){
      case 3:
        println("laser on");
        m3();
        break;
        
      case 5:
        println("laser off");
        m5();
        break;
      
  }
}}
