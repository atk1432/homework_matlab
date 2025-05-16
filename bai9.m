s = tf('s');

G1 = tf(1, 1);
G2 = tf(1, 1);
G3 = tf(1, 1);
G4 = tf(1, 1);
G5 = tf(1, 1);
H1 = 1/s^2;


G1.u = 'ig1'; G1.y = 'og1';
G2.u = 'og1'; G2.y = 'og2';
G3.u = 'og2'; G3.y = 'og3';
G4.u = 'ig4'; G4.y = 'y';
G5.u = 'og1'; G5.y = 'og5';
H1.u = 'y'; H1.y = 'oh1';

S1 = sumblk('ig1 = r - oh1 - og2');
S2 = sumblk('ig4 = og3 + og5');

sys = connect(G1, G2, G3, G4, G5, H1, S1, S2, 'r', 'y');


% minreal(tf(sys))
ltiview({'step';'impulse';'nyquist';'bode'}, sys)
