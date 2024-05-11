import processing.serial.*;
import processing.sound.*;

SoundFile etapa1;
SoundFile etapa2;
Serial myPort;
int queSonido=0;
String etapaUno= "UNO";
int etapa=0;
int contador=0;
void setup() {
  etapa1= new SoundFile(this, "etapa2.wav");
  etapa2= new SoundFile(this, "etapa1.wav");
  myPort = new Serial(this, Serial.list()[0], 9600);

}

void draw() {
    while (myPort.available() > 0) { // Mientras haya datos disponibles en el puerto serial
    String mensaje = myPort.readStringUntil('\n'); // Lee el mensaje enviado por Arduino
    if (mensaje != null) {
      mensaje = mensaje.trim(); // Elimina espacios en blanco adicionales
      etapa = int(mensaje); // Convierte el mensaje a un entero
      println("Valor recibido: " + etapa);
    }
  }

  if (etapa==1 && !etapa1.isPlaying()) {
    etapa1.play();
  }
  if (etapa==2 && !etapa2.isPlaying()) {
    contador++;
    etapa2.play();
        etapa1.stop();
    
  }
  


}
