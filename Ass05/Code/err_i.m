function errore = err_i(xpar , range_H , H_exp) 
%ERR_I Summary of this function goes here
%   ASS05

% if (size(xpar,1)~= 8 || size(xpar,2)~= 1 )
%     error('Not valid xpar');
% end
% 
% if(size(range_H,1) ~= size(H_exp,1))
%     error('Not valid lengths');
% end

csii= xpar(1);
w0i=xpar(2);
Aj = xpar(3);
Bj = xpar(4);
Cj = xpar(5);
Dj = xpar(6);
Ej = xpar(7);
Fj = xpar(8);



% m_i =1;
% c_i = 2*xpar(1,:).*xpar(2,:);
% k_i =  xpar(2,:).^2;

omega = 2*pi.*range_H;

if(nnz(ismember(range_H,0)) ~=0)
    omega = omega + 1e-04;
end

%vpar=[1; 2*xpar(1)*xpar(2); xpar(2)^2; xpar(3:8)];
%     [m;   c = 2 m w0 csi; k = w0^2 m; A;B;C;D;E;F];

% Controllo su w0i e csii negative


%m_i = 1;
%m_i = Aj;

H_anal = (Aj + 1i*Bj )./(-omega.^2 + 2*1i*omega.*(csii.*w0i) + w0i.^2) ...
          + (Cj + 1i*Dj).*ones(size(omega)) + (Ej + 1i*Fj)./(omega.^2);
%H_anal = (Aj)./(-omega.^2 + 2*1i*omega.*(csii.*w0i) + w0i.^2);
% H_anal = (Aj./m_i)./(-omega.^2 + 2*1i*omega.*(csii.*w0i) + w0i.^2);
% H_anal = (Aj)./(- m_i.*omega.^2 + 1i*c_i.*omega + k_i);

% errore 
c_e = H_exp - H_anal; %complex error
real_e = (real(c_e));
imag_e = (imag(c_e));
errore = [real_e; imag_e];
end

