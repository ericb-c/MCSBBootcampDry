% Simulate a discrete-time dynamical system

% x- population of RABBITS in thousands
% n- time in WEEKS

K=.6;
x0=.2;
x=zeros(100,1);x(1)=x0;
for r=0:.1:3
    for k=2:100
        x(k)=x(k-1)+r*(1-x(k-1)/K)*x(k-1);
    end
    %if x(end0-3)-x(end)
    plot(r,x(end-3:end),'*')
end

nMax = 20;% max number of days to simulate
x = ones(1,nMax); % population
x(1) = 0.2; % initial condition

for n=2:nMax
    
    x(n) = 1.1*x(n-1);
    
end % finished loop through days

figure;
plot(x,'-ok');
ylabel('Rabbits (in thousands)');
xlabel('Weeks');