s = tf('s');

G1 = s;
G2 = tf(1, 1);
G3 = tf(1, 1);
H1 = tf(1, 1);
G4 = 1/s;

gtd1 = feedback(G3 * G4, 1);
gtd2 = feedback(G1 * G2, 1);
sys = feedback(gtd1 * gtd2, H1 * 1/G4 * 1/G1, 1);

% G1.InputName = 'ig1';
% G1.OutputName = 'og1';

% G2.InputName = 'ig2';   
% G2.OutputName = 'og2';

% G3.InputName = 'ig3';
% G3.OutputName = 'og3';

% H1.InputName = 'og3';
% H1.OutputName = 'oh1';

% G4.InputName = 'og3';
% G4.OutputName = 'y';

% S1 = sumblk('ig1 = r - og2');
% S2 = sumblk('ig2 = og1 + oh1');
% S3 = sumblk('ig3 = og2 - y');


% sys = connect(G1, G2, G3, H1, G4, S1, S2, S3, 'r', 'y');
minreal(tf(sys))
% ltiview({'step';'impulse';'nyquist';'bode'}, sys)
