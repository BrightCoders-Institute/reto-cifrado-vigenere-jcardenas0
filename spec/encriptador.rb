#Definimos función para encriptar el código
def encriptarMensaje (mensaje,clave)   ##Recibimos los parámetros del usuario "mensaje" y "clave"
    clave1=0                            #Contador
    largoClave = clave.length           #longitud de la palabra clave
    textoCifrado= ""                    #Aqui vamos a poner el mensaje cifrado
    
    mensaje.each_char do |letra|              #interamos sobre el mensaje recibido,
        if letra =~ /[A-Za-z]/                #si es parte del alfabeto, realizamos el encriptado
            letraClave = clave[clave1]        #Analizamos la cadena en cada posición
            clave1 = (clave1 +1) % largoClave #Aumenta el contador hasta llegar al límite de la cadena

            base = letra =~ /[a-z]/ ? "a".ord : "A".ord  #transfromamos las letras en numeros para manupularlos
            comparadorLetra = letra.ord - base           #comparamos la diferencia entre el valor obtenido de "base" y el de "letra"
            comparadorClave = letraClave.downcase.ord - "a".ord #igual comparación

            encriptadorLetra = (base + (comparadorLetra + comparadorClave)% 26).chr #Se suman los valores obtenidos anteriormente y se dividen entre 26 para que esté 
                                                                                    #dentro del alfabeto, el resultado se transforma a caracter
            textoCifrado<< encriptadorLetra    #Se construye el nuevo mensaje encriptado

            else
                textoCifrado <<letra           #si el mensaje no es una letra, pasa igual
            end
        end

        return textoCifrado
end


def obtenerDatos                              #obtenemos datos del usuario y los guardamos en variables para mandarlos a la función
    puts "Ingresa un mensaje"
    mensaje = gets.chomp
    puts "Ingresa una clave secreta"
    clave = gets.chomp 
    return mensaje, clave
end

#mensaje = "RUBY"
#clave= "CODEC"
mensaje, clave = obtenerDatos()
mensajeVigenere = encriptarMensaje(mensaje, clave)
puts "#{mensajeVigenere}"
