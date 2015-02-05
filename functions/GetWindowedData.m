% Function that returns the windowed data given the parameters. 
function Vwin = GetWindowedData(V, range, win_width, win_center, rescale_int, rescale_slope)

Vrs = (V*rescale_slope) + rescale_int;
Vbot = (Vrs <= (win_center - 0.5 - 0.5*(win_width - 1)));
Vtop = (Vrs > (win_center - 0.5 + 0.5*(win_width - 1)));
Vmid = ( ((Vrs - (win_center - 0.5))/(win_width - 1) + 0.5)*(range(2) - range(1)) + range(1) );
Vwin =  (~(Vbot + Vtop)).*Vmid + Vtop.*range(2) + Vbot.*range(1);

end
