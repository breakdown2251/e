class txtline {
  
  char[] characters;
  int n = 0;
  int dim = 0;
  char[] result_chars;
  float[] result_integers;
  float g = 0;
  float m = 0;
  float x = 0;
  float y = 0;
  float z = 0;
  float i = 0;
  float j = 0;
  float f = 0;
  float t = 0;
  float s = 0;
  boolean has_g = false;
  boolean has_m = false;
  
  String result_number = "";
  
  txtline(char[] input){
    characters = input;
  
  }
  void update(){
    counter();
    updater();
    if(result_number != "") result_integers[dim-1] = float(result_number);
    assigner();
  }
  void counter(){
    for(char c: characters){
      if(c == '(')break;
      if(c >= 'A' && c <= 'z'){dim++;}
    }
    result_chars = new char[dim];
    result_integers = new float[dim];
  }
  void assigner(){
    for(int a = 0;a < dim; a++){
      switch(result_chars[a]){
        case'g':
        case'G':
          has_g = true;
          g = result_integers[a];
          break;
        case'm':
        case'M':
          has_m = true;
          m = result_integers[a];
          break;
        case'f':
        case'F':
          f = result_integers[a];
          break;
        case'x':
        case'X':
          x = result_integers[a];
          break;
        case'y':
        case'Y':
          y = result_integers[a];
          break;
        case'z':
        case'Z':
          z = result_integers[a];
          break;
        case'i':
        case'I':
          i = result_integers[a];
          break;
        case'j':
        case'J':
          j = result_integers[a];
          break;
        case't':
        case'T':
          t = result_integers[a];
          break;
        case's':
        case'S':
          s = result_integers[a];
          break;
      } 
    
    }
  }
  void updater(){
    
    for(char c : characters){
      
      
      boolean alpha = (c >= 'A' && c <= 'z');
      boolean space = c == ' ';
      boolean comment = c== '(';
      boolean digit=(c == '0'||
                     c == '1'||
                     c == '2'||
                     c == '3'||
                     c == '4'||
                     c == '5'||
                     c == '6'||
                     c == '7'||
                     c == '8'||
                     c == '9'||
                     c == '.'||
                     c == '-');
      if(comment) break;
      if(space) {
        if(result_number == "")continue;
        else {
          result_integers[n] = float(result_number);
          result_number = "";
          n++;
          }
      }
      if(alpha){
        result_chars[n] =  c;
      }
      if(digit)result_number += c;
    }
    
  }
}
