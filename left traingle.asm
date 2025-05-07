.model small
.stack 100h
.data   
    inputmsg db 'Enter the line number (1-9) : $'
    outputmsg db 'The left-reversed triangle by * is : $'
.code
main proc
    mov ax,@data
    mov ds,ax    
    
    mov ah,9
    lea dx,inputmsg
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov ch,al
    mov cl,al
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    
    mov ah,9
    lea dx,outputmsg
    int 21h
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h 
    
    
    next_line:
    mov bh,ch
        print_star:
        mov ah,2
        mov dl,'*'
        int 21h
        dec bh
        jnz print_star
            
            mov ah,2
            mov dl,10
            int 21h
            mov dl,13
            int 21h
            
            dec ch
            jnz next_line
            
     exit:
     mov ah,4ch
     int 21h
     main endp
end main
    
    



