figure(1), clf
plot(x(:,1),x(:,2))
grid on
xlabel('Capacitor Voltage')
ylabel('Inductor Current')
hold on
plot(Vdes,Ides,'kd')

%%
figure(2), clf

subplot(2,1,1)
plot(t,x(:,1))
grid on
xlabel('Time')
ylabel('Capacitor Voltage')
hold on
plot(t,Vdes*ones(size(t)),'k--')

subplot(2,1,2)
plot(t,x(:,2))
grid on
xlabel('Time')
ylabel('Inductor Current')
hold on
plot(t,Ides*ones(size(t)),'k--')

%%

figure(3), clf

subplot(2,1,1)
plot(t,x(:,3))
axis([0 t(end) -0.5 1.5])
xlabel('Time')
ylabel('Switch')

subplot(2,1,2)
plot(t,x(:,4))
axis([0 t(end) -0.5 1.5])
xlabel('Time')
ylabel('Memory State')

%%
if (delay>0)
    figure(4), clf
    plot(t,x(:,5))
    grid on
    xlabel('Time')
    ylabel('Delay Timer During Delays')
    axis([0 t(end) 0 delay])
end