S=[8.51 8.14 7.78 7.4 7.04 6.67 6.30 5.93 5.55 5.17 4.80 4.42 4.03 3.65 3.27 2.88 2.50 2.11 1.72 1.34 0.95 0.56 0.17 -0.22 -0.61 -1.00 -1.39 -1.78 -2.17 -2.56];
enlem=37.21;
for i=1:30
ws(i)=rad2deg((acos(-1*tan(deg2rad(enlem))*tan(deg2rad(S(i))))));
end

Eo=[0.9814 0.9819 0.9823 0.9828 0.9833 0.9838 0.9843 0.9848 0.9854 0.9859 0.9864 0.9869 0.9875 0.9880 0.9885 0.9891 0.9896 0.9902 0.9907 0.9913 0.9918 0.9924 0.9930 0.9935 0.9941 0.9947 0.9953 0.9959 0.9964 0.9970];

Isc=1367;

H1=24/pi*1367*0.9814*(pi*96.52/180*sin(pi/180*8.51)*sin(pi/180*37.21)+cos(pi/180*8.51)*cos(pi/180*37.21)*sin(pi*96.52/180));
for i=1:30
    Ho(i)=24/pi*1367*Eo(i)*(pi*ws(i)/180*sin(pi/180*S(i))*sin(pi/180*37.21)+cos(pi/180*S(i))*cos(pi/180*37.21)*sin(pi*ws(i)/180));
end

H=[5477.73 5024.16 5231.7555 5052.072 4748.529 5125.341 5538.206 4556.634 3729.741 4024.5615 4196.104 4493.832 4123.998 4371.717 2086.422 1839.866 5547.51 5442.84 5559.14 5229.4295 4888.089 4828.776 4875.296 4102.4825 3414.568 4738.062 4643.859 4382.184 1707.284 3558.78];

for i=1:30
    kt(i)=H(i)/Ho(i);
end

gnler=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30];

kttrans = cell2mat(num2cell(transpose(kt)));

plot(gnler,H)
xlabel('Günler')
ylabel('Günlük Global Radyasyon W/m^2 gün')
title('Günlük Global Radyasyon')
grid on
gnler= gca; % get the current axes object
gnler.XTick = 0:1:30; % set the XTick property to 0, 2, 4, 6, 8, 10

% plot(gnler,kt)
% xlabel('Günler')
% ylabel('kt=H/Ho')
% title('Açıklık İndeksi Aylık Dağılımı')
% grid on
% gnler= gca; % get the current axes object
% gnler.XTick = 0:1:30; % set the XTick property to 0, 2, 4, 6, 8, 10
for i=1:30
    DH(i)=0.910+1.154*kt(i)-4.936*kt(i)^2+2.848*kt(i)^3;
end
dhtrans = cell2mat(num2cell(transpose(DH)))
for i=1:30
    D(i)=DH(i)*H(i);
end
dhtrans = cell2mat(num2cell(transpose(DH)));



