syms t;
T = 2*pi; %Period
w0 = 2*pi/T; %Angular Frequency
N = 640; %Number of terms

%Step Function
%Period is set to be 2
f = sign(cos(t));

%a0 constant term
a0 = double(1/T*int(f, t, 0, T));

%array of sin and cosine coefficients
a = zeros(N, 1);
b = zeros(N, 1);

for i = 1:N
    %calculate and store the coefficients based on fourier series formula
    funa = @(t) sign(cos(pi.*t)).*cos(i.*w0.*t);
    funb = @(t) sign(cos(pi.*t)).*sin(i.*w0.*t);

    %each individual value has a function
    a(i) = 2/T*integral(funa, 0, T);
    b(i) = 2/T*integral(funb, 0, T);
end

%0 to 3 with 0.01 increments
tnum = 0:0.01:2*pi;

%funtion being graphed
%intial first term is just a0
fnum = a0;

terms = 5; %counts how many terms are being displayed
frame = 1; %counts which frame the animation is on (not useful)

for i=1:N
    %summation of the terms from a and b
    %each loop iteration, one element from a and b are added
    fnum = fnum + a(i)*cos(i*w0*tnum) + b(i)*sin(i*w0*tnum);

    if i == terms %shows graph with 5, 10, 20...640 terms
        plot(tnum, fnum)
        title('Fourier series Animation');
        ylim([-1.5 1.5]);
        %display number of terms
        text(0.1, -1.3, ['Terms: ', int2str(terms)]);
        terms = terms * 2;
        
        %pause for arbitrary amount of time for animation
        pause(2);
    end
end
