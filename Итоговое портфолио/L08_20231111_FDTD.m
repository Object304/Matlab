% This is a 1D FDTD simulation of psi. 

clear all, close all, clc

datetime(clock)

NN = 400;             % Number of points in the problem space.
hbar = 1.054e-34;     % Plank's constant
m0 = 9.1e-31;         % Free space mass of an electron
meff = 1.0;           % Effective mass: Si is 1.08, Ge is 0.067, GaAs is 0.55
melec = meff*m0;      % Mass of an electron
eV2J = 1.6e-19;       % Energy conversion factors
J2eV = 1/eV2J;

dx = .1e-9;        % The cell size
dt = 2e-17;           % Time steps 
ra = (0.5*hbar/melec)*(dt/dx^2);  % ra must be < .15
DX = dx*1e9;       % Cell size in nm.
XX = (DX:DX:DX*NN);   % Length in nm for plotting

% --- Specify the potential ---------------------
 
V=zeros(1,NN);

% ---------------------------------------------------
% Initialize a sine wave in a gaussian envelope

lambda = 50;         % Pulse wavelength
sigma = 50;          % Pulse width
nc = 150;            % Starting position
prl = zeros(1,NN);   % The real part of the state variable
pim = zeros(1,NN);   % The imaginary part of the state variable
ptot = 0.;

%
n=2:NN-1;
prl = exp(-1.*((n-nc)./sigma).^2).*cos(2*pi.*(n-nc)./lambda) ;
pim = exp(-1.*((n-nc)./sigma).^2).*sin(2*pi.*(n-nc)./lambda) ;
ptot = sum(prl.^2 + pim.^2);
%
pnorm = sqrt(ptot);    % Normalization constant

% Normalize and check
ptot = 0.;
prl = prl./pnorm;
pim = pim./pnorm;
ptot = ptot + sum(prl.^2 + pim.^2);

ptot                   % This should have the value 1

T = 0;
n_step = 1;

count = 1;
prl = [0, prl, 0];
pim = [0, pim, 0];
asked = false;

while count < 4
    if asked == false
    n_step = input('How many time steps  -->');
    asked = true;
    end
    if n_step < 0 
        return 
    end
    % -----------This is the core FDTD program -------------
    
    T = T + 1;
    mid=2:NN-1;
    left = mid - 1;
    right = mid + 1;
    
    prl(mid) = prl(mid) - ra.*(pim(left) -2.*pim(mid) + pim(right)) ...
       + (dt/hbar).*V(mid).*pim(mid);
    
    pim(mid) = pim(mid) + ra.*(prl(left) -2.*prl(mid) + prl(right)) ...
       - (dt/hbar).*V(mid).*prl(mid);
    
    
    % ------------------------------------------------------
    
    % Calculate the expected values
    if n_step == 1
        PE = 0.;
        psi = prl + i*pim;    % Write as a complex function
        PE = PE + sum(psi.*transpose(psi').*V);
        
        psi*psi'                % This checks normalization
        PE = PE*J2eV;           % Potential energy
    
        ke = 0. + j*0.;
        lap_p = psi(right) - 2*psi(mid) + psi(left);
        ke = ke + sum(lap_p*psi(mid)');
        KE = -J2eV*((hbar/dx)^2/(2*melec))*real(ke); % Kinetic energy
    
        subplot(3,1,count)
        plot(XX,prl,'k') 
        hold on
        plot(XX,pim,'-.r')
        plot(XX,J2eV*V,'--k')
        hold off
        axis( [ 1 DX*NN -.2 .3 ])
        TT = text(5,.15,sprintf('%7.0f fs',T*dt*1e15));
        set(TT,'fontsize',12)
        TT = text(5,-.15,sprintf('KE = %5.3f eV',KE));
        set(TT,'fontsize',12)
        TT = text(25,-.15,sprintf('PE = %5.3f eV',PE));
        set(TT,'fontsize',12)
        TT = text(25,.13,sprintf('E_t_o_t = %5.3f eV',KE+PE));
        set(TT,'fontsize',12)
        xlabel('nm')
        set(gca,'fontsize',12)
        T
        
        count = count + 1;
        asked = false;
        
    end
    n_step = n_step - 1;
end