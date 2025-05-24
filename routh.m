function [] = routh(n)
%length input vector
coeff=length(n);
%--------
a=coeff/2;
A=round(a);
m=0;
z=0;
%--------
%making the table
%The number of sentences is even
if mod(coeff,2)==0 
    table_even=zeros(coeff,A);
%First and second row
  for j=1:a
   table_even(1,j)=n(1,(2*m+1));
   table_even(2,j)=n(1,(2*z+2));
      z=z+1;
      m=m+1;
  end
%The third row is up to the last one
for k=3:coeff-1
      for l=1:A-1
          y=table_even(k-1,1);
        table_even(k,l)=(table_even(k-1,1)*table_even(k-2,l+1)-table_even(k-2,1)*table_even(k-1,l+1))/y;
      end
end
%the last row
table_even(coeff,1)=n(1,coeff);
%answer
%*************************
fprintf('\n Routh-Hurwitz Table:\n')
table_even 
%*************************
Right_poles_even=0;
for i=1:coeff-1
    if sign(table_even(i,1))*sign(table_even(i+1,1))==-1
        Right_poles_even=Right_poles_even+1;
    end
end
fprintf('\n Number Of Right Poles =%2.0f\n',Right_poles_even)

%------------------------------------------
%The number of sentences is odd
elseif mod(coeff,2)==1
    table_odd=zeros(coeff,A);
%First and second row
    for q=1:A
    table_odd(1,q)=n(1,(2*m+1));
    if q==A
        table_odd(2,A)=0;
    elseif q~=A
    table_odd(2,q)=n(1,(2*z+2));
    end
      z=z+1;
      m=m+1;
    end
%The third row is up to the last one
 for c=3:coeff-1
      for p=1:A-1
          x=table_odd(c-1,1);
        table_odd(c,p)=(table_odd(c-1,1)*table_odd(c-2,p+1)-table_odd(c-2,1)*table_odd(c-1,p+1))/x;
      end
 end
%the last row
table_odd(coeff,1)=n(1,coeff);
%answer
%***********************************
fprintf('\n Routh-Hurwitz Table:\n')
table_odd 
%***********************************
Right_poles_odd=0;
for i=1:coeff-1
    if sign(table_odd(i,1))*sign(table_odd(i+1,1))==-1
        Right_poles_odd=Right_poles_odd+1;
    end
end
fprintf('\n Number Of Right Poles =%2.0f\n',Right_poles_odd)

end

fprintf('\n Given Polynomials Coefficents Roots :\n')
ROOTS=roots(n)



end
