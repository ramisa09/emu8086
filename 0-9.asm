.model small
.stack 100h
.data
    msg db 'The digits from 0 to 9 are: $'
.code
main proc
    mov ax,@data
    mov ds,ax    
    
    mov ah,9
    lea dx,msg
    int 21h
                  
    mov bh,10 
    mov bl,'0'
    
    print_digit:
        mov dl,bl
        mov ah,2
        int 21h  
        
        inc bl
        dec bh
        jnz print_digit
        
        mov ah,4ch
        int 21h
        main endp
end main
    
    


