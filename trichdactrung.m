function x=trichdactrung(Ibw)
x=zeros(256,1);
for hang=1:16
    for cot=1:16,
        x((hang-1)*16+cot,1)=sum(sum(Ibw(8*(hang-1)+1:8*hang,...
                                8*(cot-1)+1:8*cot)));
    end;
end;
end