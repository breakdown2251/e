char serial_char;
int n = 0;
char veri;

void serial_read(boolean available){
  if(available){
    serial_char = myport.readChar();
    }}
    
boolean request_check(char c){
  if(c == '*') return true;
  else return false;
}

void reading(boolean available){
  if(available) veri = myport.readChar();
}

void answer(char c){
  if(c =='*') send_data();
}

void send_data(){
  JSONObject val = coordinates.getJSONObject(n);
  int serial_x = val.getInt("x");
  int serial_y = val.getInt("y");
  String answer = " x:"+serial_x+" y:"+serial_y;
  myport.write(answer);
  n++;
}
