class Stack { // LIFO (=Last In First Out)
 int[] values = new int[10];
 int size; // speichert die derzeitige Größe (Höhe) des Stapels
 void push(int element) { // legt das Element oben auf den Stapel
   values[size++] = element;
 }
 int pop() { // entfernt den obersten Wert des Stapels und gibt ihn zurück
   return values[--size]; // dadurch dass size verringert wird, wird der Stapel nicht mehr angezeigt, toArray und drawTower(Stack s, int x)
 }
 int[] toArray() { // gibt den Stapel als Array aus
  int[] out = new int[size]; // Array ist so groß wie die derzeitige Größe (Höhe) des Stapels
  for (int i = 0; i <= size - 1; i++) { // kopiere nur belegte Werte
    out[i] = values[i];
  }
  return out;
 }
}

Stack s1, s2, s3;  // jeder Turm ist ein Stapel
Stack selected;  // man wählt einen Turm aus

void setup() {
  size(600, 300); // width and height screen
  fill(0);  // schwarzer Hintergrund (Scheiben aka Rechtecke)
  rectMode(CENTER); // rectMode(CENTER) interprets the first two parameters of rect() as the shape's center point, while the third and fourth parameters are its width and height, inb. drawTower(Stack s, int x) method
  s1 = new Stack();
  s2 = new Stack();
  s3 = new Stack();
  for (int i = 6; i >= 1; i--) { // 6 ist die unterste Scheibe und 1 die oberste Scheibe
   s1.push(i); 
  }
}

void mousePressed() {
 if (selected == null) { // keine Scheibe asugewählt (Treffe Auswahl der Scheibe)
   if (mouseX <= 200) 
     selected = s1;
   else if (mouseX <= 400)
     selected = s2;
   else
     selected = s3;
 } else { // Wähle Zielturm
   Stack target;
   if (mouseX <= 200)
     target = s1;
   else if (mouseX <= 400)
     target = s2;
   else
     target = s3;
   /*
   Die oberste Scheibe des ausgewählten Stapels wird nur dann auf den Zielturm gelegt wird, wenn 
   1. der Zielturm leer ist oder 
   2. die oberste Scheibe des ausgewählten Stapels kleiner als die oberste Scheibe des Zielturms ist.
   */
   if (target.size == 0 || selected.values[selected.size - 1] < target.values[target.size - 1])
     target.push(selected.pop()); // Scheibe verschieben
   selected = null;  // Auswahlturm zurücksetzen
 }
}


void draw() {
  background(255);  // weißer Hintegrund
  drawTower(s1, 100);
  drawTower(s2, 300);
  drawTower(s3, 500);
}

void drawTower(Stack s, int x) { // Zeichnet Scheiben und Stäbe
  int[] arr = s.toArray();
  for (int i = 0; i <= arr.length - 1; i++) {
    rect(x, height - (30 + i * 25), arr[i] * 30, 20); // Scheiben aka Rechtecke zeichnen
  }
  rect(x, height / 2, 10, height - 20); // Stab zeichnen
} //<>//
