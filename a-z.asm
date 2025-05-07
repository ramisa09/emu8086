.model small
.stack 100h
.data
    msg db 'Here printed A to Z: $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg
    int 21h
    
    mov bh,65
    mov ch,26
    
    print_letter:
        mov ah,2
        mov dl,bh
        int 21h  
              
        inc bh
        dec ch
        jnz print_letter
        
    mov ah,4ch
    int 21h
    main endp
end main