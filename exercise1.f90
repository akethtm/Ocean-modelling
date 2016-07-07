program decay_problem

 real C1,C2     ! implicit and explicit
 real C1N,C2N   ! implicit and explicit next tiem step 
 real C3        ! analytical solution 
 integer n,ntot
 real lambda
 real dt
 real efold
 real time

 lambda = 1e-04
 dt = 0.2/lambda
 ntot = 20 
 efold = 1.0/lambda
 time = 0.0
  

 C1 = 100.0
 C2 = 100.0
 C3 = 100.0

 open(10, file = "decay.txt", form = "formatted" ) 
 write(10,*), time/efold,C1,C2,C3 

 do n=1,ntot
    
    time = REAL(n)*dt 
    C1N = C1 * (1 - lambda * dt )
    C2N = C2 / (1 + lambda * dt )
    C3  = 100.0 * exp(-lambda * time) 
    C1 = C1N
    C2 = C2N
    !print *, time/efold,C1,C2,C3
    WRITE(10,*) time/efold,C1,C2,C3
     

 enddo       
  

end program decay_problem
