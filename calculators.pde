float ARC_POINT_FREQUENCY = 2;

float current_position_x;
float current_position_y;

boolean head_state = false;
//========================================================================================


void range_create_JSONArray(float start,float stop,float pace){
  JSONArray range = new JSONArray();
  try{
    int i = 0;
    if(stop>start){
      for(float x = start; x<stop; x+=pace){
        JSONObject val = new JSONObject();
        val.setInt("object_id",i);
        val.setFloat("range_val",x);
        range.setJSONObject(i,val);
        i++;
      }
    }
    if(stop<start){
      for(float x = start; x>stop; x+=pace){
        JSONObject val = new JSONObject();
        val.setInt("object_id",i);
        val.setFloat("range_val",x);
        range.setJSONObject(i,val);
        i++;
      }
    }
    saveJSONArray(range, "data/range.json");
  }
  catch(NegativeArraySizeException e){
    println("range: bana verdiğniz sayılarda bir hata var kardeşim!");
  }
}
//========================================================================================



float[] range(float start,float stop,float pace){
  float[] range_result;
  int n = ceil((stop-start)/pace);
  try{
    
    range_result = new float[n];
    int i=0;
    
    if(stop>start){
      for(float x = start;x < stop; x += pace){
        range_result[i] = x;
        i++;}
      }
    if(stop<start){    
      for(float x = start;x > stop; x += pace){
        range_result[i] = x;
        i++;}
      }
      
    return range_result;
  }
  catch(NegativeArraySizeException e){
    println("range: bana verdiğniz sayılarda bir hata var kardeşim!");
    return null;}

  //println(n);
}
//========================================================================================

void g0(float x, float y){
  
  current_position_x = x;
  current_position_y = y;
    
  JSONObject val = new JSONObject();
  
  val.setInt("object_id",object_id);
  val.setBoolean("head_state",head_state);
  val.setFloat("x",x);
  val.setFloat("y",y);

  coordinates.setJSONObject(object_id, val);
  object_id++;}

//========================================================================================

void g1(float x, float y){
  
  current_position_x = x;
  current_position_y = y;
    
  JSONObject val = new JSONObject();
  
  val.setInt("object_id",object_id);
  val.setBoolean("head_state",head_state);
  val.setFloat("x",x);
  val.setFloat("y",y);

  coordinates.setJSONObject(object_id, val);
  object_id++;}

//========================================================================================

void m3(){
  head_state = true;}

//========================================================================================

void m5(){
  head_state = false;}

//========================================================================================
 //<>//
void g2(float current_x,float current_y,float target_x,float target_y, float i,float j){
  //g2 = clockwise(cw)
  float r = sqrt(pow(i,2)+pow(j,2));
  
  float center_x = current_x + i;
  float center_y = current_y + j;
  
  float current_teta = degrees(atan2(current_y-center_y,current_x-center_x));
  float target_teta = degrees(atan2(target_y-center_y,target_x-center_x));
  
  if(target_teta < 0) target_teta += 360;
  if(current_teta < 0) current_teta += 360;
  
  if(target_teta > current_teta) target_teta -= 360; //yalnız cw için
  //if(target_teta < current_teta) current_teta -= 360; //yalnız ccw için
  
  range_create_JSONArray(current_teta, target_teta, -ARC_POINT_FREQUENCY);
  
  JSONArray range_JSONArray = loadJSONArray("data/range.json");
  
  for(int object_id_range = 0; object_id_range<range_JSONArray.size(); object_id_range++){
    
    JSONObject range_object = range_JSONArray.getJSONObject(object_id_range);
    float teta = range_object.getFloat("range_val");
    
    //range pace'i (-) olmalı
    float result_x = r*cos(radians(teta));
    float result_y = r*sin(radians(teta));
    
    JSONObject val = new JSONObject();
    
    val.setInt("object_id",object_id);
    val.setFloat("x",result_x + center_x);
    val.setFloat("y",result_y + center_y);
    
    coordinates.setJSONObject(object_id, val);
    object_id++;
    
    //println(result_x +" "+  result_y);
    //stroke(i);
    //i+=2;
    //point(result_x+current_x,result_y+current_y);
  }
  } //<>//

//========================================================================================  
  
void g3(float current_x,float current_y,float target_x,float target_y, float i,float j){
  //g3 = counter clockwise(ccw)
  float r = sqrt(pow(i,2)+pow(j,2));
  
  float center_x = current_x + i;
  float center_y = current_y + j;
  
  float current_teta = degrees(atan2(current_y-center_y,current_x-center_x));
  float target_teta = degrees(atan2(target_y-center_y,target_x-center_x));
  
  if(target_teta < 0) target_teta += 360;
  if(current_teta < 0) current_teta += 360;
  
  //if(target_teta > current_teta) target_teta -= 360; //yalnız cw için
  if(target_teta < current_teta) current_teta -= 360; //yalnız ccw için
  
  range_create_JSONArray(current_teta, target_teta, ARC_POINT_FREQUENCY);
  
  JSONArray range_JSONArray = loadJSONArray("data/range.json");
  
  for(int object_id_range = 0; object_id_range<range_JSONArray.size(); object_id_range++){
    
    JSONObject range_object = range_JSONArray.getJSONObject(object_id_range);
    float teta = range_object.getFloat("range_val");
    
    //range pace'i (-) olmalı
    float result_x = r*cos(radians(teta));
    float result_y = r*sin(radians(teta));
    
    JSONObject val = new JSONObject();
    
    val.setInt("object_id",object_id);
    val.setFloat("x",result_x + center_x);
    val.setFloat("y",result_y + center_y);
    
    coordinates.setJSONObject(object_id, val);
    object_id++;
    
    //println(result_x +" "+  result_y);
    //stroke(i);
    //i+=2;
    //point(result_x+current_x,result_y+current_y);
  }
  }
