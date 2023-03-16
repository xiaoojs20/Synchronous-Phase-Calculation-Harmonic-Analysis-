%用于分析必做间谐波的幅值及频率
clc;
clear all;
signal = readmatrix('1_9.csv'); %load 数据
s=signal(1:2048,2);
fs=10000; 
N=length(s); 
n=0:N-1;
w=0.5-0.5*cos(2*pi*(n)/N);
w_signal=s.*w';
fft_sig=fft(w_signal,N);%X上面一道杠f
fftsig_z=abs(fft_sig)/N*2*2;%求幅值并进行修正
stem(fftsig_z);

u=abs(fft_sig);%插值要用未经过修正的FFT结果;
%5
Y11=u(5);%最大幅值在第5个点
Y21=u(6);%次最大的幅值在第6个点
bn1=(Y21-Y11)/(Y21+Y11);
an1=1.5*bn1;
An1=(Y11+Y21)*(2.35619403+1.15543628*an1^2+0.32607873*an1^4+0.07891461*an1^6)/N;%间谐波幅值
kn1=5-1+an1+0.5;
Fn1=kn1*fs/N;%间谐波频率
%16
Y12=u(17);
Y22=u(18);
bn2=(Y22-Y12)/(Y22+Y12);
an2=1.5*bn2;
An2=(Y12+Y22)*(2.35619403+1.15543628*an2^2+0.32607873*an2^4+0.07891461*an2^6)/N;%间谐波幅值
kn2=16-1+an2+0.5;
Fn2=kn2*fs/N;%间谐波频率
%44
Y13=u(46);
Y23=u(47);
bn3=(Y23-Y13)/(Y23+Y13);
an3=1.5*bn3;
An3=(Y13+Y23)*(2.35619403+1.15543628*an3^2+0.32607873*an3^4+0.07891461*an3^6)/N;%间谐波幅值
kn3=44-1+an3+0.5;
Fn3=kn3*fs/N;%间谐波频率
%48
Y14=u(58);
Y24=u(59);
bn4=(Y24-Y14)/(Y24+Y14);
an4=1.5*bn4;
An4=(Y14+Y24)*(2.35619403+1.15543628*an4^2+0.32607873*an4^4+0.07891461*an4^6)/N;%间谐波幅值
kn4=48-1+an4+0.5;
Fn4=kn4*fs/N;%间谐波频率

An=[An1;An2;An3;An4];
kn=[kn1;kn2;kn3;kn4];
Fn=[Fn1;Fn2;Fn3;Fn4];

total=[An';kn';Fn'];
display(total);