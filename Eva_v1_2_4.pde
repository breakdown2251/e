/*

========================
-------Eva v1.2.4-------
========================

Eklenen/Değişen özellikler:

  +g2/g3 teki eksik current_position eklenerek tamamlandı
  +json array optimize edildi
  +looptaki düzen değişti
  +txtline fonksiyonundaki bug düzeltildi
  +range fonnksiyonundaki hata "range.json" eklenerek düzeltildi
  +Serial iletişim fonksiyonu düzeltildi
  
*/
  
//==========================
//port ayarları
import processing.serial.*;
Serial myport;
String portname = "COM4";
boolean serial_ready = false;
//==========================
//linelar için olan yarlar
txtline satir;
String[] okunan;
boolean foronce = false;
//===========================
//koordinat json ayarları
int object_id = 0;
JSONArray coordinates;
JSONArray saved_coordinates;
boolean json_saved = false;
//===========================


void setup(){
  selectInput("Select a file to process:", "fileSelect"); //<>//
  //size(900,500); //<>//
  //background(255);
  textAlign(CENTER,CENTER); //<>//
  }


//===========================
void draw(){
  
  //======================================================
  if(fileselected){
    coordinates = new JSONArray();
    for(String line: okunan){
      end_check(line);// son satır mı?
      
      char[] veri=line.toCharArray();
      satir = new txtline(veri);
      
      satir.update();
      
      command_gcode(satir.has_g, satir.has_m, satir.g, satir.m, satir.x, satir.y, satir.z, satir.i, satir.j, current_position_x, current_position_y);
      //DONE: bu kodun düzgün çalışması için command_gcode m3,m5,g0,g1 eklenmeli
      //TODO: bir sürü bug var
      println(" x:"+current_position_x+" y:"+current_position_y);
      }
    saveJSONArray(coordinates, "data/coordinates.json");
    println("save done");
    fileselected = false;
    json_saved = true;
    }
  //===================================================
  /*
  if(json_saved){
    saved_coordinates = loadJSONArray("data/coordinates.json");
    float last_x =0;
    float last_y =0;
    for(int i = 1; i < saved_coordinates.size(); i++){
      JSONObject val = saved_coordinates.getJSONObject(i);
      
      int sx = val.getInt("x");
      int sy = val.getInt("y");
      stroke(0);
      line(last_x*4,last_y*4,sx*4,sy*4);
      last_x = sx;
      last_y = sy;}} //<>//
   */   
  //===================================================
  if(json_saved){
    //saved_coordinates = loadJSONArray("data/coordinates.json"); //<>//
    myport = new Serial(this, portname, 9600);//serial port daha yeni açıldı //<>//
    serial_ready = true; //<>//
    json_saved = false; //<>//
  }
  //====================================================
  
  if(serial_ready){
    while(true){
      boolean available = myport.available()>0; //<>//
      reading(available); //<>//
      answer(veri); //<>//
    /*serial_read(myport.available()>0);
    boolean new_line_requested = request_check(serial_char);
    
    if(new_line_requested){
      
      JSONObject val = coordinates.getJSONObject(n);
      int serial_x = val.getInt("x");
      int serial_y = val.getInt("y");
      String answer = " x:"+serial_x+" y:"+serial_y;
      myport.write(answer);
      //TODO: Rei deki serial okuma fonksiyonu değişecek(çok sonra)
      //TODO: Rei durmadan değil sadece 1 kez request gönderecek. eğer işlemdeyse bir adet ? göndercek 
      //plotter(n,okunan[n]);//TODO: screen plotter dizaynı değişecek
      n++;
    }*/
  }}
  //=====================================================

}
