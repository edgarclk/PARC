function simulateRRT_error_plot(trueQuad, virt_x, controller, dt)

tau = 0:dt:dt*length(controller);
error = max(abs(virt_x - trueQuad.xhist([1 5 9],:)));

f = figure;
f.Color = 'white';
for i = 1:length(virt_x)-1
  if controller(i)
    color = 'r';
  else
    color = 'b';
  end
  
  plot(tau(i), error(i), '.', 'color', color);
  
  if i == 1
    hold on
  end
end

xlabel('Time (s)')
ylabel('Tracking error')

grid on
box on
xlim([0, max(tau)])
ylim([0, 0.45])

tc = plot(1000, 1000, 'r.');
lc = plot(1000, 1000, 'b.');

legend([tc lc], {'Optimal tracking', 'LQR'})
end