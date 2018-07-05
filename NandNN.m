%input perseptrons
p=[0 0 1 1;0 1 0 1];
%Output Perseptrons
t=[1 1 1 0];
%creation of new pereceptron
net = newp([0 1;0 1],1)
%plot input/outpur
plotpv(p,t);
grid on;
%train the perceptron at 100 iterations
net.trainParam.passes=100;
%assign perceptron to net value
[net,a,e]=train(net,p,t);
%Border Line of the Active function
figure(1)
plotpc(net.iw{1,1},net.b{1})

%To plot the mesh Surface
y = ones(11,11);
input = 0:0.1:1;
for i = 0:10
    for j = 0:10
        y(i + 1,j + 1) = sim(net,[i/10;j/10]);
        %%plot(i+1,j+1,y(i+1,j+1));
        %%hold on;
    end
end
figure(2);
mesh(input,input,y)
colormap([1 0 0; 0 1 1])
disp(sim(net,[0.01 ; 0.087]))
