classdef dlList 
    properties    %different fields in class dlList
      t
      j
      fill     %current filled up list
      max      %set the capacity of the list
    end
    methods  
        function obj=dlList                  %Constructor 
            obj.max=10000;
            obj.t=zeros(obj.max,1);
            obj.j=zeros(obj.max,1);  
            obj.fill=0;
        end
        function obj=add(obj, newt, newj) %problem where to add, static method and call by obj.add(value)/Mutator to change the internal state of the object
            switch obj.fill
                case 0
                    obj.t(1)=newt;
                    obj.j(1)=newj;
                    obj.fill=obj.fill+1;
                otherwise
                    if(newt<=obj.t(1:obj.fill))
                        for m=obj.fill:-1:1
                            obj.t(m+1)=obj.t(m);
                            obj.j(m+1)=obj.j(m);
                        end
                        obj.t(1)=newt;
                        obj.j(1)=newj;        
                    elseif(newt>=obj.t(1:obj.fill))
                        obj.t(obj.fill+1)=newt;
                        obj.j(obj.fill+1)=newj;            
                    else
                        k=min(find(newt<obj.t)); %cant find max and newt> than value since it contains 0 in obj.t too
                        for i=obj.fill:-1:k
                        obj.t(i+1)=obj.t(i);
                        obj.j(i+1)=obj.j(i);
                        end
                        obj.t(k)=newt;
                        obj.j(k)=newj;
                    end
                    obj.fill=obj.fill+1;
            end
        end  
        function obj=remove(obj)  %rmove the first row but need to update the rest/mutator to change the internal state of the object
            if obj.fill==0
             error('There is nothing to remove')
            elseif obj.fill==1
             obj.t(1)=0;
             obj.j(1)=0;
             obj.fill=0;
            else 
             obj.fill=obj.fill-1;
             for i=1:obj.fill
             obj.t(i)=obj.t(i+1);
             obj.j(i)=obj.j(i+1);
             end
             obj.t(obj.fill+1)=0;
             obj.j(obj.fill+1)=0;  
            end
        end
        function[firetime rxn]=fire(obj)
            if obj.fill>0
            firetime=obj.t(1);
            rxn=obj.j(1);
            else
            firetime=inf;
            rxn=0;
            end
        end
        function display(obj)
            if obj.fill == 0
                disp('Empty List'); 
            else
            disp([obj.t(1:obj.fill)   obj.j(1:obj.fill)]);
            end
        end
        function fill=length(obj)   %This method return the length of the filled list (non zero elements)---Accessor 
            fill=obj.fill;
        end
    end %end method
end %end classdef
        
        
        
     