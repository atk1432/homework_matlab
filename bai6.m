s = tf('s');

G1 = tf(1, 1);
G2 = tf(1, 1);
G3 = tf(1, 1);
G5 = tf(1, 1);
G6 = tf(1, 1);
H1 = tf(1, 1);
G4 = 1/s^2;
H2 = 1/s;


G1.u = 'r'; G1.y = 'og1';
G2.u = 'ig2'; G2.y = 'og2';
G3.u = 'og2'; G3.y = 'og3';
G4.u = 'ig4'; G4.y = 'og4';
G5.u = 'og4'; G5.y = 'og5';
G6.u = 'og2'; G6.y = 'og6';
H1.u = 'og4'; H1.y = 'oh1';
H2.u = 'og3'; H2.y = 'oh2';

S1 = sumblk('ig4 = og3 - oh1');
S2 = sumblk('y = og5 + og6');
S3 = sumblk('ig2 = og1 - oh2');

sys = connect(G1, G2, G3, G4, G5, G6, H1, H2, S1, S2, S3, 'r', 'y');


% minreal(tf(sys))
ltiview({'step';'impulse';'nyquist';'bode'}, sys)
