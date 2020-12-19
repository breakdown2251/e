String data_text;
String status_text;

void plotter(int number,String data){

  if(fileselected){
    if(END) {
      data_text = "no data";
      status_text = "text has ended";}
    else{
      data_text = data;
      status_text = "line:"+number+"|waiting request";
      }
  }
  
  if(!fileselected){
    data_text = "no data";
    status_text = "waiting file...";
  }
  textSize(16);
  text(data_text,300,100);
  text(status_text,300,200);
}

void output_check(){//manuel debug amaçlı fonksiyon
  if(!foronce) {
    println("n____g_____x_____y__");
    foronce = !foronce;}
  println(n,"|",satir.g,"|",satir.x,"|",satir.y);
}
