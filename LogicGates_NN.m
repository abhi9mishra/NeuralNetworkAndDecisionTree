%Program for neural network of OR Gate
clc; clear all; 

disp('1.OR');
disp('2.AND');
disp('3.NOR');
disp('4.NAND');

choice = input('Enter Choice - ');
sprintf('\n');

switch choice
    case 1
        input=[0 0; 0 1;1 0; 1 1];      
        expected_output=[0 1 1 1];    
    case 2
        input=[0 0; 0 1;1 0; 1 1];     
        expected_output=[0 0 0 1];     
    case 3
        input=[0 0; 0 1;1 0; 1 1];     
        expected_output=[1 0 0 0];     
    case 4
        input=[0 0; 0 1;1 0; 1 1];     
        expected_output=[1 1 1 0];     
end


l_rate=0.5;                     % Learning Rate
weight_mat=rand(2,1);           % Weight Matrix
bias=-1*rand(1,1);              % Bias
nn_output=zeros(4,1);           % Output of Neural Network

disp('BEFORE DEPLOYING NETWORK');
disp('Learning Rate = ');
disp(l_rate);
disp('Weight Matrix = ');
disp(weight_mat);
disp('Bias = ');
disp(bias);

num=1;
while (num<2000)
    for i=1:4
        nn_output(i)=input(i,:)*weight_mat+bias;
        if nn_output(i)>=0
            nn_output(i)=1;
        else
            nn_output(i)=0;
        end
        error=l_rate*(expected_output(i)-nn_output(i));     %Calculating Error
        bias=bias+error;                                    %Calculating New Bias
        weight_mat = weight_mat + input(i,:)'.*error;       %Updating Weight Matrix      
    end
    num = num + 1;
end

disp('AFTER DEPLOYING NETWORK (2000 epoch)');
disp('Weight Matrix = ');
disp(weight_mat);

testing_result=[0.01 0.87]*weight_mat+bias;          % TESTING ON INPUT
if testing_result>=0                           % RESULT
    testing_result=1;
else
    testing_result=0;
end
                         

disp('TESTING');
disp('INPUT = 0.01 0.87');
disp('RESULT = ');
disp(testing_result);


slope=weight_mat(1)/weight_mat(2);
intercept=bias/weight_mat(2);
x=[];
y=[];
for i=-1:2
    x= [x,i];
    y=[y,-slope*i-intercept];
end
plot(x,y);hold on,
scatter(input(:,1),input(:,2),'ro');