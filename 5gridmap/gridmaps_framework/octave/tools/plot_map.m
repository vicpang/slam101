function plot_map(map, mapBox, robPoseMapFrame, poses, laserEndPntsMapFrame, gridSize, offset, t)

	close all
%	figure 
f=figure(1);
	%axis(mapBox);
	map = map';
	%imshow(ones(size(map)) - log_odds_to_prob(map))
    imagesc(map)
    %s=size(map);
    %s=s(1:2);
	%s = size(map)(1:2); 
    
    
    %set(gcf, 'position', [50 50 s*5]) 
    %set(gca, 'position', [.05 .05 .9 .9]) 
	traj = [poses(1:t,1)';poses(1:t,2)'];
	traj = world_to_map_coordinates(traj, gridSize, offset);
    hold on;
	plot(traj(1,:),traj(2,:),'g')
    hold on;
	plot(robPoseMapFrame(1),robPoseMapFrame(2),'bo','markersize',5,'linewidth',4)
	hold on;
    plot(laserEndPntsMapFrame(1,:),laserEndPntsMapFrame(2,:),'ro','markersize',2)
    filename = sprintf('../plots/gridmap_%03d.png', t);
	print(filename, '-dpng');
	close all;

end
