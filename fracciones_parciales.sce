function [A,B,t]=fracparr(a,b,c,r)  //donde a=la constante del denominador,r  valor del equiv//alente al capacitor,b el coeficiente de s del numerador y c es el valor de Re o k.
    h=1   //declaramos la altura, propuesta por nosotros de nuestro tanque inicialmente.
    x1=0    // variables usadas para graficar.
    x2=20   //variables usadas para graficar.
  t=c*r     // obtenemos el valor de Tao con respecto al calor de c y r.
    A=c/a    // obtenemos el numerador de la funcion escalon. 
    B=b-((t*c)/a)  // obtenemos el numerador de la funcion a resolver.
    printf('Result is: \n (%.1f /s)+(%.1f/(%.1f s+%.1f))\n',A,B,t,a)  // imprimimos la solu-//cion de las fracciones parciales.
     //f = A*(1/s) + B*(ts+a);
     printf('Inverse Laplace Transform: \n %.1f +%.1f /%.1f  e^(%.1f t)\n',A,B,t,a) // impri//mimos la transformada inversa de la funcion obtenida por las fracciones parciales
   n = 0:0.1:15  // utilizamos n para poder graficar.
  resultado = A + (B/t)*exp((-a/t)*n); // guardamos en la variable resultado la funcion des-//pues de realizarse la transformada inversa de laplace.
  if t==0 then  // en caso de que nuestro Tao sea 0  significa que nuestra funcion al realizarse la transformada inversa de laplace obtendriamos solo la funcion impulso de dirac, la cual representa un impulso en un intervalo de tiempo muy pequeño, de esta forma, al no poder ser graficable ese impulso, forzamos una respuesta en el cual la altura se mantiene cosntante ya que la entrada es igual a la salida por lo tanto es como si no hubiera un contenedor y la altura se mantendria constante.
      plot([x1,x2],[h,h])
     else
      plot(n,resultado)   // en caso de que Tao sea diferente de cero obtendriamos una grafica que representaria el comportamiento de la altura de nuestro tanque con respecto a nuestra entrada y salida.
  end
   
endfunction

