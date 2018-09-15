forma trompo;
forma balero;
forma yoyo;
forma control;
forma iPhone;

int pantalla = 1;
int select = 1;
int ataqueUno, vidaUno, jugadorUno;
int ataqueDos, vidaDos, jugadorDos;
int turno = 1;
int jugadorGanador, personajeGanador;
int barraUno = 300, barraDos = 300;
int v1,v2;
PFont fuente, fuenteDos;
String texto;

void setup()
{
  size(1000, 600);
  trompo = new forma(90, 230, 0.5, 8, 45);
  balero = new forma(650, 230, 0.4, 5, 44);
  yoyo = new forma(90, 610, 0.5, 9, 56);
  control = new forma(885, 400, 0.7, 10, 54);
  iPhone = new forma(1300, 150, 0.5, 8, 47);
}

void draw()
{
  if(pantalla == 1)
  {
    pantallaUno();
  }
  if(pantalla == 2)
  {
    pantallaDos();
  }
  if(pantalla == 3)
  {
    pantallaTres();
    barra();
  }
  if(pantalla == 4)
  {
    pantallaCuatro();
  }
}

void pantallaUno()
{
  color from = color(228, 0, 124);
  color to = color(61, 61, 155);
  color interA = lerpColor(from, to, .33); //33
  color interB = lerpColor(from, to, .66); //66
  noStroke();
  rectMode(CENTER);
  fill(from);
  rect(125, 300, 250, 600);
  fill(interA);
  rect(375, 300, 250, 600);
  fill(interB);
  rect(625, 300, 250, 600);
  fill(to);
  rect(875, 300, 250, 600);
  
  //Título
  textAlign(CENTER);
  fuente = createFont("MexicanTequila.ttf", 80);
  fill(#ffffff);
  textFont(fuente);
  text("Madrazos mexicanos", width/2, height/3);

  //Descripción
  textAlign(CENTER);
  fuenteDos = createFont("ferrum.otf", 25);
  fill(255);
  textSize(20);
  textFont(fuenteDos);
  text("Mientras la sociedad mexicana se envuelve de tecnologia, las personas se olvidan de sus viejos juguetes... es hora de la batalla definitiva.", width/2, 3*height/5, 2*width/3, height/2);
 
  //Botón
  noStroke();
  fill(100, 40, 78);
  rectMode(CENTER);
  rect(width/2, 8*height/9 - 5, 280, 50, 50);
  
  //Descripción del botón
  texto = "Picale a la tecla A pa'luchar";
  fill(255);
  textSize(20);
  textAlign(CENTER);
  text(texto, width/2, 8*height/9);
  
  //Transición de Pantalla Uno a Pantalla Dos
  if(keyPressed && (key == 'a' || key == 'A'))
  {
    pantalla = 2;
    keyCode = 0;
  }
}//Final de Pantalla Uno

void pantallaDos()
{
  displayOne();
  if(select == 1)
  {
    trompo.trompo_();
    balero.balero_();
    yoyo.yoyo_();
    control.control_();
    iPhone.iPhone_();
    decisionOne();
  }
  if(select == 2)
  {
    displayTwo();
    decisionTwo();
  }
  v1 = vidaUno;
  v2 = vidaDos;
}//Final de Pantalla Dos

void displayOne()
{
  color from = color(0, 104, 71);
  color to = color(0,40,104);
  color interA = lerpColor(from, to, .33); //33
  color interB = lerpColor(from, to, .66); //66
  noStroke();
  rectMode(CENTER);
  fill(from);
  rect(125, 300, 250, 600);
  fill(interA);
  rect(375, 300, 250, 600);
  fill(interB);
  rect(625, 300, 250, 600);
  fill(to);
  rect(875, 300, 250, 600);
  
  noStroke();
  fill(130, 130, 130);
  rect(150, 285, 180, 25, 15);
  rect(340, 285, 190, 25, 15);
  rect(150, 505, 190, 25, 15);
  rect(750, 545, 250, 25, 15);
  rect(750, 315, 200, 25, 15);
  
  //Nombre
  textAlign(CENTER);
  fill(0);
  textSize(18);
  text("Juan el Trompo [Tecla Q]", 150, 290);
  text("Francisco el Balero [Tecla W]", 340, 290);
  text("Pedro el Yo-yo [Tecla E]", 150, 510);
  text("Connor the SNES Controller [Tecla U]", 750, 550);
  text("James the iPhone X [Tecla I]", 750, 320);
  
  //Botón de equipo dos
  noStroke();
  fill(130, 130, 130);
  rect(900, 75, 80, 30, 15);
  
  //Texto de equipo dos
  textAlign(CENTER);
  fill(0);
  textSize(20);
  text("The Dudes", 900, 80);
  
  //Botón de equipo
  noStroke();
  fill(130, 130, 130);
  rect(200, 75, 80, 30, 15);
  
  //Texto de equipo
  textAlign(CENTER);
  fill(0);
  textSize(20);
  text("Los chidos", 200, 80);

  //Botón de selección
  noStroke();
  fill(130, 130, 130);
  rect(500, 20, 500, 50, 15);
  
  //Texto de selección
  textAlign(CENTER);
  fill(0);
  textSize(25);
  text("Jugador 1: Teclea un personaje de cualquier equipo", 500, 30);
  
}

void displayTwo()
{
  color from = color(0, 104, 71);
  color to = color(0,40,104);
  color interA = lerpColor(from, to, .33); //33
  color interB = lerpColor(from, to, .66); //66
  noStroke();
  rectMode(CENTER);
  fill(from);
  rect(125, 300, 250, 600);
  fill(interA);
  rect(375, 300, 250, 600);
  fill(interB);
  rect(625, 300, 250, 600);
  fill(to);
  rect(875, 300, 250, 600);

  //Botón de selección
  noStroke();
  fill(130, 130, 130);
  rect(500, 20, 500, 50);
  
  //Texto de selección
  textAlign(CENTER);
  fill(0);
  textSize(20);
  text("Jugador 2: Selecciona un personaje del equipo restante", 500, 30);
}

void decisionOne()
{
  if(keyPressed && (key == 'Q' || key == 'q'))//Trompo
  {
    jugadorUno = 1;
    ataqueUno = trompo.ataque;
    vidaUno = trompo.vida;
    select = 2;
    keyCode = 0;
  }
  
  if(keyPressed && (key == 'W' || key == 'w'))//Balero
  {
    jugadorUno = 2;
    ataqueUno = trompo.ataque;
    vidaUno = trompo.vida;
    select = 2;
    keyCode = 0;
  }
  
  if(keyPressed && (key == 'E' || key == 'e'))//Yoyo
  {
    jugadorUno = 3;
    ataqueUno = yoyo.ataque;
    vidaUno = yoyo.vida;
    select = 2;
    keyCode = 0;
  }
  
  if(keyPressed && (key == 'U' || key == 'u')) //Control
  {
    jugadorUno = 4;
    ataqueUno = control.ataque;
    vidaUno = control.vida;
    select = 2;
    keyCode = 0;
  }
  
  if(keyPressed && (key == 'I' || key == 'i')) //iPhone
  {
    jugadorUno = 5;
    ataqueUno = iPhone.ataque;
    vidaUno = iPhone.vida;
    select = 2;
    keyCode = 0;
  }
}//End

void decisionTwo()
{
  if(jugadorUno != 1 && jugadorUno != 2 && jugadorUno != 3)
  {
    trompo.trompo_();
    balero.balero_();
    yoyo.yoyo_();
    
    noStroke();
    fill(130, 130, 130);
    rect(150, 285, 180, 25, 15);
    rect(340, 285, 190, 25, 15);
    rect(150, 505, 190, 25, 15);
  
    //Botón de equipo
    noStroke();
    fill(130, 130, 130);
    rect(200, 75, 80, 30);
  
    //Texto de equipo
    textAlign(CENTER);
    fill(0);
    textSize(18);
    text("Los chidos", 200, 80);
    text("Juan el Trompo [Tecla Q]", 150, 290);
    text("Francisco el Balero [Tecla W]", 340, 290);
    text("Pedro el Yo-yo [Tecla E]", 150, 510);
    
  if(keyPressed && (key == 'Q' || key == 'q')) //Trompo
  {
    jugadorDos = 1;
    ataqueDos = trompo.ataque;
    vidaDos = trompo.vida;
    pantalla = 3;
    keyCode = 0;
  }
  
  if(keyPressed && (key == 'W' || key == 'w')) //Balero
  {
    jugadorDos = 2;
    ataqueDos = balero.ataque;
    vidaDos = balero.vida;
    pantalla = 3;
    keyCode = 0;
  }
  
  if(keyPressed && (key == 'E' || key == 'e')) //Yoyo
  {
    jugadorDos = 3;
    ataqueDos = yoyo.ataque;
    vidaDos = yoyo.vida;
    pantalla = 3;
    keyCode = 0;
  }
 }//Final de if
 
 if(jugadorUno != 4 && jugadorUno != 5)
 {
   control.control_();
   iPhone.iPhone_();
   
   noStroke();
   fill(130, 130, 130);
   rect(750, 545, 270, 25, 15);
   rect(750, 315, 220, 25, 15);
   
   //Botón de equipo dos
   noStroke();
   fill(130, 130, 130);
   rect(900, 75, 80, 30);
  
   //Texto de equipo dos
   textAlign(CENTER);
   fill(0);
   textSize(18);
   text("The Dudes", 900, 80);
   text("Connor the SNES Controller [Tecla U]", 750, 550);
   text("James the iPhone X [Tecla I]", 750, 320);
   
  if(keyPressed && (key == 'U' || key == 'u')) //Control
  {
    jugadorDos = 4;
    ataqueDos = control.ataque;
    vidaDos = control.vida;
    pantalla = 3;
    keyCode = 0;
  }
  
  if(keyPressed && (key == 'I' || key == 'i')) //iPhone
  {
    jugadorDos = 5;
    ataqueDos = iPhone.ataque;
    vidaDos = iPhone.vida;
    pantalla = 3;
    keyCode = 0;
  }
 }//Final de if
 keyPressed = false;
}//End

void pantallaTres()
{
  color from = color(143, 70, 32);
  color to = color(130, 0, 0);
  color interA = lerpColor(from, to, .33); //33
  color interB = lerpColor(from, to, .66); //66
  noStroke();
  rectMode(CENTER);
  fill(from);
  rect(125, 300, 250, 600);
  fill(interA);
  rect(375, 300, 250, 600);
  fill(interB);
  rect(625, 300, 250, 600);
  fill(to);
  rect(875, 300, 250, 600);
  
  noStroke();
  fill(130, 130, 130);
  rectMode(CENTER);
  rect(500, 470, 100, 100, 10);
  
  //VS.
  fill(#000000);
  textSize(80);
  text("VS.", 505, 500);
  textSize(25);
  
    barra();
    
  if(turno == 1)
  {
    noStroke();
    fill(130, 130, 130);
    rect(500, 20, 500, 50, 15);
    
    fill(0);
    text("Jugador 1: Revienta la tecla A para atacar", 500, 30);
    if(keyPressed && (key == 'A' || key == 'a'))
    {
     
      keyCode=0;
      if(vidaDos > 0)
      {
        vidaDos = vidaDos - ataqueUno;
        barraDos = (vidaDos*300)/v2;
        turno = 2;
      }
      else
      {
        barraDos = 0;
        personajeGanador = jugadorUno;
        jugadorGanador = 1;
        pantalla = 4; 
      }//Final de Else
      
    }//Final
    
  }//Final de Turno Uno
  
    barra();
    
  if(turno == 2)
  {
    noStroke();
    fill(130, 130, 130);
    rect(500, 20, 500, 50, 15);
    
    fill(0);
    text("Jugador 2: Aprieta la tecla L para contraatacar", 500, 30);
    if(keyPressed && (key == 'L' || key == 'l'))
    {
      
      if(vidaUno > 0)
      {
      vidaUno = vidaUno - ataqueDos;
      turno = 1;
      barraUno = (vidaUno*300)/v1;
      
      }
    //Final
    else
    {
      barraUno = 0;
      personajeGanador = jugadorDos;
      jugadorGanador = 2;
      pantalla = 4;
    }//Final de Else
    }
    keyPressed = false;
    keyCode = 0;
  }//Final de Turno Dos
  
  //Jugador Uno
  if(jugadorUno == 1)
  {
    trompo.escala = 1;
    trompo.x = 50;
    trompo.y = 100;
    noStroke();
    fill(130, 130, 130);
    rect(250, 490, 190, 30, 15);
    fill(#000000);
    text("Juan el Trompo", 250, 500);
    trompo.trompo_();
  }
  if(jugadorUno == 2)
  {
    balero.escala = 0.8;
    balero.x = 100;
    balero.y = 100;
    rectMode(CENTER);
    noStroke();
    fill(130, 130, 130);
    rect(240, 490, 200, 30, 15);
    fill(#000000);
    text("Francisco el Balero", 240, 500);
    balero.balero_();
  }
  if(jugadorUno == 3)
  {
    yoyo.escala = 0.8;
    yoyo.x = 100;
    yoyo.y = 100;
    noStroke();
    fill(130, 130, 130);
    rect(240, 490, 190, 30);
    fill(#000000);
    text("Pedro el Yo-yo", 240, 500);
    yoyo.yoyo_();
  }
  if(jugadorUno == 4)
  {
    control.escala = 0.8;
    control.x = 100;
    control.y = 100;
    noStroke();
    fill(130, 130, 130);
    rect(240, 490, 260, 30);
    fill(#000000);
    text("Connor the SNES Controller", 240, 500);
    control.control_();
  }
  if(jugadorUno == 5)
  {
    iPhone.escala = 0.8;
    iPhone.x = 100;
    iPhone.y = 100;
    noStroke();
    fill(130, 130, 130);
    rect(240, 490, 190, 30);
    fill(#000000);
    text("James the iPhone X", 240, 500);
    iPhone.iPhone_();
  }
  
  //Jugador Dos
  if(jugadorDos == 1)
  {
    trompo.escala = 1;
    trompo.x = 550;
    trompo.y = 120;
    noStroke();
    fill(130, 130, 130);
    rect(750, 490, 190, 30);
    fill(#000000);
    text("Juan el Trompo", 750, 500);
    trompo.trompo_();
  }
  if(jugadorDos == 2)
  {
    balero.escala = 0.8;
    balero.x = 750;
    balero.y = 120;
    noStroke();
    fill(130, 130, 130);
    rect(750, 490, 200, 30);
    fill(#000000);
    text("Francisco el Balero", 750, 500);
    balero.balero_();
  }
  if(jugadorDos == 3)
  {
    yoyo.escala = 0.8;
    yoyo.x = 740;
    yoyo.y = 120;
    noStroke();
    fill(130, 130, 130);
    rect(750, 490, 200, 30);
    fill(#000000);
    text("Francisco el Balero", 750, 500);
    yoyo.yoyo_();
  }
  if(jugadorDos == 4)
  {
    control.escala = 0.8;
    control.x = 740;
    control.y = 120;
    noStroke();
    fill(130, 130, 130);
    rect(750, 490, 260, 30);
    fill(#000000);
    text("Connor the SNES Controller", 750, 500);
    control.control_();
  }
  if(jugadorDos == 5)
  {
    iPhone.escala = 0.8;
    iPhone.x = 740;
    iPhone.y = 120;
    noStroke();
    fill(130, 130, 130);
    rect(750, 490, 200, 30);
    fill(#000000);
    text("James the iPhone X", 750, 500);
    iPhone.iPhone_();
  }
}//Final de Pantalla Tres

void pantallaCuatro()
{ 
  color from = color(48, 194, 220); 
  color to = color(0, 104, 71);
  color interA = lerpColor(from, to, .33); //33
  color interB = lerpColor(from, to, .66); //66
  noStroke();
  rectMode(CENTER);
  fill(from);
  rect(125, 300, 250, 600);
  fill(interA);
  rect(375, 300, 250, 600);
  fill(interB);
  rect(625, 300, 250, 600);
  fill(to);
  rect(875, 300, 250, 600);
  
  fill(155, 155, 155);
  rect(490, 575, 200, 30, 15);
  
  fill(#000000);
  textSize(15);
  text("Dale a la Z para reiniciar la masacre.", 490, 580);
  
  if(jugadorGanador == 1)
  {
    textSize(25);
    text("Jugador 1", 500, 70);
    text("Buen trabajo, has fulminado a tus enemigos.", 500, 100);
  }
  else
  {
    textSize(25);
    text("Jugador 2", 500, 70);
    text("Bien hecho, has extinguido a tus contrincantes.", 500, 100);
  }
  
  if(personajeGanador == 1)
  {
    trompo.trompo_();
    trompo.escala = 1;
    trompo.x = 300;
    trompo.y = 170;
    fill(#000000);
    text("Juan, el Trompo Exterminador", 490, 500);
  }
  
  if(personajeGanador == 2)
  {
    balero.balero_();
    balero.balero_();
    balero.x = 530;
    balero.y = 200;
    balero.escala = 0.7;
    text("Franciso, el Balero Destructor", 490, 500);
  }
  
  if(personajeGanador == 3)
  {
    yoyo.yoyo_();
    yoyo.x = 420;
    yoyo.y = 190;
    yoyo.escala = 0.8;
    text("Pedro, el Yo-yo Devastador", 490, 500);
  }
  
  if(personajeGanador == 4)
  {
    control.control_();
    control.x = 300;
    control.y = 100;
    control.escala = 1;
    fill(#000000);
    text("Connor the Deadly SNES Controller", 490, 500);
  }
  
  if(personajeGanador == 5)
  {
    iPhone.iPhone_();
    iPhone.x = 420;
    iPhone.y = 170;
    iPhone.escala = 0.8;
    text("James the Malignant iPhone X", 493, 500);
  }
  
  if(keyPressed && (key == 'Z' || key == 'z'))
  {
    trompo.x = 90;
    trompo.y = 230;
    trompo.escala = 0.5;
    balero.x = 650;
    balero.y = 230;
    balero.escala = 0.4;
    yoyo.x = 90;
    yoyo.y = 610;
    yoyo.escala = 0.5;
    control.x = 885;
    control.y = 400;
    control.escala = 0.7;
    iPhone.x = 1300;
    iPhone.y = 150;
    iPhone.escala = 0.5;
    select = 1;
    ataqueUno = 0; 
    ataqueDos = 0;
    vidaUno = 0;
    vidaDos = 0;
    turno = 1;
    jugadorGanador = 0;
    personajeGanador = 0;
    pantalla = 1;
    barraUno = 300;
    barraDos = 300;
    v1 = 300;
    v2 = 300;
  }//Final de Key Z
  
  keyPressed = false;
  
}//Fin de Pantalla Cuatro

void barra()
{
  rectMode(CORNER);
  noStroke();
  fill(#ffe700); //Amarillo
  rect(100, 530, 300, 20, 5); //Barra uno
  rect(600, 530, 300, 20, 5); //Barra dos
  
  if(barraUno >= 0)
  {
    fill(#67080b); //Rojo
    rect(100, 530, barraUno, 20, 5); //Barra uno
  }
  if(barraDos >= 0)
  {
    fill(#67080b);
    rect(600, 530, barraDos, 20, 5); //Barra dos
  }
  rectMode(CENTER);
}//Final de la barra de vida

class forma
{
  int x, y;
  float escala;
  int ataque, vida;
  
  forma(int x_, int y_, float escala_, int ataque_, int vida_)
  {
    x = x_;
    y = y_;
    escala = escala_;
    ataque = ataque_;
    vida = vida_;
  }//Fin de constructor forma
  
void trompo_()
{
  scale(escala);
  
  //Sombrero
  fill(#fce658);
  noStroke();
  ellipse(x + 200, y + 45, 270, 70);
  
  fill(#fce658);
  //fill(#fce658);
  noStroke();
  ellipse(x + 200, y + 60, 90, 200);
  
  //Cuerpo
  fill(#f8d393);
  noStroke();
  ellipse(x + 200, y + 220, 80, 100);
  ellipse(x + 200, y + 210, 90, 100);
  fill(#74009b);
  ellipse(x + 200, y + 200, 100, 100);
  ellipse(x + 200, y + 190, 110, 100);
  ellipse(x + 200, y + 180, 120, 100);
  fill(#e8098e);
  ellipse(x + 200, y + 170, 130, 100);
  ellipse(x + 200, y + 160, 140, 100);
  ellipse(x + 200, y + 150, 150, 100);
  ellipse(x + 200, y + 140, 160, 100);
  fill(#d81c3f);
  ellipse(x + 200, y + 130, 170, 100);
  ellipse(x + 200, y + 120, 180, 100);
  ellipse(x + 200, y + 110, 190, 100);
  fill(#ffba18);
  ellipse(x + 200, y + 100, 200, 100);
  ellipse(x + 200, y + 110, 200, 100);
  ellipse(x + 200, y + 80, 150, 100);
  fill(#eed09d);
  triangle(x + 200, y + 290, x + 225, y + 260, x + 175, y + 260);
  fill(#74009b);
  rectMode(CENTER);
  
  //Ojo izquierdo
  noStroke();
  fill(255);
  ellipse(x + 165, y + 150, 45, 60);
  fill(0);
  ellipse(x + 165, y + 150, 20, 30);
  
  //Ojo derecho
  noStroke();
  fill(255);
  ellipse(x + 235, y + 150, 45, 60);
  fill(0);
  ellipse(x + 235, y + 150, 20, 30);
  
  //Ceja izquierda
  strokeCap(ROUND);
  stroke(0);
  strokeWeight(7);
  noFill();
  line(x + 145, y + 100, x + 190, y + 130);
  
  //Ceja derecha
  strokeCap(ROUND);
  stroke(0);
  strokeWeight(7);
  noFill();
  line(x + 260, y + 100, x + 210, y + 130);
  
  //Sombrero 2da capa
  fill(#fce658);
  noStroke();
  ellipse(x + 200, y + 45, 270, 70);
  
  //Detalles sombrero
  strokeWeight(5);
  stroke(255, 0, 0);
  line(x + 150, y + 40, x + 200, y + 60);
  line(x + 200, y + 60, x + 250, y + 40);
  
  stroke(#ffffff);
  line(x + 160, y + 20, x + 200, y + 40);
  line(x + 200, y + 40, x + 240, y + 20);
  
  stroke(#106b21);
  line(x + 165, y, x + 200, y + 20);
  line(x + 200, y + 20, x + 235, y);
  
  float mejora = 1/escala;
  scale(mejora);
}

void balero_()
{
  scale(escala);
  
  //Palo
  fill(#EED09D);
  noStroke();
  rectMode(CENTER);
  rect(x + 185, y + 100, 50, 250, 30);
  
  fill(#EED09D);
  noStroke();
  rectMode(CENTER);
  rect(x + 185, y + 120, 80, 50, 30);
  
  //Pie izquierdo
  stroke(0);
  strokeWeight(5);
  strokeCap(ROUND);
  noFill();
  line(x + 170, y + 270, x + 170, y + 440);
  
  noStroke();
  fill(0);
  ellipseMode(CENTER);
  ellipse(x + 170, y + 440, 10, 10);
  
  //Pie derecho
  stroke(0);
  strokeWeight(5);
  strokeCap(ROUND);
  noFill();
  line(x + 200, y + 370, x + 200, y + 440);
  
  noStroke();
  fill(0);
  ellipseMode(CENTER);
  ellipse(x + 200, y + 440, 10, 10);
  
  //Maraca izquierda
  fill(#e1c83f);
  noStroke();
  rectMode(CENTER);
  rect(x, y + 210, 10, 55, 70);
  
  fill(#ab3135);
  noStroke();
  ellipseMode(CENTER);
  ellipse(x, y + 180, 40, 50);
  
  //Maraca derecha
  fill(#e1c83f);
  noStroke();
  rectMode(CENTER);
  rect(x + 370, y + 210, 10, 55, 70);
  
  fill(#ab3135);
  noStroke();
  ellipseMode(CENTER);
  ellipse(x + 370, y + 180, 40, 50);
  
  //Brazo derecho
  noFill();
  stroke(0);
  strokeWeight(3);
  line(x + 280, y + 250, x + 370, y + 220);
  
  fill(2);
  ellipseMode(CENTER);
  ellipse(x + 370, y + 220, 10, 10);
  
  //Brazo izquierdo
  noFill();
  stroke(0);
  strokeWeight(3);
  line(x + 90, y + 250, x, y + 220);
  
  fill(2);
  ellipseMode(CENTER);
  strokeWeight(3);
  ellipse(x, y + 220, 10, 10);
  
  //Cuerpo
  fill(#F8D393);
  noStroke();
  ellipse(x + 160, y + 250, 150, 250);
  fill(#F8D393);
  noStroke();
  ellipse(x + 210, y + 250, 150, 250);
  fill(#F8D393);
  noStroke();
  rectMode(CENTER);
  rect(x + 185, y + 250, 100, 250, 30);
  
  //Detalles cuerpo
  stroke(#a31d21); //Rojo
  strokeWeight(10);
  strokeCap(ROUND);
  line(x + 95, y + 200, x + 185 , y + 150);
  line(x + 185, y + 150, x + 275, y + 200);
  
  stroke(#ffffff);
  line(x + 90, y + 220, x + 185 , y + 170);
  line(x + 185, y + 170, x + 280, y + 220);
  
  stroke(#e1c83f); //Amarillo
  line(x + 95, y + 300, x + 185, y + 350);
  line(x + 185, y + 350, x + 275, y + 300);
  
  stroke(#464a4b); //Azul
  line(x + 90, y + 280, x + 185, y + 330);
  line(x + 185, y + 330, x + 280, y + 280);
  
  //Ojo izquierdo
  noStroke();
  fill(255);
  ellipse(x + 140, y + 195, 50, 75);
  fill(0);
  ellipse(x + 140, y + 195, 25, 45);
  
  //Ojo derecho
  noStroke();
  fill(255);
  ellipse(x + 230, y + 195, 50, 75);
  fill(0);
  ellipse(x + 230, y + 195, 25, 45);
  
  //Ceja izquierdo
  strokeCap(PROJECT);
  stroke(0);
  strokeWeight(10);
  noFill();
  line(x + 120, y + 130, x + 175, y + 190);
  
  //Ceja derecha
  strokeCap(PROJECT);
  stroke(0);
  strokeWeight(10);
  noFill();
  line(x + 250, y + 130, x + 190, y + 190);
  
  //Detalles maraca izquierda
  fill(#ffffff);
  ellipseMode(CENTER);
  noStroke();
  ellipse(x + 10, y + 180, 5, 5);
  ellipse(x + 5, y + 170, 5, 5);
  ellipse(x + 1, y + 190, 5, 5);
  ellipse(x - 5, y + 170, 5, 5);
  ellipse(x - 6, y + 180, 5, 5);
  
  //Detalles marca derecha
  fill(#ffffff);
  ellipseMode(CENTER);
  noStroke();
  ellipse(x + 370, y + 200, 5, 5);
  ellipse(x + 360, y + 190, 5, 5);
  ellipse(x + 380, y + 180, 5, 5);
  ellipse(x + 380, y + 190, 5, 5);
  
  float mejora = 1/escala;
  scale(mejora);
}

void yoyo_()
{ 
  scale(escala);
  //Cuerda
  strokeWeight(5);
  stroke(#ffffff);
  noFill();
  bezier(x + 150, y + 100, x + 250, y, x + 200, y + 300, x + 375, y + 280);
  
  //Cuerpo
  noStroke();
  ellipseMode(CENTER);
  fill(#e8098e); //Magenta-Rosa
  ellipse(x + 200, y + 200, 300, 300);
  stroke(#ffba18); //Amarillo
  strokeWeight(5);
  ellipse(x + 200, y + 200, 290, 290);
  noStroke();
  fill(#d81c3f); //Rosa-Rojo
  ellipse(x + 200, y + 200, 250, 250);
  noStroke();
  fill(#009a95); //Cian
  ellipse(x + 200, y + 200, 200, 200);
  noStroke();
  fill(#74009b); //Magenta
  ellipse(x + 200, y + 200, 150, 150);
  stroke(#ffffff); //Blanco
  strokeWeight(10);
  ellipse(x + 200, y + 200, 100, 100);
  noStroke();
  fill(#ffba18); //Amarillo
  ellipse(x + 200, y + 200, 70, 70);
  noStroke();
  fill(#c79056); //Marrón
  ellipse(x + 200, y + 200, 25, 25);
  
  //Ojo derecho
  noStroke();
  fill(#ffffff);
  ellipse(x + 160, y + 80, 50, 100);
  fill(0);
  ellipse(x + 160, y + 80, 25, 50);
  
  //Ojo izquierdo
  fill(#ffffff);
  ellipse(x + 240, y + 80, 50, 100);
  fill(0);
  ellipse(x + 240, y + 80, 25, 50);
  
  //Ceja derecha
  stroke(0);
  strokeWeight(8);
  strokeCap(ROUND);
  line(x + 130, y + 5, x + 200, y + 60);
  
  //Ceja izquierda
  line(x + 200, y + 60, x + 260, y + 5);
  
  //Aro
  stroke(#ffffff);
  strokeWeight(5);
  noFill();
  ellipseMode(CENTER);
  ellipse(x + 400, y + 300, 60, 60);
  
  //Bigote
  noStroke();
  fill(0);
  ellipseMode(CENTER);
  ellipse(x + 260, y + 160, 130, 40); //Derecha
  ellipse(x + 140, y + 160, 130, 40); //Izquierda
  
  float mejora = 1/escala;
  scale(mejora);
}

void control_()
{ 
  scale(escala);
  //Pierna izquierda
  strokeWeight(5);
  strokeCap(ROUND);
  stroke(#000000);
  line(x + 160, y + 250, x + 160, y + 330);
  
  //Pierna derecha
  line(x + 220, y + 250, x + 220, y + 330);
  
  //Pie izquierdo
  noStroke();
  fill(#000000);
  ellipseMode(CENTER);
  ellipse(x + 156, y + 330, 15, 15);
  
  //Pie derecho
  ellipse(x + 226, y + 330, 15, 15);
  
  //Cuerpo
  fill(#cec9cc);
  noStroke();
  rectMode(CENTER);
  rect(x + 200, y + 190, 200, 130);
  
  //Detalles
  fill(#cec9cc);
  ellipseMode(CENTER);
  ellipse(x + 100, y + 200, 150, 150); //Izquierda
  ellipse(x + 300, y + 200, 150, 150); //Derecha
  fill(#908a99); //Gris
  ellipse(x + 300, y + 200, 130, 130); //Círculo derecho
  noFill();
  stroke(#000000);
  strokeWeight(1);
  ellipse(x + 100, y + 200, 90, 90); //Círculo izquierdo
  
  //Teclas izquierdas
  noStroke();
  rectMode(CENTER);
  fill(#211a21);
  rect(x + 100, y + 200, 60, 20, 5); //Horizontal
  rect(x + 100, y + 200, 20, 60, 5); //Vertical
  
  //botones centrales
  strokeWeight(8);
  stroke(#211a21);
  strokeCap(ROUND);
  line(x + 160, y + 230, x + 180, y + 215); //Botón izquierdo
  line(x + 200, y + 230, x + 220, y + 215); //Botón derecho
  
  //Detalles botones izquierdas
  stroke(#cec9cc);
  strokeWeight(36);
  strokeCap(ROUND);
  line(x + 270, y + 200, x + 300, y + 170); //Azul
  line(x + 300, y + 230, x + 330, y + 200); //Azul marino
  
  //botones izquierdas
  noStroke();
  fill(#b5b6e4); //Azul
  ellipseMode(CENTER);
  ellipse(x + 270, y + 200, 30, 30); //Abajo
  ellipse(x + 300, y + 170, 30, 30); //Arriba
  
  fill(#4f43ae); //Azul marino
  ellipse(x + 330, y + 200, 30, 30); //Arriba
  ellipse(x + 300, y + 230, 30, 30); //Abajo
  
  //Ojo izquierdo
  noStroke();
  fill(#ffffff);
  ellipseMode(CENTER);
  ellipse(x + 160, y + 130, 40, 80);
  
  //Ojo derecho
  ellipse(x + 220, y + 130, 40, 80);
  
  //Iris derecha
  fill(#2e764b);
  ellipse(x + 160, y + 130, 20, 40);
  
  //Iris izquierda
  ellipse(x + 220, y + 130, 20, 40);
  
  //Ceja izquierda
  strokeWeight(5);
  strokeCap(SQUARE);
  stroke(#000000);
  line(x + 140, y + 80, x + 190, y + 110);
  
  //Ceja derecha
  line(x + 190, y + 110, x + 240, y + 80);
  
  float mejora = 1/escala;
  scale(mejora);
}

void iPhone_()
{
  scale(escala);
  //Cuerpo
  noStroke();
  fill(#ccc7b9);
  rectMode(CENTER);
  rect(x + 200, y + 160, 200, 340, 50);
  
  //Contorno
  strokeWeight(4);
  stroke(0);
  noFill();
  rectMode(CENTER);
  rect(x + 200, y + 160, 205, 345, 50);
  
  //Botón
  strokeWeight(1);
  stroke(0);
  fill(#e2d4ba);
  ellipseMode(CENTER);
  ellipse(x + 200, y + 300, 40, 40);
  
  //Pantalla
  noStroke();
  rectMode(CENTER);
  fill(#5bc0eb);
  rect(x + 200, y + 160, 190, 220);
  
  //Bocina
  strokeWeight(1);
  stroke(0);
  fill(#e2d4ba);
  rectMode(CENTER);
  rect(x + 200, y + 30, 50, 15, 30);
  
  //Cámara
  stroke(0);
  strokeWeight(1);
  fill(#e2d4ba);
  ellipseMode(CENTER);
  ellipse(x + 200, y + 8, 15, 15);
  noStroke();
  fill(0);
  ellipseMode(CENTER);
  ellipse(x + 200, y + 8, 5, 5);
  
  //Ojo izquierdo
  noStroke();
  fill(#ffffff);
  ellipseMode(CENTER);
  ellipse(x + 160, y + 100, 50, 80);
  noStroke();
  fill(0);
  ellipseMode(CENTER);
  ellipse(x + 160, y + 100, 25, 40);
  
  //Ojo derecho
  noStroke();
  fill(#ffffff);
  ellipseMode(CENTER);
  ellipse(x + 240, y + 100, 50, 80);
  noStroke();
  fill(0);
  ellipse(x + 240, y + 100, 25, 40);
  
  //Ceja izquierda
  strokeWeight(8);
  stroke(0);
  strokeCap(SQUARE);
  line(x + 135, y + 40, x + 200, y + 100);
  
  //Ceja derecha
  line(x + 200, y + 100, x + 265, y + 40);
  
  //Pierna izquierda
  strokeWeight(4);
  line(x + 170, y + 330, x + 170, y + 420);
  
  //Pierna derecha
  strokeWeight(4);
  line(x + 230, y + 330, x + 230, y + 420);
  
  //Brazo izquierdo
  strokeWeight(3);
  line(x + 95, y + 160, x + 20, y + 140);
  
  //Brazo derecho
  strokeWeight(3);
  line(x + 300, y + 160, x + 380, y + 140);
  
  //Pie derecho
  noStroke();
  fill(0);
  ellipseMode(CENTER);
  ellipse(x + 233, y + 415, 15, 15);
  
  //Pie izquierdo
  ellipse(x + 167, y + 415, 15, 15);
  
  //Mano izquierda
  ellipse(x + 20, y + 140, 13, 13);
  
  //Mano derecha
  ellipse(x + 380, y + 140, 13, 13);
  
  float mejora = 1/escala;
  scale(mejora);
}
  
}//Fin de class forma
