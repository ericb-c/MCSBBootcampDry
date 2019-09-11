% 1
e=.08;
a=.5;
b=.2;
dvdt=@(v)[v(1)-v(1).^3/3-v(2);e*(v(1)+a-b*v(2))];
[t,vw]=ode45(@(t,v)dvdt(v),[0 100],[0;0]);
plot(t,vw);xlabel('time');legend('voltage','ion pump activity')

% 2
e=.08;
a=1;
b=.2;
dvdt=@(v)[v(1)-v(1).^3/3-v(2);e*(v(1)+a-b*v(2))];
[t,vw]=ode45(@(t,v)dvdt(v),[0 100],[0;.5]);
plot(t,vw);xlabel('time');legend('voltage','ion pump activity')
% steady state in both cases, excitable in second case

% 3
I=@(t) (t>40).*(t<47) ;
a=1;
b=.2;
dvdt=@(v,t)[v(1)-v(1).^3/3-v(2)+I(t);e*(v(1)+a-b*v(2))];
[t,vw]=ode45(@(t,v)dvdt(v,t),[0 100],[0;.5]);
plot(t,vw);xlabel('time');legend('voltage','ion pump activity')

D=.9;
dvdt=@(dt,v)[v(1:10)-v(1:10).^3/3-v(11:end)++I(dt)+D*(circshift(v(1:10),-1)-2*v(1:10)+2*circshift(v(1:10),1));
    e*(v(1:10)+a-b*v(11:end))];
[T,vw]=ode45(@(dt,v)dvdt(dt,v),[0 100],[zeros(1,10) ones(1,10)*5]);
for k=1:10
    figure(1); hold on
    plot(t,vw(:,k))
end
for nt=1:10:593
    figure(2);clf; hold on;box on;
    plot(vw(nt,1:10));
    legend(sprintf('time is %d\n',nt))
    set(gca,'ylim',[-2.5,2.5])
    xlabel('Cell');
    ylabel('Voltage')
    drawnow;
end
