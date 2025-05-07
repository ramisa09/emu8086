.model small
.stack 100h
.data
   msg db 'Enter the line number(0-9) : $'
.code
main proc 
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov ch,al
    mov cl,1
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    
    next_line:
        mov bh,ch
        print_space:
            mov ah,2
            mov dl,' '
            int 21h
            dec bh
            jnz print_space
            
        mov bl,cl
        print_star:
            mov ah,2
            mov dl,'*'
            int 21h
            dec bl
            jnz print_star
            
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    inc cl
    dec ch
    jnz next_line
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
    


