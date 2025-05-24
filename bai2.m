G1 = tf([1 0], 1);
G2 = tf(1, 1);
G3 = tf(1, [1 0]);
G4 = tf(1, 1);
H2 = tf(1, 1);
H1 = tf(1, 1);

G1.InputName = "ig1";
G1.OutputName = 'og1';

G2.InputName = 'ig2';
G2.OutputName = 'og2';

G3.InputName = 'og2';
G3.OutputName = 'og3';

G4.InputName = 'ig2';
G4.OutputName = 'og4';

H1.InputName = 'og2';
H1.OutputName = 'oh1';

H2.InputName = 'y';
H2.OutputName = 'oh2';

S1 = sumblk('ig1 = r - y - oh1');
S2 = sumblk('ig2 = og1 - oh2');
S3 = sumblk('y = og3 + og4');

sys = connect(G1, G2, G3, G4, H1, H2, S1, S2, S3, 'r', 'y');
% minreal(tf(sys))
ltiview({'step';'impulse';'nyquist';'bode'}, minreal(sys))
