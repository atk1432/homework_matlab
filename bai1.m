% G1 = tf(1, 1);
% G2 = tf(1, 1);
% G4 = tf(1, 1);
% H2 = tf(1, 1);
% G3 = tf(1, [1 0]);
% H1 = tf([1 0], 1);

% gtd1 = G2 * G3 + G4;
% gtd2 = feedback(1, H1 * G2);
% gtd3 = feedback(gtd1 * gtd2, H2);
% sys = feedback(gtd3 * G1, 1);
% minreal(tf(sys))
% ltiview({'step';'impulse';'nyquist';'bode'}, sys)

G1 = tf(1, 1);
G2 = tf(1, 1);
G4 = tf(1, 1);
H2 = tf(1, 1);
G3 = tf(1, [1 0]);
H1 = tf([1 0], 1);

G1.InputName = "ig1";
G1.OutputName = 'og1';

G2.InputName = 'ig2';
G2.OutputName = 'og2';

G3.InputName = 'ig2';
G3.OutputName = 'og3';

G4.InputName = 'ig2';
G4.OutputName = 'og4';

H1.InputName = 'og2';
H1.OutputName = 'oh1';

H2.InputName = 'y';
H2.OutputName = 'oh2';

S1 = sumblk('ig1 = r - y');
S2 = sumblk('ig2 = og1 - oh1 - oh2');
S3 = sumblk('y = og3 + og4');

sys = connect(G1, G2, G3, G4, H1, H2, S1, S2, S3, 'r', 'y');
% minreal(tf(sys))
ltiview({'step';'impulse';'nyquist';'bode'}, sys)
