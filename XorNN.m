net = feedforwardnet([3]);

P = [0 0; 0 1; 1 0; 1 1; 0 0; 0 1; 1 0; 1 1; 0 0; 0 1; 1 0; 1 1; 0 0; 0 1; 1 0; 1 1]';
T = [0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0]; % desired output
net = configure(net, P, T);
net.trainParam.goal = 1e-8;
net.trainParam.epochs = 1000;
net = train(net, P, T);
sim(net, P)

figure(1)
plotpv(P,T);
grid on;
plotpc(net.iw{1,1},net.b{1})


y = ones(11,11);
input = 0:0.1:1;
for i = 0:10
    for j = 0:10
        y(i + 1,j + 1) = sim(net,[i/10;j/10]);
       
    end
end
figure(2);
mesh(input,input,y)
colormap([1 0 0; 0 1 1])

