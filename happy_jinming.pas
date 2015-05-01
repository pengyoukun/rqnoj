program happy_jinming;
	var
		v:array [1..25] of integer;
		w:array [1..25] of longint;
		N,m:integer;
		sum:longint;
		money:integer;
		tmp:longint;
		i:integer;
	procedure init;
		var
			i:integer;
		begin
			read(N,m);
			for i:=1 to m do
				begin
					read(v[i],w[i]);
					w[i]:=w[i]*v[i];
				end;
		end;
	procedure zhengli;
		var
			i,j,temp:integer;
			var:boolean;
		begin
			for i:=1 to m-1 do
				for j:=i+1 to m do
					begin
						if w[i]<w[j] then
							begin
								temp:=w[i];
								w[i]:=w[j];
								w[j]:=temp;
								temp:=v[i];
								v[i]:=v[j];
								v[j]:=temp;
							end;
					end;
		end;
	procedure dig(i:integer);
		begin
		        while i<=m do
				begin
					flag:=money+v[i]<=N;
                	if flag then begin
						sum:=sum+w[i];
						money:=money+v[i];
					end;
					dig(i+1);inc(i);
                    if flag then begin
                    	sum:=sum-w[i-1];
						money:=money-v[i-1];
					end;
				end;
			if sum>tmp then tmp:=sum;
		end;
	begin
		init;
		zhengli;
		dig(1);
		write(tmp);
	end.

