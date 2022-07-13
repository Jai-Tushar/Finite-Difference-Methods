%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%                Project MATH F422                 %%%%%%%%%%%%%%%%%
%%%%%%%%   Submitted by: Anmol Chopra (2015A1PS0702G)     %%%%%%%%%%%%%%%%%
%%%%%%%%                 Jai Tushar (2017PHXP0020G)       %%%%%%%%%%%%%%%%%
%%%%%%%%   Problem: u_t=u_xx+lambda*(u*(1-u)-a*u/(1+b*u)) %%%%%%%%%%%%%%%%%
%%%%%%%%   Conditions: 1)Dirichelet boundary              %%%%%%%%%%%%%%%%%
%%%%%%%%                 u(x0,t)=0, u(xN,t)=0; t>0        %%%%%%%%%%%%%%%%%
%%%%%%%%               2)Neumman boundary                 %%%%%%%%%%%%%%%%%
%%%%%%%%                 u_x(x0,t)=0, u_x(xN,t)=0; t>0    %%%%%%%%%%%%%%%%%
%%%%%%%%               3)Mixed boundary I                 %%%%%%%%%%%%%%%%%
%%%%%%%%                 u=0 at x=0, u_x=0 at x=1; t>0    %%%%%%%%%%%%%%%%%        
%%%%%%%%               4)Robin boundary                   %%%%%%%%%%%%%%%%%
%%%%%%%%                 u(x0,t)+u_x(x0,t)=0,             %%%%%%%%%%%%%%%%%
%%%%%%%%                 u(xN,t)+u_x(xN,t)=0; t>0         %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function project_I(N,lambda,a,b,tol,delt)
    x0=0;
    xN=1;
    h=(xN-x0)/N;
    t0=0;
    tf=1;
    n=input('Specify boundary condition: ');
    switch n
        case 1
            for j=1:N-1
                x(j)=h*j;
                U0(j)=sin(pi*x(j));
            end
            F=zeros(N-1,1);
            A=zeros(N-1,N-1);
            U1=zeros(N-1,1);
            mu=delt/(h^2);
            nt=fix((tf-t0)/delt);
            U=zeros(N-1,1);
            error=1000;
            k=0;
            t=0;
            while error>tol
                F(1)=(1+2*mu)*U(1)-mu*U(2)-lambda*delt*(U(1)*(1-U(1))-a*U(1)/(1+b*U(1)))-U0(1);
                for i=2:N-2
                    F(1)=-mu*U(i-1)+(1+2*mu)*U(i)-mu*U(i+1)-lambda*delt*(U(i)*(1-U(i))-a*U(i)/(1+b*U(i)))-U0(i);
                end
                F(1)=-mu*U(N-2)+(1+2*mu)*U(N-1)-lambda*delt*(U(N-1)*(1-U(N-1))-a*U(N-1)/(1+b*U(N-1)))-U0(N-1);
                for i=1:N-1
                    A(i,i)=1+2*mu-lambda*delt*(1-2*U(i)-((a*U(i)/(1+b*U(i))^2)));
                end
                for i=1:N-2
                    A(i,i+1)=-mu;
                    A(i+1,i)=-mu;
                end
                DT=A\F;
                U1=U-DT;
                k=k+1;
                error=max(abs(U1-U));
                U=U1;
                t=t+delt;
            end
            plot(x,U1,'-k');
        case 2
            for j=1:N
                x(j)=j*h;
                U0(j)=sin(pi*x(j));
            end
            F=zeros(N,1);
            A=zeros(N,N);
            U1=zeros(N,1);
            mu=delt/(h^2);
            nt=fix((tf-t0)/delt);
            U=zeros(N,1);
            error=1000;
            k=0;
            t=0;
            while error>tol
                F(1)=(1+2*mu)*U(1)-2*mu*U(2)-lambda*delt*(U(1)*(1-U(1))-a*U(1)/(1+b*U(1)))-U0(1);
                for i=2:N-1
                    F(i)=-mu*U(i-1)+(1+2*mu)*U(i)-2*mu*U(i+1)-lambda*delt*(U(i)*(1-U(i))-a*U(i)/(1+b*U(i)))-U0(i);
                end
                F(1)=-2*mu*U(N-1)+(1+2*mu)*U(N)-lambda*delt*(U(N)*(1-U(N))-a*U(N)/(1+b*U(N)))-U0(N);
                for i=1:N
                    A(i,i)=1+2*mu-lambda*delt*(1-2*U(i)-(a*U(i)/(1+b*U(i))^2));
                end
                A(1,2)=-2*mu;
                for i=2:N-1
                    A(i,i+1)=-mu;
                    A(i+1,i)=-mu;
                end
                A(N,N-1)=-2*mu;
                DT=A\F;
                U1=U-DT;
                k=k+1;
                error=max(abs(U1-U));
                U=U1;
                t=t+delt;
            end
            plot(x,U1,'-k');
        case 3
            for j=1:N-1
                x(j)=h*j;
                U0(j)=sin(pi*x(j));
            end
            F=zeros(N-1,1);
            A=zeros(N-1,N-1);
            mu=delt/(h^2);
            nt=fix((tf-t0)/delt);
            U=zeros(N-1,1);
            error=1000;
            k=0;
            t=0;
            while error>tol
                F(1)=(1+2*mu)*U(1)-2*mu*U(2)-lambda*delt*(U(1)*(1-U(1))-a*U(1)/(1+b*U(1)))-U0(1);
                for i=2:N-1
                    F(i)=-mu*U(i-1)+(1+2*mu)*U(i)-2*mu*U(i+1)-lambda*delt*(U(i)*(1-U(i))-a*U(i)/(1+b*U(i)))-U0(i);
                end
                for i=1:N-1
                    A(i,i)=1+2*mu-lambda*delt*(1-2*U(i)-((a*U(i)/(1+b*U(i))^2)));
                end
                A(1,2)=-2*mu;
                for i=2:N-1
                    A(i,i+1)=-mu;
                    A(i+1,i)=-mu;
                end
                DT=A\F;
                U1=U-DT;
                k=k+1;
                error=max(abs(U1-U));
                U=U1;
                t=t+delt;
            end
            plot(x,U1);
        case 4
            for j=1:N
                x(j)=h*j;
                U0(j)=sin(pi*x(j));
            end
            F=zeros(N,1);
            A=zeros(N,N);
            U1=zeros(N,1);
            mu=delt/(h^2);
            nt=fix((tf-t0)/delt);
            U=zeros(N,1);
            error=1000;
            k=0;
            t=0;
            while error>tol
                F(1)=(1+2*mu-2*mu*h)*U(1)-2*mu*U(2)-lambda*delt*(U(1)*(1-U(1))-a*U(1)/(1+b*U(1)))-U0(1);
                for i=2:N-1
                    F(i)=-mu*U(i-1)+(1+2*mu)*U(i)-2*mu*U(i+1)-lambda*delt*(U(i)*(1-U(i))-a*U(i)/(1+b*U(i)))-U0(i);
                end
                F(N)=-2*mu*U(N-1)+(1+2*mu-2*mu*h)*U(N)-lambda*delt*(U(N)*(1-U(N))-a*U(N)/(1+b*U(N)))-U0(N);
                A(1,1)=1+2*mu-2*mu*h;
                A(1,2)=-2*mu;
                for i=2:N
                    A(i,i)=1+2*mu;
                    A(i,i+1)=-mu;
                    A(i+1,i)=-mu;
                end
                A(N,N-1)=-2*mu;
                A(N,N)=1+2*mu-2*mu*h;
                DT=A\F;
                U1=U-DT;
                k=k+1;
                error=max(abs(U1-U));
                U=U1;
                t=t+delt;
            end
        otherwise
            disp('Give a valid condition');
    end
end
                    